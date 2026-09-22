---
name: status
description: Autonomous real-time execution & task tracker. Generates live structured status dossiers of active AI agent operations, ongoing background tasks, git states, and next milestones. Trigger with /status or status.
---

# Live Execution & Task Status Reporter Protocol

Acts as an autonomous real-time monitor to inspect, track, and report exactly what the AI agent is actively executing, what background tasks and daemons are alive, what codebase changes have occurred, and what milestones remain.

---

## EXECUTION PHASES & RULES

Execute the following phases sequentially:

### Phase 1: Context & Intent Extraction
1. **Analyze Conversation Trajectory:**
   - Read the most recent user prompts and identify the active primary mission and constraints.
   - Determine current phase: Research, Planning, Execution, or Verification.
2. **Inspect Background Tasks & Services:**
   - Query all running background tasks (via `manage_task` action `list`).
   - Check listening server ports (e.g. 9988 for Hans_ongrades bridge, dev servers, CDP ports).
   - Verify health and uptime of long-running daemons.

### Phase 2: Codebase & Infrastructure State Introspection
1. **Repository & Git Delta:**
   - Run `git status -s` across active project repositories to list modified, untracked, or staged files.
   - Identify active git branch and upstream sync status.
2. **Recent Accomplishments & Technical Findings:**
   - Extract files modified, tools built, or configurations altered during the current session.
   - Highlight any errors encountered and the exact fixes applied.

### Phase 3: Live Status Dossier Generation
1. **Generate Structured Report:**
   Construct a clean, high-impact report using GitHub Flavored Markdown with the following strict sections:
   - **Mission Objective**: Concise summary of what the user requested and what the agent is solving.
   - **Live Progress Matrix**: Sequential breakdown of phases with clear status badges:
     - `🟢 COMPLETED` for finished and verified items
     - `🟡 IN PROGRESS` for the sub-task currently being executed
     - `⚪ QUEUED` for pending steps
   - **Active Background Processes & Daemons**: Table of task IDs, descriptions, ports, and operational status.
   - **Code & Environment State**: Active git branch, modified files, and system health.
   - **Immediate Next Actions**: 1–3 concrete, sequential actions the agent is executing next.

2. **File Persistence:**
   - Write or update `status.md` in the active artifact/conversation directory so the report persists and can be referenced.
   - Output the concise status dossier directly into the chat for immediate user visibility.

---

## REPORT TEMPLATE FORMAT

```markdown
# 🛰️ [Mission Name] — Live Execution Status

> **Current Focus**: [Brief description of what is happening right now]
> **Status**: [🟢 On Track | 🟡 In Progress | 🔴 Blocked] &nbsp;|&nbsp; **Local Time**: [Timestamp]

---

### 📋 Phase & Milestone Progress

| Phase | Milestone / Task | Status | Details |
|---|---|---|---|
| **Phase 1** | [Task Title] | `🟢 COMPLETED` | [Brief result] |
| **Phase 2** | [Task Title] | `🟡 IN PROGRESS` | [Active detail] |
| **Phase 3** | [Task Title] | `⚪ QUEUED` | [Pending prerequisite] |

---

### ⚙️ Active Tasks, Services & Ports

- **Daemon Tasks**: [List running task IDs and commands]
- **Active Ports**: [e.g. http://127.0.0.1:9988 (Hans_ongrades Engine)]
- **Host Application**: [e.g. DaVinci Resolve Studio — Project: "Afroplus Fest"]

---

### 📂 Codebase Delta & Recent Edits

- **Modified Files**:
  - `[filepath]`: [Summary of changes]
- **Git Branch**: `[branch]` ([Status: clean / dirty])

---

### 🎯 Immediate Next Steps

1. **[Step 1]**: [Action]
2. **[Step 2]**: [Action]
```
