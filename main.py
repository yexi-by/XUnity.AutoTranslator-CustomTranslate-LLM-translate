from fastapi import FastAPI, Query, HTTPException
from fastapi.responses import PlainTextResponse
from openai import AsyncOpenAI
from openai_llm import OpenaiLlm
from pathlib import Path
import urllib.parse
import sys
from loguru import logger
from settings import api_key,base_url,model_name

logger.remove()
logger.add(
    sys.stderr,
    level="INFO",
    colorize=True,
    format="{time:YYYY-MM-DD HH:mm:ss.SSS} - {level: <8} - {message}"
)

app = FastAPI()
client = AsyncOpenAI(api_key=api_key, base_url=base_url)

def read_prompt_file(file_path: str) -> list:
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        return [{"role": "system", "content": content.strip()}]
    
system_messages=read_prompt_file(file_path=Path(__file__).parent / "prompt.txt")

@app.get("/", response_class=PlainTextResponse)
async def translate_get(
    from_lang: str = Query(..., alias="from", description="Source language"),
    to: str = Query(..., description="Target language"), 
    text: str = Query(..., description="Text to translate")
):
    logger.info(f"已经接受到get_post请求: from={from_lang}, to={to}, text={text}")
    decoded_text = urllib.parse.unquote(text)
    openai_service=OpenaiLlm(system_messages=system_messages, model_name=model_name, client=client)
    result = await openai_service.call_openai_json_api(user_message=decoded_text)
    logger.success(f"翻译完成!结果: {result}")
    return result["translatedText"]

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)


