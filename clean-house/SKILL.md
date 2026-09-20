---
name: clean-house
description: SSD Maintenance Protocol - Purges logs, temp files, and artifacts to reclaim space.
---

# Clean House Workflow
// turbo
Maintains the health of the SSD by purging logs, temp files, and artifacts.

1. Run the clean house maintenance script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/clean_house.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=5000)

2. Report on disk space reclaimed if possible.
