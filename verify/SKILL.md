---
name: verify
description: Iteratively run linting, type-checking, testing, and building, fixing issues until the project is clean. Trigger with /verify or verify.
---

Ensure the codebase passes linting, type-checking, testing, and building via an iterative Fix-and-Check loop.

---

## **EXECUTION RULES**
- **Non-interactive Shell:** ALL shell commands must be executed non-interactively. Prefix commands with `CI=true`. Use flags like `-y`, `--yes`, or `--force` where applicable to prevent the terminal from hanging on user prompts.
- **Context Gathering:** **MANDATORY**: Before starting, you must locate and read the project's linting guidance. Search recursively for `lint.md` (specifically checking `/docs/lint.md` and the root directory) and style guides like `.eslintrc`. Analyze `package.json` to identify the Package Manager and configured scripts for linting, type checking, and caching (e.g., Turbo, ESLint cache) to ensure efficient execution.
- **Tool Usage:** Use your file reading and editing capabilities to apply precise, minimal fixes. Do not hallucinate file contents; always read the file first.
- **Output Management:** Omit `2>&1` from shell commands. To efficiently analyze large log files, use `cat` (or equivalent) to read them, filtering specifically for 'err' and 'warn' patterns.

---

## **THE FIX-AND-CHECK WORKFLOW**
Execute the following phases strictly sequentially. Do not move to the next phase until the current one passes. If you get stuck in a fix loop (max 3 attempts per phase), stop and report the blocker to the user.

### **Phase 1: Linting**
1. Read the `lint.md` or style guide identified during Context Gathering. If a `package.json` script for linting exists, prefer using that command as it may include optimized caching or specific project flags.
2. Run the lint command (e.g., `CI=true pnpm lint`). If it passes, proceed to Phase 2.
3. If it fails with many errors, run the fix command (e.g., `CI=true pnpm lint --fix`) else manually fix.
4. Re-run the lint command. If errors persist, read the failing files, apply minimal fixes adhering to style guidelines, and re-test. Repeat until clean (max 3 iterations).

### **Phase 2: Type-Checking**
1. Check `package.json` for a type-check script. Run the command (e.g., `CI=true pnpm check-types`). If it passes, proceed to Phase 3.
2. If it fails, analyze the terminal output, identify file/line numbers, read the files, and apply safe type fixes. 
3. Re-run the check. Repeat until clean (max 3 iterations).

### **Phase 3: Testing**
1. Check `package.json` for a test script. Run the command (e.g., `CI=true pnpm test`). If it passes, proceed to Phase 4.
2. If tests fail, analyze the output. Modify the source code or test files only if the intent is clear and the fix is safe. Do not revert to old code just to pass; maintain the current architectural direction.
3. Re-run the tests. Repeat until clean (max 3 iterations).

### **Phase 4: Building**
1. Check `package.json` for a build script. Run the command (e.g., `CI=true pnpm build`). If it passes, proceed to Phase 5.
2. If the build fails, analyze the output, fix the build errors, and re-attempt the build (max 3 iterations).

### **Phase 5: Report Back to User**
Report back to the user concisely.
