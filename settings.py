import yaml
from loguru import logger

def load_yaml_config():
    try:
        with open('config.yaml', 'r', encoding='utf-8') as file:
            return yaml.safe_load(file)
    except FileNotFoundError:
        logger.error("配置文件 config.yaml 未找到。请确保文件存在于项目根目录。")
        return None  
    except yaml.YAMLError as e:
        logger.error(f"配置文件解析错误: {e}")
        return None

config = load_yaml_config()
api_key = config.get('api_key') if config else None
base_url = config.get('base_url') if config else None
model_name = config.get('model_name') if config else None
