---
name: onboard
description: Machine Readiness Protocol - Verifies dependencies and environment on a new host.
---

# Onboard Workflow
// turbo
Verifies machine-readiness when plugging the Antigravity SSD into a new host or starting a new session.

1. Run the onboarding check script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/onboard.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=5000)

2. If Git identity or dependencies are missing, prompt the user for setup.
