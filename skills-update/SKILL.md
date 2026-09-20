---
name: skills-update
description: Update all Git repositories inside gitProjects/myskills via git pull and report status. Trigger with /skills-update or when asking to update myskills.
---

## Instructions

Discover, validate, and update all Git repositories housed within the `myskills` project directory by pulling the latest upstream changes.

---

### Phase 1: Repository Discovery

1. **Locate Target Directory:** Identify the `myskills` root (default: `$HOME/Downloads/gitProjects/myskills`).
2. **Scan Git Repositories:** Recursively discover all subdirectories containing a `.git` folder.
   - Filter to find distinct repository roots.
   - Ensure the root folder itself is checked if version controlled.

---

### Phase 2: Pull & Status Execution

1. **Execute Pull per Repository:** For each discovered repository:
   - Run `git -C "<repo-path>" status --porcelain` to check for uncommitted changes or dirty states.
   - If clean, run `git -C "<repo-path>" pull` to fetch and fast-forward latest changes from the upstream remote.
   - If dirty or uncommitted changes exist, run `git -C "<repo-path>" status` and inform the user before attempting to overwrite or stash.
2. **Submodules (if applicable):**
   - If a repository contains submodules, update them: `git -C "<repo-path>" submodule update --init --recursive`.

---

### Phase 3: Verification & Reporting

1. **Verify HEAD Commits:** Run `git -C "<repo-path>" log -1 --oneline` for each repository to capture the current commit.
2. **Report:** Report back to the user concisely.
