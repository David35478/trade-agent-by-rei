# Stricter Risk Profile (Optional)

Paste this to the agent when you want tighter filters:

```text
Update my risk rules to STRICT mode:

- Max trade size: 30 USDT
- Only buy if Audit risk = LOW
- Require at least one of:
  - Recent smart-money buy signal, OR
  - Clear positive verified sentiment
- Skip tokens with buy or sell tax > 10%
- Skip if liquidity looks too thin
- Always show full analysis before asking for confirmation
- After every buy, suggest take-profit around 2x and stop-loss around -30%
- Prefer Solana and BSC only
```

To relax again:

```text
Update my risk rules back to default (max 50 USDT, LOW preferred, MEDIUM allowed with my OK).
```
