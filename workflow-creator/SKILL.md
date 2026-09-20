---
name: workflow-creator
description: Create and standardize new agent skills as single SKILL.md packages. Enforces clean cross-skill delegation, portable paths, sequential phasing, and automatic cataloging. Trigger with /workflow-creator or workflow creator.
---

Create and standardize new agent skills into clean, modular `SKILL.md` packages.

---

## CORE STANDARDS

1. **Clean Delegation (Zero Duplicate Explanations):**
   - If a new skill needs functionality already handled by an existing skill (e.g., `/verify`, `/visualtest`, `/humanize`, `/roadmap`, `/updategit`), reference or delegate to it directly by name.
   - **Never explain what the external skill does or re-describe its inner mechanics.** Explaining external skills causes documentation drift and contradictions when those skills evolve. Maintain a single source of truth.

2. **Portability & Privacy:**
   - Never hardcode host user paths (`C:\Users\...`). Always use `$HOME`, `%USERPROFILE%`, or `~`.
   - In PowerShell commands, use `$env:USERPROFILE` or `$HOME` (CLI executables on Windows do not expand `~`).
   - Never hardcode account handles, API keys, tokens, or credentials. Parameterize via environment variables or runtime resolution.

3. **Sequential Phasing:**
   - Order phases sequentially (`Phase 1`, `Phase 2`, etc.) based on execution flow.
   - Use `Phase 0: [Name]` for prerequisites or baseline checks when applicable.
   - Use decimal numbering (e.g., `Phase 1.5`) only for tactical fallbacks or sub-gates.

4. **No Fluff or Bloat (Concise as Necessary):**
   - Write direct, actionable instructions. Strictly eliminate conversational preambles, artificial roleplay intros, and redundant explanations. Every line must directly guide agent execution.

5. **Concise Reporting:**
   - The final phase must always end with `Report back to the user concisely.` without verbose summaries, code dumps, or status walls.

---

## WORKFLOW

### Phase 1: Structure & Draft
Create `~/.gemini/config/skills/<skill-name>/SKILL.md` using this template:

```markdown
---
name: <skill-name>
description: <concise summary of capability; include trigger phrases like /<skill-name>>
---

<Brief direct statement of purpose>

---

## GUIDELINES & CONSTRAINTS
<Essential rules and boundaries>

---

## WORKFLOW

### Phase 1: [First Step]
<Actionable instructions>

### Phase 2: [Next Step]
<Actionable instructions; delegate to existing skills by name without re-explaining them>

---

## OUTPUT
Report back to the user concisely.
```

### Phase 2: Catalog Synchronization
Add or update the skill entry in `~/.gemini/config/skills/README.md` under the `## Skills Catalog` table in alphabetical order.

### Phase 3: Version Control
Stage, commit, and push changes to git:
```bash
git add <skill-name>/SKILL.md README.md
git commit -m "feat(skills): add <skill-name> skill"
git push origin main
```

### Phase 4: Output
Report back to the user concisely.
