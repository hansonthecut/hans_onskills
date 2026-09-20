---
name: checkpoint
description: Intelligently triage, auto-ignore bloat/secrets, and push a WIP checkpoint to a feature branch. Trigger with /checkpoint or checkpoint.
---

Triage, auto-ignore noise and secrets, and save a clean WIP checkpoint to a feature branch.

Your responsibilities:
- Prioritize speed, security, and repository health.
- Enforce the Git branching policy: Checkpoints MUST be saved on feature branches (`feat/*`, `fix/*`, `wip/*`, `refactor/*`), NEVER directly committed to `qa` or `main`.
- Use your best judgment to evaluate untracked files.
- Leverage `.gitignore` natively to handle risky files rather than complex staging commands.
- Do NOT push unverified changes directly to `qa` or `main`.

---

## **STEP-BY-STEP WORKFLOW**

### **1. Branch Verification & Feature Branch Safeguard**
- Run `git branch --show-current` to identify the active branch.
- If the current branch is `main` or `qa` (or detached HEAD):
  - Automatically create and switch to a new feature branch: `git checkout -b feat/wip-<short-description-or-timestamp>`.
  - Inform the user that work is being isolated on a feature branch per the branching strategy (`feature -> qa -> main`).
- If already on a feature branch, remain on it.

### **2. State Scan & Intelligent Triage**
- Run `git status --porcelain` to view all modified and untracked files.
- If the working tree is completely clean, inform the user and exit gracefully.
- **TRIAGE:** Look specifically for untracked files that are risky or bloat (e.g., `.env`, `.pem`, `credentials`, massive media like `.mp4`, compiled binaries, game builds, or OS noise like `.DS_Store`).

### **3. The Auto-Ignore (Security Gate)**
- If you identified any risky/bloat untracked files in Step 2, automatically append their paths to the repository's `.gitignore` file.
- Do not ask for permission for obvious secrets or OS noise; just secure the repo.

### **4. Clean Staging**
- Now that `.gitignore` is updated and protecting the repository, run `git add .` to stage all safe modifications (which will now include the updated `.gitignore`).
- *Note: If the user explicitly requested specific files in their prompt, prioritize those instead of `.`.*

### **5. Draft and Execute Commit**
- Run `git diff --cached` to see exactly what is staged.
- Generate a concise commit message starting with a tag like `feat:`/`wip:`/`fix:`/`checkpoint:` followed by a brief description of the changes.
- Run `git commit --no-verify -m "<your generated message>"`.

### **6. Push to Remote (Backup Feature Branch)**
- Push the feature branch to remote: `git push -u origin HEAD`.

### **7. Report Back to User**
Report back to the user concisely.
