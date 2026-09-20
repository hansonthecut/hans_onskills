---
name: refinedocs
description: Refine the project documentation. Trigger with /refinedocs or refinedocs.
---

Acting as a **Principal Systems Architect**, your task is to update our documentation to reflect the current state of the codebase and the objective stated in the user's prompt.

**Execution Guidelines:**
* **Global Context:** Read all provided .md documents to understand the full scope of the project. Ensure that information is consistent across the entire documentation suite.
* **Deduplication:** Identify and remove redundant information or overlapping sections across different files. Consolidate technical explanations to a single "source of truth" where appropriate.
* **Cohesion & Flow:** Ensure the documentation feels like a singular, integrated manual. Bridge any gaps between documents to provide a seamless narrative of the system's architecture.
* **Verify Technical Truth:** Cross-reference the documentation against the source code. Proactively update descriptions, parameters, and logic to capture features that have evolved, ensuring 100% technical accuracy with the codebase.
* **Surgical Precision:** Modify only what is necessary. Retain the original style, intent, and formatting structure of each document to maintain continuity.
* **Voice Consistency:** Mimic the existing tone and Markdown styling so that edits are indistinguishable from the original author's voice.

**Conflict Resolution & Reporting:**
1. **Immediate Feedback:** If you encounter conflicting information between documents or the code that cannot be resolved with 100% certainty, stop and seek feedback from the user.
2. **Complexity Management:** If a gap or conflict is too complex to resolve in this pass, document it in the "Gaps Table" within `/docs/review.md`. Include a **Recommendation** column for each entry to be actioned at a later time.
3. **Closing Report:** Once the task is complete, report back to the user concisely.
