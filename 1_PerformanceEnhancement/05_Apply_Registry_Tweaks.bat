@echo off
setlocal enabledelayedexpansion

REM ============================================================
REM CS2 OPTIMIZATION PACK - PERFORMANCE ENHANCEMENT LAUNCHER
REM ============================================================
REM Autor: ptrkfps - Engenheiro de Windows Internals / eSports
REM Objetivo: Aplicar tweaks de boot, startup e power plan
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
echo  CS2 OPTIMIZATION PACK - PERFORMANCE ENHANCEMENT
echo ============================================================
echo  Aplicando tweaks críticos de boot e power plan...
echo ============================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File ".\05_Apply_Registry_Tweaks.ps1"

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
echo  [SUCESSO] Tweaks de performance aplicados com sucesso!
echo ============================================================
echo  Os seguintes arquivos foram importados:
echo  - 01_Enable_BootPerformance.reg
echo  - 02_Disable_StartupApps.reg
echo  - 03_Optimize_PowerPlan.reg
echo  - 04_Configure_VisualEffects.reg
echo.
echo  RECOMENDAÇÃO: Reinicie o computador para refletir alterações
echo ============================================================
echo.
pause
exit /b 0
