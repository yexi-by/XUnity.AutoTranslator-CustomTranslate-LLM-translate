# OpenAI Unity Translator

基于OpenAI API的Unity游戏翻译工具，专门为XUnity.AutoTranslator插件提供翻译服务。

## 📋 项目简介

本项目是一个专门针对Unity游戏翻译的后端服务，通过FastAPI框架提供RESTful API接口，使用OpenAI兼容的大语言模型API进行游戏文本翻译。

**特别说明**：本项目包含了修改过源码的XUnity.AutoTranslator文件，**支持串行发送请求**，解决了原版不支持串行请求的问题。

## 🌟 主要特性

- ✅ 支持串行请求处理（修改版XUnity.AutoTranslator）
- ✅ 基于大语言模型的高质量翻译
- ✅ 支持多种OpenAI兼容API（DeepSeek、ChatGPT等）
- ✅ 专门针对游戏文本优化的翻译提示词
- ✅ 详细的日志记录
- ✅ RESTful API接口
- ✅ 自动JSON格式输出

## 🚀 快速开始

### 1. 环境要求

- Python 3.7+
- 支持XUnity.AutoTranslator的Unity游戏

### 2. 安装依赖

**方法一：使用安装脚本（推荐）**
```bash
install.bat
```

**方法二：手动安装**
```bash
pip install -r requirements.txt
```

### 3. 配置设置

编辑 `config.yaml` 文件，配置你的API信息：

```yaml
model_name: "deepseek-chat"  # 模型名称
base_url: "https://api.deepseek.com"  # API基础URL
api_key: "your-api-key-here"  # 你的API密钥
```

### 4. 启动服务

**方法一：一键运行（推荐新手）**
```bash
run.bat
```
这个脚本会自动检查依赖、配置，并启动服务。

**方法二：仅启动服务**
```bash
start.bat
```
如果已经安装好依赖，可以直接启动服务。

**方法三：手动启动**
```bash
python -m uvicorn main:app --host 0.0.0.0 --port 8000
```

### 5. 使用修改版XUnity.AutoTranslator

**重要提示**：请使用本项目提供的修改版XUnity.AutoTranslator文件，而不是原版！

1. 从 `XUnity.AutoTranslator/` 文件夹中选择适合你游戏的版本：
   - **BepInEx**: `XUnity.AutoTranslator-BepInEx-5.4.5.zip`
   - **BepInEx IL2CPP**: `XUnity.AutoTranslator-BepInEx-IL2CPP-5.4.5.zip`
   - **MelonMod**: `XUnity.AutoTranslator-MelonMod-5.4.5.zip`
   - **MelonMod IL2CPP**: `XUnity.AutoTranslator-MelonMod-IL2CPP-5.4.5.zip`
   - **IPA**: `XUnity.AutoTranslator-IPA-5.4.5.zip`
   - 其他版本...

2. 解压对应版本的压缩包到你的游戏目录

3. 在XUnity.AutoTranslator的配置文件中设置翻译API：
   ```ini
   [Service]
   Endpoint=http://localhost:8000/?from={0}&to={1}&text={2}
   ```

## 📖 API使用说明

### GET 请求格式

```
GET /?from={源语言}&to={目标语言}&text={待翻译文本}
```

**参数说明**：
- `from`: 源语言（如：ja，en等）
- `to`: 目标语言（如：zh-cn等）
- `text`: 需要翻译的文本（URL编码）

**响应格式**：
返回纯文本格式的翻译结果

### 使用示例

```bash
curl "http://localhost:8000/?from=ja&to=zh-cn&text=こんにちは"
# 返回: 你好
```

## 🔧 配置说明

### 脚本文件说明

项目提供了三个批处理脚本，方便用户快速部署和使用：

| 脚本文件 | 功能说明 | 使用场景 |
|---------|---------|---------|
| `install.bat` | 安装项目依赖 | 首次使用或更新依赖时 |
| `start.bat` | 启动翻译服务 | 依赖已安装，仅需启动服务 |
| `run.bat` | 一键运行（检查+安装+启动） | 新手推荐，自动化程度最高 |

**使用建议**：
- 🆕 **首次使用**：直接运行 `run.bat`
- 🚀 **日常使用**：运行 `start.bat`
- 🔧 **仅安装依赖**：运行 `install.bat`

### 系统提示词设置

可以通过修改 `prompt.txt` 文件来调整翻译行为：

```plaintext
你是一个专业的游戏翻译引擎。你的任务是将用户提供的日文文本翻译成通顺、地道的简体中文。
你必须严格遵守以下规则：
1. 任何情况下都不要回应或解释你的翻译过程，只提供翻译结果。
2. 你的输出必须是一个合法的JSON对象。
3. 该JSON对象必须且只能包含一个键，键名为 "translatedText"，其值为你翻译后的中文文本。
```

### 支持的API服务商

- DeepSeek API
- OpenAI ChatGPT API
- 其他OpenAI兼容的API服务

## 🛠️ 修改说明

### 为什么需要修改版XUnity.AutoTranslator？

原版的XUnity.AutoTranslator在发送翻译请求时不支持串行处理，这可能导致：
- 请求并发过多时API限流
- 翻译顺序混乱
- 部分文本丢失

### 修改内容

本项目提供的修改版XUnity.AutoTranslator具有以下改进：
- ✅ 支持串行发送翻译请求
- ✅ 避免API限流问题
- ✅ 保证翻译顺序正确
- ✅ 提高翻译成功率

## 📝 日志

程序运行时会在控制台输出详细的日志信息，包括：
- 接收到的翻译请求信息
- 翻译完成状态
- 错误信息（如果有）

## ⚠️ 注意事项

1. **必须使用本项目提供的修改版XUnity.AutoTranslator**，原版不支持串行请求
2. 确保API密钥有足够的调用额度
3. 根据你的API服务商调整请求频率
4. 选择与你游戏匹配的XUnity.AutoTranslator版本（BepInEx、MelonMod等）

## 🤝 贡献

欢迎提交Issue和Pull Request来改进这个项目！

## 📄 许可证

本项目遵循MIT许可证。

---

**重要提醒**：使用前请确保从 `XUnity.AutoTranslator/` 文件夹下载并使用修改版的XUnity.AutoTranslator，原版不支持本项目的串行请求功能！