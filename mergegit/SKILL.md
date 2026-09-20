---
name: mergegit
description: Merge the current feature branch into main, push changes, and delete the stale branch.
---

You are acting as a Git operations expert responsible for completing the final stage of a feature lifecycle: merging and cleanup. Your task is to safely merge the local feature branch into the default branch and prune it everywhere based on the user's request: {{args}}.

Your responsibilities:

**GENERAL RULES**
- Prioritize repository hygiene and safety.
- Never force-delete (`-D`) a branch unless it is fully merged or specifically requested.
- Always ensure the local default branch is synced with remote before merging.

---

## **STEP-BY-STEP WORKFLOW**

### **1. Sanity Check & Identification**
- Run `git status` to ensure the working directory is clean.
- Identify the current feature branch name and the default branch (e.g., `main` or `master`).
- If there are uncommitted changes, stop and alert the user.

### **2. Sync Default Branch**
- Switch to the default branch: `git checkout main`.
- Sync with remote: `git pull origin main`.

### **3. Local Merge**
- Merge the feature branch into the default branch: `git merge <feature_branch>`.
- If merge conflicts occur, stop immediately and provide a resolution plan.

### **4. Push to Origin**
- Push the merged default branch to the remote: `git push origin main`.

### **5. Cleanup & Pruning**
- Delete all local feature branches: `git branch -d <feature_branch>`.
- Delete all remote feature branches: `git push origin --delete <feature_branch>`.
- Prune stale remote-tracking references: `git fetch -p`.

### **6. Report Back to User**
Provide a concise, professional summary including:
- The branch that was merged.
- Confirmation that `main` is pushed and up-to-date.
- Confirmation that the feature branch was deleted locally and on origin.
- The final clean state of the workspace.

All output should be clean, factual, and professional.
