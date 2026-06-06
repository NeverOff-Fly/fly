#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Configura o ambiente de desenvolvimento do projeto FLY (Windows).

.DESCRIPTION
  As *skills* de IA do projeto já estão versionadas em `.claude/skills/` —
  elas ficam disponíveis automaticamente assim que você abre o repositório no
  Claude Code. Nada a instalar para elas.

  Este script instala apenas as ferramentas GLOBAIS que não dá para versionar
  dentro do repo:
    1. rtk  — Rust Token Killer (binário CLI, economiza tokens)
    2. gsd  — Get Shit Done (workflow de planejamento; instala hooks/agents globais)

.EXAMPLE
  pwsh ./scripts/setup-dev.ps1
#>

$ErrorActionPreference = 'Stop'
Write-Host "== Setup de desenvolvimento do FLY (Windows) ==" -ForegroundColor Cyan

# --- 1. rtk (Rust Token Killer) ---------------------------------------------
if (Get-Command rtk -ErrorAction SilentlyContinue) {
    Write-Host "[rtk] ja instalado: $(rtk --version)" -ForegroundColor Green
} else {
    Write-Host "[rtk] instalando (release pre-compilada para Windows)..." -ForegroundColor Yellow
    $bin = Join-Path $HOME ".local\bin"
    New-Item -ItemType Directory -Force -Path $bin | Out-Null
    $zip = Join-Path $env:TEMP "rtk-win.zip"
    $url = "https://github.com/rtk-ai/rtk/releases/latest/download/rtk-x86_64-pc-windows-msvc.zip"
    Invoke-WebRequest -Uri $url -OutFile $zip
    Expand-Archive -Path $zip -DestinationPath $bin -Force
    Remove-Item $zip -Force
    Write-Host "[rtk] rtk.exe extraido para $bin" -ForegroundColor Green
    if (($env:PATH -split ';') -notcontains $bin) {
        Write-Host "[rtk] adicione ao PATH (uma vez):" -ForegroundColor DarkYellow
        Write-Host "      [Environment]::SetEnvironmentVariable('PATH', `"$bin;`" + [Environment]::GetEnvironmentVariable('PATH','User'), 'User')" -ForegroundColor DarkGray
    }
    Write-Host "[rtk] NOTA: no Windows nativo o auto-rewrite e limitado (modo CLAUDE.md)." -ForegroundColor DarkYellow
    Write-Host "      Para suporte completo de hooks, use WSL: https://learn.microsoft.com/windows/wsl/install" -ForegroundColor DarkGray
}

# --- 2. GSD (Get Shit Done) -------------------------------------------------
Write-Host "[gsd] instalando globalmente para Claude Code (profile=standard)..." -ForegroundColor Yellow
npx --yes get-shit-done-cc@latest --claude --global --profile=standard
Write-Host "[gsd] OK (use --profile=full para as 66 skills; standard = ~700 tokens de overhead)" -ForegroundColor Green

# --- 3. Skills do projeto ---------------------------------------------------
Write-Host "[skills] versionadas em .claude/skills/ (ja presentes, nada a instalar)" -ForegroundColor Green

Write-Host "== Pronto. Reinicie o Claude Code para carregar gsd + statusline. ==" -ForegroundColor Cyan
