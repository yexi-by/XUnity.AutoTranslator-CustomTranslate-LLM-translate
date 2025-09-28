@echo off
chcp 65001 >nul
title OpenAI Unity Translator - 一键运行
echo ================================================
echo          OpenAI Unity Translator
echo              一键运行脚本
echo ================================================
echo.

echo [INFO] 正在检查Python环境...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 未找到Python环境！请先安装Python 3.7+
    pause
    exit /b 1
)

echo [INFO] 正在检查依赖包...
pip show fastapi >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] 检测到缺少依赖包，正在安装...
    call install.bat
    if %errorlevel% neq 0 (
        echo [ERROR] 依赖安装失败！
        pause
        exit /b 1
    )
) else (
    echo [INFO] 依赖包检查完成
)

echo.
echo [INFO] 正在检查配置文件...
if not exist "config.yaml" (
    echo [WARNING] 未找到config.yaml配置文件！
    echo [INFO] 请配置API密钥后重新运行
    pause
    exit /b 1
)

echo [INFO] 启动翻译服务...
echo [INFO] 服务地址: http://localhost:8000
echo [INFO] 按 Ctrl+C 停止服务
echo.
echo ================================================
echo              服务正在运行中...
echo ================================================
echo.

uvicorn main:app --host 0.0.0.0 --port 8000 --reload

if %errorlevel% neq 0 (
    echo [ERROR] 服务启动失败！
    pause
    exit /b 1
)

pause
