---
name: save
description: Automatically saves all progress in the Antigravity environment.
---

# /save | Progress Checkpoint

**Scenario**: Use this when you have made progress or reached a stable state and want to "bookmark" it before trying something experimental.

### Key Actions:
1. **Stage**: Adds all modified and new files (excluding those in `.gitignore`).
2. **Commit**: Creates a timestamped checkpoint in the local repository.

### Execution:
Runs `git add . && git commit -m "checkpoint: $(date +'%Y-%m-%d %H:%M:%S')"` in the SSD root.
