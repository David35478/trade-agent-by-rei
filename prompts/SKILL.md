---
name: volume-spike-scanner
description: Scan top market-cap coins for 24h volume spikes greater than 50 percent. Use when the user asks for volume spike alerts, unusual volume detection, hourly volume scan, or volume warning on top coins. Focuses on CoinMarketCap top 1-300 range using available public data sources.
---

# Volume Spike Scanner

## Overview

Detect tokens in the approximate CoinMarketCap top 1–300 market-cap range that show a 24-hour trading volume increase of more than 50%. Designed for both manual requests and scheduled hourly automation runs.

## When to Use

- User asks for volume spike scan / alert / warning
- Hourly automation runs
- Questions like "any unusual volume today?" focused on larger coins

## Instructions

When activated (manual request or automation):

1. Gather current high-volume and top-mover candidates using available tools:
   - `crypto-market-rank` (token-rank, social-hype, smart-money-inflow, trending)
   - DexScreener / GeckoTerminal public endpoints for volume and price change
   - Web search for CoinMarketCap top volume gainers or similar public lists when needed
   - `query-token-info` for individual token confirmation

2. Restrict scope strictly to approximate **CoinMarketCap top 1–300** market-cap coins. Ignore pure micro-caps and very new memes outside this range.

3. For each candidate collect:
   - Name / Symbol
   - Approximate market-cap rank (if available)
   - Current price
   - 24h price change %
   - 24h volume and estimated volume change %
   - Contract address (if on-chain)
   - Short note on why the spike is notable

4. Filter strictly:
   - Only report tokens with estimated **24h volume increase > 50%**
   - Prefer higher-confidence detections
   - Keep the final list short (max 8–10 tokens)

5. Output format (notification-friendly):

```
Volume Spike Alert (>50% 24h volume)

• TOKEN (SYMBOL) — Rank ~XX
  Price: $X.XX | 24h: +XX%
  Volume spike: +XX% | Vol: $XXm
  Contract: 0x... (if available)
  Note: brief reason
```

If no tokens meet the >50% volume spike criteria, reply with exactly:

`No significant volume spikes detected in top 300 this hour.`

## Rules

- Do not invent volume percentage numbers. Use real data from tools or clearly mark estimates.
- Prefer quality over quantity.
- When run via automation, only produce meaningful output when at least one valid spike is found (the exact "no spikes" message is acceptable and will still be delivered).
- Focus exclusively on top ~1-300 market-cap coins unless the user expands the scope.
- Timezone context for scheduled runs is Asia/Jakarta (WIB).
