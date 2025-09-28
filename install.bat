@echo off
chcp 65001 >nul
title OpenAI Unity Translator - 依赖安装
echo ================================================
echo          OpenAI Unity Translator
echo              依赖安装脚本
echo ================================================
echo.

echo [INFO] 正在检查Python环境...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 未找到Python环境！请先安装Python 3.7+
    echo [INFO] 下载地址: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [INFO] Python环境检查完成
echo.

echo [INFO] 正在升级pip...
python -m pip install --upgrade pip
if %errorlevel% neq 0 (
    echo [WARNING] pip升级失败，继续安装依赖...
)
echo.

echo [INFO] 正在安装项目依赖...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] 依赖安装失败！请检查网络连接或pip配置
    pause
    exit /b 1
)

echo.
echo ================================================
echo [SUCCESS] 所有依赖安装完成！
echo ================================================
echo.
echo 下一步：
echo 1. 编辑 config.yaml 配置你的API密钥
echo 2. 运行 start.bat 启动服务
echo 3. 或直接运行 run.bat 一键启动
echo.
pause