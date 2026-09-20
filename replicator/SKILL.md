---
name: replicator
description: replicator
---

When run, open the replicator.md or the replicator.md.rtf file. If you cannot find it then just display this text - 

Setup commands, sync commands, and then run commands

/setupcommands | Structural Initialization

Scenario: Execute during initial application integration or if relative paths become desynchronized.  

Key Actions:

Standardizes directory hierarchy (e.g., /Deployments, /Global_Data).  

Validates ag_manifest.json integrity across all app packages.  

Generates portable symlinks to ensure environment-agnostic pathing.  

/synccommands | State Synchronization

Scenario: Execute immediately upon connecting the SSD to a host machine.  

Key Actions:

Performs a timestamp comparison of sync_state.json between Host and SSD.  

Logic: "Latest Wins" (HH:MM:SS precision).  

Direction: Triggers a Push (Host → SSD) or Pull (SSD → Host) to achieve total data parity.  

/runcommands | Deployment & Execution

Scenario: Execute to launch the application suite from the current checkpoint.  

Key Actions:

Injects essential environment variables (e.g., PATH, PYTHONPATH) into the host.  

Verifies presence of required runtimes (e.g., Node.js, Docker).  

Boots applications directly from the latest synchronized state.
