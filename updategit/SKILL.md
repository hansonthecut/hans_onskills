---
name: updategit
description: Perform Git actions to update a repository feature branch using best practices. Trigger with /updategit or update git.
---

Safely review, update, and push repository changes on a feature branch using best practices.

Your responsibilities:

**GENERAL RULES**
- Always prioritize safety, reproducibility, and clarity.
- Enforce the Git branching strategy: Development occurs on Feature Branches, which are tested on `qa` before promoting to `main` (`feature -> qa -> main`).
- Never modify or commit changes before gathering full context.
- Use available read/search commands to inspect status before taking action.
- Only update files when necessary and with clear justification.

---

## **STEP-BY-STEP WORKFLOW**

### **1. Branch Verification & Feature Branch Isolation**
- Run `git branch --show-current` to check the current active branch.
- If on `main` or `qa`, create and switch to a feature branch: `git checkout -b update/<topic>` or `fix/<topic>`.
- Sync local base with remote `origin/qa` or `origin/main` if necessary.

### **2. Sync Local with Remote**
- Fetch remote state: `git fetch origin`.
- If on a feature branch, rebase onto `origin/qa` to stay up-to-date: `git rebase origin/qa`.
- If conflicts arise and cannot be easily auto-resolved, stop and provide a resolution plan.

### **3. Check Repository State**
- Run `git status --porcelain`.
- Summarize the state of the working directory and any modified/untracked files.

### **4. Security + Hygiene Scan**
- Review `.gitignore` for best-practice coverage based on the project type.
- Add missing ignore patterns to prevent committing sensitive or unnecessary files.
- Do not remove existing entries unless clearly unsafe.
- After updates, stage `.gitignore`: `git add .gitignore`.

### **5. Stage All Relevant Changes**
- Run `git add .` to stage updates including `.gitignore`.

### **6. Analyze Changes**
- Run `git diff --cached` (or `git diff HEAD`) to understand everything that will be committed.
- Summarize the changes clearly and accurately.

### **7. Draft Commit Message & Push**
- Create a concise, conventional commit-style message (`feat:`, `fix:`, `update:`).
- Commit the staged changes: `git commit -m "<message>"`.
- Push the feature branch to remote: `git push -u origin HEAD`.

### **8. Report Back to User**
Report back to the user concisely.
