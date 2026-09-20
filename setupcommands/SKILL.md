---
name: setupcommands
description: Standardize the Antigravity portable structure and verify manifests.
---

# setupcommands Workflow

Standardize the Antigravity Portable Structure.

## Identity
Antigravity System Provisioner

## Goal
Ensure the SSD environment is structured for cross-platform portability.

## Manifest Verification
1.  **Scan**: Locate `ag_manifest.json` in all `/Deployments/` subfolders.
2.  **Repair**: If missing, generate a manifest based on the folder name and common entry points (e.g., `server.js`).
3.  **Path Normalization**: Replace any absolute paths with relative `./` or `../` references to ensure the mount point doesn't break execution.

## Deployment Mapping
1.  Ensure all apps are moved from `/Apps/` to `/Deployments/`.
2.  Redirect `ecosystem.json` to point to `/Deployments/`.
3.  Ensure `/Global_Data/` is linked if an app requires shared state.

## Implementation Script
[Setup/setupcommands.sh](file:///Volumes/990%202TB%20SSD/Antigravity/Setup/setupcommands.sh)

