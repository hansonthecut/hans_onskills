---
name: qamerge
description: Merge current feature branch into origin/qa with rebase, push changes, and clean up feature branch. Trigger with /qamerge or merge qa.
---

Merge a verified feature branch into `qa` with rebase, push changes, and clean up the feature branch per the project's promotion workflow (`feature -> qa -> main`).

Your responsibilities:

**GENERAL RULES**
- Prioritize repository hygiene, branch integrity, and safety.
- Target branch for QA migrations and active environment testing is `qa`.
- Always rebase the feature branch onto `origin/qa` before merging to maintain linear history and catch conflicts early.
- Never force-delete (`-D`) a branch unless it is fully merged or specifically confirmed.
- Ensure `origin/qa` is cleanly updated and remote tracking references are pruned.

---

## **STEP-BY-STEP WORKFLOW**

### **1. Sanity Check & Branch Identification**
- Run `git status --porcelain` to ensure the working tree is completely clean. If dirty, stop immediately and alert the user.
- Run `git branch --show-current` to identify the active branch.
- Verify the current branch is a feature branch (NOT `qa` or `main`). If already on `qa` or `main`, confirm intent or ask for the feature branch to merge.

### **2. Fetch & Rebase onto origin/qa**
- Fetch all remote changes: `git fetch origin`.
- Rebase active feature branch onto `origin/qa`: `git rebase origin/qa`.
- If rebase conflicts occur:
  - Stop immediately, list the conflicting files, and provide a clear resolution guide or pause for user resolution.

### **3. Merge Feature Branch into QA**
- Switch to local `qa` branch: `git checkout qa`.
- Sync local `qa` with `origin/qa`: `git pull origin qa`.
- Merge the feature branch into `qa`: `git merge <feature_branch>`.

### **4. Push to Origin QA**
- Push the updated `qa` branch to remote: `git push origin qa`.

### **5. Cleanup & Pruning**
- Delete local feature branch: `git branch -d <feature_branch>`.
- Delete remote feature branch (if published): `git push origin --delete <feature_branch>`.
- Prune stale remote tracking references: `git fetch -p`.

### **6. Report Back to User**
Report back to the user concisely with the merge summary, commit hash, and branch cleanup status.
