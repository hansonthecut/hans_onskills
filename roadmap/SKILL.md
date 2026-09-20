---
name: roadmap
description: Generates a high-fidelity Execution & Context Tracker. Trigger with /roadmap or roadmap.
---

Distill project context and `docs/checklist.md` into a structured, high-fidelity Execution & Context Tracker.

CONTEXT EVALUATION:
Analyze the user's request and the current codebase. Use the 'Code-as-Authority' rule: if the source code shows an implementation that contradicts existing documentation, prioritize the code's reality for the 'Completed' section.

FILE STRUCTURE (Strict Markdown):

1. **Title**: `# [Project Name]: Execution & Context Tracker`
2. **Milestones Section**: `## Summary of All Completed Milestones`. 
   * **Format**: Use a bulleted list. **Bold** the key technical/operational achievement, followed by a brief description.
   * **Content Rule (CRITICAL)**: Be concise but highly informative. Synthesize and consolidate tasks that build upon one another to prevent redundancy and manage section size. However, you must **never** lose, omit, or delete underlying details, data, or historical achievements. The context of every completed milestone must remain fully captured and represented.
3. **Divider**: A horizontal rule `---`.
4. **Roadmap Section**: `## Active Roadmap: To-Do Items`.
5. **Meaningful Phase Groupings & Ordering**: 
   * Break the roadmap into `### Phase [Sequential Number]: [Phase Name]`.
   * **Sequence & Ordering**: Phases must be meaningfully ordered to reflect clear dependency flow and execution progression. Number sequentially using integers (`1`, `2`, `3`, etc.) wherever possible.
   * **Edge Cases (Phase 0 & Decimals)**: Use `Phase 0: [Name]` for prerequisites, exploratory spikes, or baseline setup. Use decimal numbering (e.g., `Phase 1.5`, `Phase 2.1`) for tactical interim phases or inserting sub-milestones without disrupting existing phase sequencing.
6. **Task Management & Organization**: 
   * **Format**: Use standard Markdown checkboxes (e.g., `- [ ]`, `- [x]`). **Bold** the task title.
   * **Completed Tasks**: Migrate all finished tasks to the 'Completed Milestones' section upon completion (unless instructed otherwise).
   * **Pending Tasks**: Organize all remaining tasks logically under their respective Phase headings.
   * **Data Preservation (CRITICAL)**: Do not duplicate existing tasks. Never overwrite, modify, or delete incomplete tasks. Always retain historical pending data when adding new items.

OUTPUT INSTRUCTION:
1. Read the current `docs/checklist.md`.
2. Use your file-writing tool to overwrite/update `docs/checklist.md` with the refined content based on the latest context.
3. Report back to the user concisely.
