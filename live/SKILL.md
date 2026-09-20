---
name: live
description: Executes the full Antigravity safety suite (Save, Markdown, Backup) with an optional revert.
---

# /live | Full Sync & Safety Suite

**Scenario**: Use this as your primary "end of session" or "milestone" command. It ensures all work is saved, consolidated, and backed up redundantly.

### Key Actions:
1. **Save**: Creates a timestamped git checkpoint of the current state.
2. **Consolidate**: Runs `/markdown` to merge all documentation into `all.markdowns`.
3. **Backup**: Creates a redundant rsync snapshot in the `/Backups` directory.
4. **Interactive Restore**: Prompts to load the previous version (`/lastsave`) if the current session's results are not desired.

### Execution:
Runs the `live.sh` script.

// turbo
`zsh "/Volumes/990 2TB SSD/Antigravity/Protocols/Resources/Setup/live.sh"`

> [!IMPORTANT]
> The `/lastsave` step at the end is **interactive**. It will ask "Load the last saved version of antigravity" before performing a hard reset.

---

### Integrated: /applauncher | Universal Launcher
**Scenario**: Execute to start the Antigravity suite of applications, ensure data is synchronized between the SSD and local Mac, and open the Mission Control dashboard.

// turbo
`"/Volumes/990 2TB SSD/Antigravity/start_all.sh"`

---

### Integrated: /lastsave | Revert to Checkpoint
**Scenario**: Use this if an experimental query or script caused issues and you want to instantly revert to your last `/save` point.

// turbo
`cd "/Volumes/990 2TB SSD/Antigravity" && git reset --hard HEAD~1 && git clean -fd`

> [!WARNING]
> This will PERMANENTLY delete any changes made since the last `/save`. Use with caution.
