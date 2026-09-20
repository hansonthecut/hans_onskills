---
name: backupcommands
description: Structural Redundancy & Snapshot Protocol
---

# /backupcommands | Structural Redundancy

**Scenario**: Execute before major refactors, after reaching a stable project milestone, or periodically for data safety.

### Key Actions:
1. **Consolidation**: Runs `/markdown` to ensure all documentation is merged.
2. **Snapshot**: Creates a timestamped, redundant clone of the `$SSD_ROOT` in the `/Backups` directory.
3. **Log**: Appends a record of the backup to `backup_log.md` in the `all.markdowns` folder.

### Execution:
Runs the `backupcommands.sh` script to perform an `rsync`-based snapshot, excluding bloat (node_modules, logs).
