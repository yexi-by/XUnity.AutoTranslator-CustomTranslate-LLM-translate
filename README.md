# OpenAI Unity Translator

基于 FastAPI 和 OpenAI 兼容模型的 Unity 游戏翻译后端，为 XUnity.AutoTranslator 提供串行翻译支持。

## 功能亮点
- 修改版 XUnity.AutoTranslator，原生支持串行请求，避免限流和乱序。
- 统一的 RESTful API，兼容 DeepSeek、ChatGPT 等大模型服务。
- 针对游戏文本优化的提示词与自动 JSON 输出。
- 完整日志记录，便于排查问题。

## 快速开始
1. 安装环境：Python 3.7+，并准备可使用 XUnity.AutoTranslator 的 Unity 游戏。
2. 安装依赖：运行 `install.bat` 或 `pip install -r requirements.txt`。
3. 配置服务：编辑 `config.yaml`，填写 `model_name`、`base_url`、`api_key` 等信息。
4. 启动接口：
   - 推荐：`run.bat`（自动检查依赖与配置）。
   - 已配置环境：`start.bat` 或 `python -m uvicorn main:app --host 0.0.0.0 --port 8000`。

## 修改版 XUnity.AutoTranslator
1. 从 `XUnity.AutoTranslator/` 目录选择与你游戏匹配的压缩包（BepInEx、MelonMod、IPA 等）。
2. 解压至游戏目录，并在配置文件的 `[Service]` 段落设置：
   ```
   Endpoint=http://localhost:8000/?from={0}&to={1}&text={2}
   ```
3. 必须使用本项目提供的修改版以确保串行请求生效。

## API 调用
- 请求：`GET /?from=源语言&to=目标语言&text=待翻译文本`（`text` 需 URL 编码）。
- 响应：返回翻译后的纯文本。

## 实用脚本
- `run.bat`：一键检查依赖并启动服务。
- `start.bat`：直接启动已配置的服务。
- `install.bat`：单独安装或更新依赖。

## 注意事项
- 确认 API Key 额度充足，并按服务商要求控制请求频率。
- 运行日志会输出请求、完成状态与错误信息，可用于排查。

## 许可与贡献
- 许可：MIT。
- 欢迎通过 Issue 或 PR 参与改进。
