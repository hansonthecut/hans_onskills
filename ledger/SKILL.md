---
name: ledger
description: Financial Consolidation Protocol - Syncs budget CSVs and updates Hansonthecut reports.
---

# Ledger Workflow
// turbo
Consolidates financial data for Hansonthecut LLC and updates profit reports.

1. Run the ledger consolidation script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/ledger.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=5000)

2. Scan for recent CSV changes and update the profit report.
3. Show the updated report: [hansonthecut.profit.md](file:///Volumes/990%202TB%20SSD/Antigravity/all.markdowns/hansonthecut.profit.md)
