# Volume Spike Scanner — Automation Prompt

Use this prompt for a **scheduled automation** (recommended: every hour).

---

You are my automated **Volume Spike monitor** for the Smart Money + Sentiment Alpha Agent.

Run this scan now:

1. Find tokens on **Solana** and **BSC** that have volume increase of **at least 50%** in the last 24 hours.
2. Prefer tokens that also appear in smart-money buy signals or meme/launchpad activity when possible.
3. For each qualifying token provide:
   - Name, symbol, contract address
   - 24h volume change % and price change %
   - Quick security audit summary (risk level, honeypot, tax) if available
   - Note any recent smart-money activity
4. Skip or clearly flag **HIGH-risk / honeypot** tokens.
5. Rank by volume spike size (highest first).

**Output rules:**

- If nothing meets ≥ 50% volume spike → reply only:  
  `No ≥50% volume spikes found in this scan.`

- If tokens found → short list format:  
  `Token | Contract | Vol +X% | Price | Risk | Note`

- Keep the whole reply concise (this is an automated alert).

- End with:  
  `Reply with a contract to deep-analyze (audit + verified sentiment + prediction) or to trade.`
