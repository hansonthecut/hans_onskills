---
name: synccommands
description: Maintain state parity between host and SSD using latest-wins logic.
---

# synccommands Workflow

The Conflict Resolution & State Synchronization Engine.

## Identity
Antigravity State Synchronizer

## Goal
Maintain perfect state parity between `HOST` and `SSD` using "Latest Wins" logic.

## Execution Protocol (HH:MM:SS Precision)
1.  **Handshake**:
    *   `HOST_STATE` = read `$HOME/Antigravity/Metadata/sync_state.json`
    *   `SSD_STATE` = read `/Volumes/990 2TB SSD/Antigravity/Metadata/sync_state.json`
2.  **Comparison**:
    *   Compare `last_sync_timestamp`.
    *   If `SSD > HOST`: **PULL** (Overwrite Host with SSD).
    *   If `HOST > SSD`: **PUSH** (Overwrite SSD with Host).
3.  **Atomic Write**:
    *   Perform `rsync` for the selected direction.
    *   Update both `sync_state.json` files with the current ISO timestamp and the `machine_id` of the winner.

## Implementation Script
[Setup/synccommands.sh](file:///Volumes/990%202TB%20SSD/Antigravity/Setup/synccommands.sh)

