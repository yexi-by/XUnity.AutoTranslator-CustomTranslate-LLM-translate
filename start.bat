@echo off
chcp 65001 >nul
title OpenAI Unity Translator - 服务启动
echo ================================================
echo          OpenAI Unity Translator
echo              服务启动脚本
echo ================================================
echo.

echo [INFO] 正在检查配置文件...
if not exist "config.yaml" (
    echo [ERROR] 未找到config.yaml配置文件！
    echo [INFO] 请先创建config.yaml并配置API密钥
    pause
    exit /b 1
)

if not exist "prompt.txt" (
    echo [WARNING] 未找到prompt.txt文件，将使用默认提示词
)

echo [INFO] 配置文件检查完成
echo.

echo [INFO] 正在启动翻译服务...
echo [INFO] 服务地址: http://localhost:8000
echo [INFO] 按 Ctrl+C 停止服务
echo.
echo ================================================
echo              服务正在运行中...
echo ================================================
echo.

uvicorn main:app --host 0.0.0.0 --port 8000 --reload

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] 服务启动失败！
    echo [INFO] 可能的原因：
    echo   - 端口8000已被占用
    echo   - 缺少必要的依赖包
    echo   - Python环境配置问题
    echo.
    echo [INFO] 请检查错误信息并重试
    pause
    exit /b 1
)

pause