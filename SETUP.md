# Extended Setup

## Skills

Primary source: [binance/binance-skills-hub](https://github.com/binance/binance-skills-hub)

Required:

- `trading-signal` — smart money
- `query-token-audit` — security
- `query-token-info` — market data
- `meme-rush` — optional discovery
- `binance-agentic-wallet` — execution

Install helper:

```bash
bash scripts/install-skills.sh
```

## Agentic Wallet

1. Install the wallet skill  
2. In chat: `Sign in to Binance Agentic Wallet`  
3. Complete flow in Binance App  
4. Set **low daily limits** and prefer “require confirmation” for high-risk actions  
5. Fund only with capital you can lose  

## System Prompt

Load `prompts/SYSTEM.md` as:

- Claude Code / Cursor: project instructions or custom system prompt  
- Other agents: system / persona / rules file  

## Volume Spike Schedule

Grok Automations:

- Cadence: hourly (`RRULE:FREQ=HOURLY`)  
- Prompt: `prompts/VOLUME_SPIKE_SCAN.md`  
- Notification: app + email  

Note: every-2-hours is not supported; hourly is the closest option.

## Optional: Binance MCP (CEX trading)

If you also want Spot/Futures via MCP (separate from on-chain Agentic Wallet):

```text
MCP endpoint: https://agent.binance.com/mcp/agentic
```

Fund the **Agentic sub-account** manually on Binance web. The agent cannot pull funds from your main account.
