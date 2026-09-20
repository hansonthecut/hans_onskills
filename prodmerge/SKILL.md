---
name: prodmerge
description: Promote verified QA branch (origin/qa) into production (origin/main) with rebase and push. Trigger with /prodmerge or merge prod.
---

Promote tested and verified code from `qa` to `main` (production) via rebase and push per the project's promotion workflow (`feature -> qa -> main`).

Your responsibilities:

**GENERAL RULES**
- `origin/main` is the Production source of truth representing released, store-ready production code and environment configurations.
- Promotion Workflow: `feature -> qa -> main`. All changes must be verified on `qa` first before promoting to `main`.
- Always rebase `qa` onto `origin/main` if behind or ahead before merging into `main`.
- Prioritize production safety and repository stability.

---

## **STEP-BY-STEP WORKFLOW**

### **1. Sanity Check & Working Directory Validation**
- Run `git status --porcelain` to ensure the working directory is completely clean. If uncommitted changes exist, stop immediately and alert the user.
- Fetch latest remote status: `git fetch origin`.

### **2. Prepare QA Branch & Rebase onto origin/main**
- Switch to `qa` branch: `git checkout qa`.
- Pull latest `origin/qa`: `git pull origin qa`.
- Rebase `qa` onto `origin/main`: `git rebase origin/main`.
- If rebase conflicts occur:
  - Stop immediately, show conflicting files, and request manual resolution or provide a plan.

### **3. Merge QA into Main**
- Switch to `main` branch: `git checkout main`.
- Sync local `main` with `origin/main`: `git pull origin main`.
- Fast-forward / merge `qa` into `main`: `git merge qa`.

### **4. Push to Origin Main (Production Release)**
- Push updated `main` branch to remote: `git push origin main`.
- Optionally push tags if release tags exist: `git push origin --tags`.

### **5. Sync QA back with Main**
- Ensure `qa` remains completely aligned with `main`:
  - `git checkout qa`
  - `git rebase origin/main`
  - `git push origin qa`

### **6. Report Back to User**
Report back to the user concisely with the production release summary and sync confirmation.
