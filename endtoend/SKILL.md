---
name: endtoend
description: Comprehensive end-to-end project execution, auditing, and GitHub deployment engine. Discovers project markdowns, executes recommended protocols, runs full /audit, prompts to confirm target GitHub repo, and handles /checkpoint, /updategit, and /mergegit. Trigger with /endtoend or endtoend.
---

Execute a complete end-to-end development, audit, and Git delivery lifecycle on the active project.

---

## GUIDELINES & CONSTRAINTS

1. **Markdown-Grounded Execution:** Always inspect the active project for relevant markdown files (`README.md`, `*_BLUEPRINT.md`, `checklist.md`, `docs/*.md`, `GUIDE*.md`, architecture docs) before starting work. Extract current context, active milestones, and recommended protocols.
2. **Clean Delegation:** Directly invoke and delegate to existing workflows (`/audit`, `/checkpoint`, `/updategit`, `/mergegit`, `/verify`) without duplicating their internal logic.
3. **Interactive GitHub Repository Verification:** Never assume or automatically commit to a remote without explicit confirmation. Always prompt the user directly for the exact GitHub repository name or URL and verify that `git remote -v` matches before executing git operations.
4. **Zero Fluff & Concise Output:** Maintain momentum and report outcomes concisely.

---

## WORKFLOW

### Phase 1: Markdown Discovery & Context Ingestion
1. Search the current project workspace for all relevant markdown files (`README.md`, `docs/*.md`, `*_BLUEPRINT.md`, `checklist.md`, `ROADMAP.md`, `WORKFLOW*.md`).
2. Read and synthesize:
   - System architecture and core philosophies.
   - Current ecosystem state and recent changes.
   - Active roadmap, open to-do items, and incomplete milestones.
   - Recommended test harnesses, build commands, and execution protocols.

### Phase 2: Protocol & Codebase Execution
1. Implement the requested updates, bug fixes, or enhancements according to the discovered blueprint/markdowns.
2. Optimize for performance, efficiency, and clean architecture.
3. Run project verification commands or invoke `/verify` to validate stability and pass all test suites.
4. Synchronize project tracking files (e.g. `checklist.md`, `roadmap.md`) to reflect completed milestones.

### Phase 3: System & Security Audit
1. Execute `/audit` across the project repository and environment:
   - Phase 1: Secrets & credentials scan (zero leak guarantee).
   - Phase 2: Git defenses & `.gitignore` hardening.
   - Phase 3: Repository parity & branch alignment.
   - Phase 4: Network port & service loopback verification.
   - Phase 5: Storage headroom and endpoint latency health.
   - Phase 6: Ecosystem audit artifact generation.

### Phase 4: GitHub Repository Verification Gate
1. Inspect the local repository remote:
   ```bash
   git remote -v
   ```
2. **MANDATORY USER CONFIRMATION:** Prompt the user directly to confirm or supply the exact target GitHub repository name or URL (e.g., `https://github.com/<owner>/<repo>` or `git@github.com:<owner>/<repo>.git`):
   - Compare the user's confirmed repository against the current git remote.
   - If there is a mismatch or ambiguity, stop immediately and ask for resolution before proceeding.
   - Only proceed once the target repository is 100% verified.

### Phase 5: Safe Git Checkpoint
1. Execute `/checkpoint` on the verified repository:
   - Isolate work on an appropriate feature branch (`feat/*`, `fix/*`, `wip/*`).
   - Triage untracked files and auto-ignore noise/secrets in `.gitignore`.
   - Stage all safe changes and commit with conventional commit format.
   - Push feature branch to `origin HEAD`.

### Phase 6: Branch Sync & Update
1. Execute `/updategit` on the feature branch:
   - Fetch upstream changes (`git fetch origin`).
   - Rebase or sync with base if necessary.
   - Verify clean working tree.
   - Push updated feature branch to origin.

### Phase 7: Production Promotion & Cleanup
1. Execute `/mergegit` to promote verified changes to the default branch:
   - Switch to default branch (`git checkout main`).
   - Pull latest upstream (`git pull origin main`).
   - Merge the feature branch into default branch (`git merge <feature_branch>`).
   - Push merged default branch to origin (`git push origin main`).
   - Prune and delete feature branch locally (`git branch -d`) and remotely (`git push origin --delete`).
   - Fetch with prune (`git fetch -p`).

---

## OUTPUT
Report back to the user concisely with:
1. Completed project updates and milestone progress.
2. Audit result summary.
3. Verified GitHub repository and merged commit details.
4. Clean workspace confirmation.
