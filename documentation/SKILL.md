---
name: documentation
description: Acts as a Systems Architect to generate deeply technical, standardized documentation reflecting the exact state of the project, with a focus on feature classification and technical optimization. Trigger with /documentation or documentation.
---

Create and maintain comprehensive, deeply technical documentation reflecting codebase architecture and implementation reality.

---

## **AI Agent Guidelines (Mermaid & Architecture)**

### 1. General Principles
- **Directionality**: Always prefer **Left-to-Right** (`graph LR` or `flowchart LR`) for clarity.
- **Technical Parity**: Ground diagrams in the project's reality. Include file paths (e.g., `"@src/core/service.ts"`) or specific module names in node labels.
- **Density**: Use detailed text but format it for readability. Research the specific architecture of the current project to find these details.

### 2. Text & Formatting Rules
- **Line Breaks**: **Mandatory**. Use `<br/>` to control wrapping.
- **Word Limit**: Aim for **4-5 words per line**.
- **Line Limit**: Maximum **6 lines** per node for rich detail.
- **Parse Safety**: **ALWAYS** enclose node labels in double quotes (e.g., `Node["Label"]`).

### 3. Node Types & Aesthetics
Use specialized shapes to provide instant visual cues:
| Shape Syntax      | Representation                   | Use Case                                      |
| :---------------- | :------------------------------- | :-------------------------------------------- |
| `node(["Text"])`  | **Stadium / Capsule**            | Major Service, Singleton, or Entry Point.     |
| `node[("Text")]`  | **Cylinder / Database**          | Persistent Storage (DB, Cache, File Store).   |
| `node[[ "Text" ]]`| **Subroutine**                   | Specific Hook or background process.          |
| `node{{ "Text" }}`| **Hexagon / Decision**           | Logic branches or conditional gates.          |
| `subgraph ... end`| **Logical Group**                | Bundling related services or layers.          |

### 4. Layout Hygiene
- **Master vs. Specialized**: Provide a **Master Context** diagram at the start (High Level), followed by **Specialized Diagrams** for individual features or complex state machines.
- **Sequence Diagrams**: Use descriptive aliases with paths and `Note over` blocks to describe phases or rules.

---

## **PHASE 1: Deep Architectural Discovery (Read-Only)**
Before writing, deeply analyze the current reality of the codebase. Use your file reading tools to investigate:
1. **Workspace & Stack:** Map monorepo structure (e.g., Turborepo, pnpm), core frameworks (e.g., Expo, Next.js), and major infrastructure (e.g., Firebase, AWS).
2. **Intent & Mode Mapping:** Analyze feature logic (hooks, services) to distinguish between different "modes" of operation.
3. **Routing & State Orchestration:** Inspect navigation layouts and state management to understand global UI behavior and persistence.
4. **Performance & Data Strategy:** Map the data layer and identify optimization patterns.
5. **Design System & UI Standards:** Inspect centralized UI packages for design tokens and component patterns.
6. **Verification & Quality:** Identify testing patterns and code health mandates.
7. **Review**: Read all markdown files in the project to formulate a documentation plan.

---

## **PHASE 2: Documentation Suite Generation & Sync**
Create or update the following files. **CRITICAL NON-DESTRUCTIVE RULE:** If a document already exists, refine it for currency and add to it without stripping existing detail.
- `README.md`: Technical onboarding, stack summary, setup, and annotated project structure tree.
- `GEMINI.md`: AI operating instructions, workspace conventions, operational constraints, and boundaries.
- `architecture.md`: Visual architecture maps using high-fidelity Mermaid diagrams.
- `PRD.md`: Product strategy and user intent classification.
- `{project-name}.md`: System and implementation blueprint covering lifecycle, routing, core loops, and state transitions.
- `backend.md`: Data and infrastructure strategy, optimization rules, and security definitions.
- `theme.md`: Visual and interactive tokens and styling standards.
- `testing.md`: Verification plan and environment constraints.
- `checklist.md`: Completed milestones and active to-do tracking.
- `review.md`: Security, integrity, PII, and safety assessment.

---

## **PHASE 3: Report Back to User**
Report back to the user concisely.
