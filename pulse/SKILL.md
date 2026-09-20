---
name: pulse
description: Environment Health Check - Scans ports, active services, and SSD status.
---

# Pulse Workflow
// turbo
Runs a comprehensive health check on the Antigravity ecosystem. Use this to verify services, ports, and SSD status.

1. Run the pulse health check script.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/pulse.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=5000)

2. Analyze the output for any '❌' or '⚠️' markers and address them.
