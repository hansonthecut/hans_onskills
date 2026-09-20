---
name: applauncher
description: Launches the Antigravity ecosystem and synchronizes data.
---

# /applauncher | Universal Launcher

**Scenario**: Execute to start the Antigravity suite of applications, ensure data is synchronized between the SSD and local Mac, and open the Mission Control dashboard.

### Key Actions:
1. **Sync**: Performs a bidirectional sync between `/Volumes/990 2TB SSD/Antigravity` and `~/Antigravity` to ensure the latest data is available.
2. **Boot**: Initializes all seven core services in the background:
   - neural-command-center (Port 3000)
   - ejectinator (Port 3001)
   - outreach-engine (Port 3002)
   - lo-scout (Port 3003)
   - 107master (Port 50134)
   - life-calendar (Port 50135)
   - document-converter (Port 3004)
   - live-host (Port 3006)
3. **Launch**: Opens the primary Mission Control hub in the default browser.

### Execution:
Runs the `start_all.sh` script located in the root of the Antigravity SSD.
