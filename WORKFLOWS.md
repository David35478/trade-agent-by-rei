# Workflows

## 1. Contract Analysis Pipeline

**Trigger:** User pastes a contract address or says “analyze this contract”.

**Steps the agent must run:**

1. `query-token-audit` → security result  
2. `query-token-info` (or equivalent) → market snapshot  
3. Smart money check via `trading-signal` if relevant  
4. Web + X search for sentiment, **filter to verified accounts only**  
5. Volume check (flag ≥ 50% 24h spike)  
6. Combine into Bullish / Neutral / Bearish prediction  
7. Recommendation + optional trade offer  

**Output:** Use the structured format defined in `prompts/SYSTEM.md`.

---

## 2. Smart Money Follow

**Trigger:** “Show smart money signals”, “any new smart money buys”, etc.

**Steps:**

1. Fetch latest signals (Solana + BSC)  
2. Optionally cross-check top results with quick audit / sentiment  
3. Present ranked list with trigger price, current price, max gain, status  

---

## 3. Volume Spike Alert

**Manual:** User asks to scan for volume spikes.  
**Automated:** Hourly Grok Automation using `prompts/VOLUME_SPIKE_SCAN.md`.

When a spike is found, user pastes the contract into the main agent for full pipeline + possible trade.

---

## 4. Trade Execution

**Trigger:** “Buy X USDT of TOKEN” or “Buy this”.

**Steps:**

1. Confirm token, size, side, chain  
2. Re-state audit risk  
3. Wait for explicit **YES**  
4. Execute via Agentic Wallet skill  
5. Report fill / status  
6. Suggest simple TP / SL  

Never skip confirmation.
