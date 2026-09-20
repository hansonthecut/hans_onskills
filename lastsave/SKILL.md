---
name: lastsave
description: Restores the environment to the previous save point.
---

# /lastsave | Revert to Checkpoint

**Scenario**: Use this if an experimental query or script caused issues and you want to instantly revert to your last `/save` point.

### Key Actions:
1. **Revert**: Performs a hard reset to the previous commit.
2. **Clean**: Removes any untracked files created since the last save.

### Execution:
Runs `git reset --hard HEAD~1 && git clean -fd` in the SSD root.

> [!WARNING]
> This will PERMANENTLY delete any changes made since the last `/save`. Use with caution.
