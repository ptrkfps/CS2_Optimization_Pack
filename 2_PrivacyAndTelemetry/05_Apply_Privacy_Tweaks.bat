@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM CS2 OPTIMIZATION PACK - PRIVACY AND TELEMETRY LAUNCHER
REM ============================================================
REM Autor: ptrkfps - Engenheiro de Windows Internals / eSports
REM Objetivo: Aplicar tweaks de privacidade e desativar telemetria
REM ============================================================

cd /d "%~dp0"

NET SESSION >NUL 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ============================================================
    echo  ERRO: Privilégios de Administrador Requeridos
    echo ============================================================
    echo  Este script precisa rodar como Administrador.
    echo  Por favor, feche este prompt e execute novamente com
    echo  botão direito do mouse > Executar como Administrador
    echo ============================================================
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo  CS2 OPTIMIZATION PACK - PRIVACY AND TELEMETRY
echo ============================================================
echo  Desativando telemetria, tracking e sugestões...
echo ============================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File ".\05_Apply_Privacy_Tweaks.ps1"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERRO] Falha ao executar o script PowerShell
    echo [ERRO] Code: %ERRORLEVEL%
    echo.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ============================================================
echo  [SUCESSO] Tweaks de privacidade aplicados com sucesso!
echo ============================================================
echo  Os seguintes arquivos foram importados:
echo  - 01_Disable_DeepTelemetry.reg
echo  - 02_Disable_ActivityHistory.reg
echo  - 03_Disable_AdvertisingID.reg
echo  - 04_Disable_AppsSuggestions.reg
echo.
echo  NOTA: Windows Defender e Update permanecem 100%% ativos
echo ============================================================
echo.
pause
exit /b 0
