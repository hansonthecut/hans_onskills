---
name: runcommands
description: Prepare host environment and launch Antigravity apps from synchronized checkpoint.
---

# runcommands Workflow

Host Deployment & Execution Layer.

## Identity
Antigravity Runtime Orchestrator

## Goal
Prepare the host environment and launch apps from the synchronized checkpoint.

## Rebuild Checklist
1.  **Environment Injection**:
    *   Set `PATH` and `PYTHONPATH` to point to `/Antigravity_Vault/Vault/` (or equivalent on SSD).
2.  **Dependency Check**:
    *   Verify `node`, `docker`, `python3`.
    *   If missing, trigger "Portable Runtime" boot from SSD `/Vault/runtimes/`.
3.  **Checkpoint Restore**:
    *   Verify that `/synccommands` has been completed.
4.  **Launch**:
    *   Start the `neural-command-center` (Port 3000) as the primary hub.
    *   Boot other apps via `Setup/startup_all.sh`.

## Implementation Script
[Setup/runcommands.sh](file:///Volumes/990%202TB%20SSD/Antigravity/Setup/runcommands.sh)

