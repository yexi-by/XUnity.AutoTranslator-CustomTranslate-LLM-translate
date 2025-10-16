chcp 65001
@echo off
REM 检查 Python 是否已安装
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ❌ 未检测到 Python，请先安装 Python 并将其添加到系统 PATH。
    pause
    exit /b
) ELSE (
    echo ✅ 检测到 Python 环境。
)

REM 确保使用的是正确的 pip
echo 🔹 检查 pip 是否可用...
python -m pip --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ❌ pip 未安装，正在尝试安装 pip...
    python -m ensurepip
)

REM 升级 pip（可选）
echo 🔸 升级 pip...
python -m pip install --upgrade pip

REM 安装项目依赖
echo 🚀 开始安装依赖...
python -m pip install -r requirements.txt

echo ✅ 依赖安装完成！
pause
