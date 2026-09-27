# ============================================================
# CS2 OPTIMIZATION PACK - PERFORMANCE ENHANCEMENT REGISTRY PATCH
# ============================================================
# Autor: ptrkfps - Engenheiro de Windows Internals / eSports
# Objetivo: Aplicar tweaks de boot, startup, power plan e visual effects
# ============================================================

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$regFiles = @(
    '01_Enable_BootPerformance.reg',
    '02_Disable_StartupApps.reg',
    '03_Optimize_PowerPlan.reg',
    '04_Configure_VisualEffects.reg'
)

$successCount = 0
$failCount = 0

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host " IMPORTANDO REGISTRY FILES" -ForegroundColor Cyan
Write-Host "============================================================`n" -ForegroundColor Cyan

foreach ($regFile in $regFiles) {
    $fullPath = Join-Path $scriptPath $regFile
    
    if (Test-Path $fullPath) {
        try {
            Write-Host "[*] Importando: $regFile" -ForegroundColor Yellow
            & reg import "$fullPath" 2>&1 | Out-Null
            Write-Host "[OK] $regFile importado com sucesso" -ForegroundColor Green
            $successCount++
        }
        catch {
            Write-Host "[ERRO] Falha ao importar $regFile" -ForegroundColor Red
            Write-Host "    Detalhes: $_" -ForegroundColor Red
            $failCount++
        }
    }
    else {
        Write-Host "[AVISO] Arquivo não encontrado: $fullPath" -ForegroundColor Red
        $failCount++
    }
}

Write-Host "`n============================================================" -ForegroundColor Cyan
Write-Host " SUMÁRIO" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "[OK] Importados com sucesso: $successCount" -ForegroundColor Green
Write-Host "[ERRO] Falhas na importação: $failCount" -ForegroundColor Red
Write-Host "============================================================`n" -ForegroundColor Cyan

if ($failCount -eq 0) {
    Write-Host "[SUCESSO] Todos os tweaks de performance foram aplicados!" -ForegroundColor Green
    Write-Host "[INFO] Sistema requer REBOOT para aplicar mudanças completas" -ForegroundColor Yellow
    exit 0
}
else {
    Write-Host "[AVISO] Alguns tweaks falharam ao serem aplicados" -ForegroundColor Yellow
    exit 1
}
