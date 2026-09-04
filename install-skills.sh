#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Binance Skills Hub skills for Smart Money + Sentiment Alpha Agent"

if ! command -v npx >/dev/null 2>&1; then
  echo "Error: npx not found. Install Node.js 22+ first."
  exit 1
fi

echo "Installing full hub (recommended)..."
npx --yes skills add https://github.com/binance/binance-skills-hub || true

echo "Ensuring key skills..."
npx --yes skills add binance/binance-skills-hub/skills/binance-web3/trading-signal || true
npx --yes skills add binance/binance-skills-hub/skills/binance-web3/query-token-audit || true
npx --yes skills add binance/binance-skills-hub/skills/binance-web3/query-token-info || true
npx --yes skills add binance/binance-skills-hub/skills/binance-web3/meme-rush || true
npx --yes skills add binance/binance-skills-hub/skills/binance-web3/binance-agentic-wallet || true

echo ""
echo "Done."
echo "Next:"
echo "  1. Open your AI agent (Claude Code / Cursor / etc.)"
echo "  2. Load prompts/SYSTEM.md as system instructions"
echo "  3. Say: Sign in to Binance Agentic Wallet"
echo "  4. (Optional) Create hourly automation with prompts/VOLUME_SPIKE_SCAN.md"
