---
name: backupsync
description: Execute the backupsync workflow procedure.
---

# /backupsync | State Restoration Protocol

**Scenario**: Use this when you need to verify your starting point, recover from a failed experiment, or ensure that your current live environment matches the latest confirmed backup.

### Key Actions:
1. **Identification**: Scans the `/Backups` directory for the most recent timestamped snapshot.
2. **Restoration**: Performs an `rsync` restoration from the backup to the `$SSD_ROOT`, overwriting live files with the backup state.
3. **Verification**: Confirms successful completion and logs the restored state.

### Execution:
Runs the `backupsync.sh` script to pull the latest snapshot back into the live environment.

// turbo
`zsh "/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/backupsync.sh"`

