# Smart Money + Sentiment Alpha Agent

AI trading agent built on **Binance Agent OS** that combines:

- Smart money signal following
- Automatic token audit on contract paste
- Verified-only sentiment analysis (Web + X/Twitter)
- Bullish / Neutral / Bearish prediction
- Volume spike alerts (≥ 50% in 24h)
- Trade execution via Binance Agentic Wallet (with confirmation)

---

## Features

| Feature | Description |
|---------|-------------|
| **Smart Money** | Uses Binance `trading-signal` skill to track on-chain smart money buys/sells |
| **Auto Audit** | Paste any contract → automatic security audit (honeypot, tax, risk level) |
| **Sentiment** | Searches Web + X, counts **only verified accounts** |
| **Prediction** | Combines audit + smart money + sentiment into direction bias |
| **Volume Spike** | Alerts when volume rises ≥ 50% in 24 hours |
| **Trade** | Executes buys/sells via Agentic Wallet after your confirmation |

---

## Quick Start

### 1. Prerequisites

- Node.js **22+**
- Claude Code, Cursor, OpenClaw, or any Skills-compatible agent
- Binance account
- Small amount of funds for Agentic Wallet (start with what you can afford to lose)

### 2. Install Skills

```bash
# Full Skills Hub (recommended)
npx skills add https://github.com/binance/binance-skills-hub

# Or only required skills
npx skills add binance/binance-skills-hub/skills/binance-web3/trading-signal
npx skills add binance/binance-skills-hub/skills/binance-web3/query-token-audit
npx skills add binance/binance-skills-hub/skills/binance-web3/query-token-info
npx skills add binance/binance-skills-hub/skills/binance-web3/meme-rush
npx skills add binance/binance-skills-hub/skills/binance-web3/binance-agentic-wallet
```

### 3. Sign in to Agentic Wallet

In your agent chat:

```text
Sign in to Binance Agentic Wallet
```

Follow the QR / link flow in the Binance App. Set low daily limits at first.

### 4. Load the System Prompt

Copy the full content of [`prompts/SYSTEM.md`](prompts/SYSTEM.md) into your agent’s system / custom instructions / project rules.

### 5. (Optional) Volume Spike Automation

Grok Automations only supports **hourly** cadence (not every 2 hours).

Create an automation with:

- **Name:** `Volume Spike Scanner (≥50% / 24h)`
- **Cadence:** Every hour (`RRULE:FREQ=HOURLY`)
- **Timezone:** Your local timezone (e.g. `Asia/Jakarta`)
- **Prompt:** content of [`prompts/VOLUME_SPIKE_SCAN.md`](prompts/VOLUME_SPIKE_SCAN.md)

You will get notified when spikes appear. Paste any interesting contract into the main agent for full analysis + trade.

---

## How to Use

### Analyze a token (just paste contract)

```text
0x... or So1...
```

or

```text
Analyze this contract: <address>
```

The agent will automatically:

1. Audit the token  
2. Fetch token info  
3. Check smart money activity  
4. Search verified sentiment on Web + X  
5. Give Bullish / Neutral / Bearish prediction  
6. Offer trade if risk is acceptable  

### Follow smart money

```text
Show latest smart money buy signals on Solana and BSC.
Only include tokens with positive or neutral verified sentiment.
```

### Volume spike check (manual)

```text
Scan for tokens with ≥50% volume spike in the last 24h on Solana and BSC.
For each one give quick audit + note.
```

### Trade

```text
Buy 40 USDT of this token
```

Agent will confirm details first, then execute via Agentic Wallet only after you say **YES**.

---

## Risk Rules (default)

Defined in the system prompt. You can change them by telling the agent:

```text
Update my risk rules:
- Max trade size: 40 USDT
- Only buy if Audit = LOW
- Prefer tokens with smart money buy + positive verified sentiment
- Always confirm before trade
```

**Never** give the agent withdrawal rights. Agentic Wallet / MCP does not allow external withdrawals by design.

---

## Project Structure

```text
smart-money-sentiment-agent/
├── README.md
├── prompts/
│   ├── SYSTEM.md                 # Main agent system prompt
│   ├── VOLUME_SPIKE_SCAN.md      # Automation prompt (hourly)
│   └── RISK_RULES.md             # Optional stricter risk profile
├── docs/
│   ├── WORKFLOWS.md              # Detailed workflow explanations
│   └── SETUP.md                  # Extended setup notes
└── scripts/
    └── install-skills.sh         # One-command skill installer
```

---

## Disclaimer

This is **not financial advice**. Meme and on-chain tokens are extremely high risk. You can lose all capital allocated to the Agentic Wallet. Always double-check audits, sentiment, and order details before confirming any trade. Use only funds you can afford to lose.

---

## License

MIT — use, modify, and share freely.
