---
name: optimize
description: Mac Performance Optimizer - Clears caches, frees memory, and pauses non-essential services for max performance.
---

# Optimize Workflow
// turbo
Runs the Antigravity Mac Optimizer to maximize system performance. Clears caches, purges memory, pauses non-essential background services, and deprioritizes heavy processes. All operations are safe and reversible — services auto-restart when needed.

## Optimize

1. Run the Mac Optimizer script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Deployments/MacOptimizer/optimize.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=30000)

2. Report the optimization results (cache freed, services paused, actions taken).

## Restore (Optional)

If the user requests a restore of paused services:

1. Run the restore script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Deployments/MacOptimizer/restore.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=15000)

2. Report the restoration results.
