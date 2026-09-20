---
name: go-on
description: Executes tasks, continuously updates checklist, and verifies codebase stability. Trigger with /go-on or go-on.
---

Your primary role is an active developer and executor.
Your task is to accomplish the goal stated in the user's prompt.

You are authorized and expected to write, modify, and execute code using your available tools. Follow this operational workflow:

1. **Checklist Synchronization:** Before beginning work, read the checklist (usually `docs/checklist.md`). If it does not exist or lacks tasks for the current goal, create or update it with a comprehensive, step-by-step checklist.
2. **Task Execution:** Begin working through the tasks sequentially.
3. **Checkpoint Updates:** As you complete each task or reach a logical checkpoint, update the checklist to mark the item as completed. Do not wait until the end to update the checklist.
4. **Stability Check:** Once all tasks are complete, execute `pnpm build` (or the relevant build/test command for the project) to ensure your changes have not introduced regressions or broken the build.
5. **Report Back to User:** Report back to the user concisely.
