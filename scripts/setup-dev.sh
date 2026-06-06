#!/usr/bin/env bash
# Configura o ambiente de desenvolvimento do projeto FLY (macOS / Linux / WSL).
#
# As skills de IA do projeto ja estao versionadas em .claude/skills/ e ficam
# disponiveis automaticamente no Claude Code. Este script instala apenas as
# ferramentas GLOBAIS que nao da para versionar no repo: rtk e gsd.
#
# Uso:  ./scripts/setup-dev.sh
set -euo pipefail

echo "== Setup de desenvolvimento do FLY (Unix/WSL) =="

# --- 1. rtk (Rust Token Killer) ---------------------------------------------
if command -v rtk >/dev/null 2>&1; then
  echo "[rtk] ja instalado: $(rtk --version)"
elif command -v brew >/dev/null 2>&1; then
  echo "[rtk] instalando via Homebrew..."
  brew install rtk
else
  echo "[rtk] instalando via install.sh (-> ~/.local/bin)..."
  curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) : ;;
    *) echo "[rtk] adicione ao PATH: echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc" ;;
  esac
fi

# --- 2. GSD (Get Shit Done) -------------------------------------------------
echo "[gsd] instalando globalmente para Claude Code (profile=standard)..."
npx --yes get-shit-done-cc@latest --claude --global --profile=standard
echo "[gsd] OK (use --profile=full para as 66 skills)"

# --- 3. Skills do projeto ---------------------------------------------------
echo "[skills] versionadas em .claude/skills/ (ja presentes, nada a instalar)"

echo "== Pronto. Reinicie o Claude Code para carregar gsd + statusline. =="
