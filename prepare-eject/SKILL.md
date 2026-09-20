---
name: prepare-eject
description: Graceful Shutdown Protocol - Stops services and saves state for safe SSD ejection.
---

# Prepare Eject Workflow
// turbo
Gracefully prepares the SSD for physical disconnection by stopping services, saving state, and committing changes.

1. Run the eject preparation script to stop services.
// turbo
run_command(CommandLine="zsh '/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/eject_prep.sh'", Cwd="/Volumes/990 2TB SSD/Antigravity", SafeToAutoRun=true, WaitMsBeforeAsync=5000)

2. Run the existing checkpoint workflow to commit all work.
// turbo
run_workflow(WorkflowName="checkpoint")

3. Run the sync commands workflow to ensure the host and SSD are aligned.
// turbo
run_workflow(WorkflowName="synccommands")

4. Confirm readiness for ejection.
> [!IMPORTANT]
> Once this workflow finishes, you must still manually "Eject" the disk in Finder before pulling the cable.
