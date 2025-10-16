# 🧠 XUnity.AutoTranslator-CustomTranslate-LLM-translate

这是一个基于 **[XUnity.AutoTranslator](https://github.com/bbepis/XUnity.AutoTranslator)** 修改的翻译后端，使用大语言模型（目前支持 DeepSeek）为 Unity 游戏提供高质量翻译服务。

## 📌 项目说明

- 本人仅修改了 **XUnity.AutoTranslator** 的部分源码，用于支持 **并行翻译请求**。原版只支持串行翻译，在界面多元素时速度较慢，修改后在使用 LLM 接口进行翻译时速度有显著提升。
- **关于 XUnity.AutoTranslator 的其他问题，请自行查阅其[官网文档](https://github.com/bbepis/XUnity.AutoTranslator)**。
- 本项目仅提供与大语言模型接口相关的翻译服务与启动脚本。

## ⚙️ 配置说明

编辑 `config.yaml` 来配置大语言模型接口（当前仅支持 DeepSeek）：

```yaml
model_name: "deepseek-chat"    # 模型名称
base_url: "https://api.deepseek.com"  # API 基础 URL
api_key: "your-api-key"       # 你的 API 密钥
```

> 后续可根据需求支持更多模型。

## 🚀 启动方式

1. **双击** `install_requirements.bat`  安装依赖  
2. **双击** `run.bat`  启动翻译服务  

⚠️ **注意事项**：  
- 8000 端口不能与其他程序冲突。  
- 翻译 API 的调用地址默认是：
  ```
  http://localhost:8000/?from={0}&to={1}&text={2}
  ```

## 🧩 XUnity.AutoTranslator 使用说明

1. 使用本项目自带的修改版 `XUnity.AutoTranslator`（不要使用原版）。  
2. 解压对应版本（BepInEx / MelonMod / IL2CPP / IPA）到游戏目录。  
3. 在 XUnity.AutoTranslator 的配置文件中添加翻译服务地址：
   ```ini
   [Service]
   Endpoint=http://localhost:8000/?from={0}&to={1}&text={2}
   ```

## 🪵 日志与排错

- 服务启动后，控制台会输出翻译请求与状态日志。  
- 如遇限流或错误，请检查 API Key、端口冲突或 DeepSeek 配额。

## 📝 许可证

本项目基于 **MIT License** 开源。  

👉 项目地址：[GitHub - XUnity.AutoTranslator-CustomTranslate-LLM-translate](https://github.com/yexi-by/XUnity.AutoTranslator-CustomTranslate-LLM-translate)  
👉 原项目地址：[XUnity.AutoTranslator](https://github.com/bbepis/XUnity.AutoTranslator)
