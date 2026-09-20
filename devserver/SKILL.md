---
name: devserver
description: Configures (setup mode) or launches (startup mode) the development server with dynamic port selection and log streaming. Trigger with /devserver or devserver.
---

Environment Orchestrator across workspace projects. Parses intent to execute **Setup Mode** or **Startup Mode**.

---

## **MODES OVERVIEW**

| Mode | Purpose | Triggers |
| :--- | :--- | :--- |
| **Setup Mode** | Prepares, verifies, and configures dependencies and environment. | "setup", "configure", "install", "prep", "doctor" |
| **Startup Mode** | Discovers open port, launches devserver in background, and streams output. | "run", "start", "tunnel", "remote", "clear", "no cache", "/devserver" |

---

## **MODE 1: SETUP MODE**

1. **Target & Structure**: Scan prompt for project or resolve active workspace; detect Monorepo (`apps/*`) or Standalone.
2. **Profile Script Injection**: Ensure standard scripts exist in `package.json` (inject if missing):
   - **App `package.json`**:
     - `"dev"`: `"expo start --lan"`
     - `"dev:tunnel"`: `"expo start --tunnel"`
     - `"dev:remote"`: `"expo start --tunnel --clear"`
     - `"dev:clear"`: `"expo start --lan --clear"`
   - **Monorepo Root `package.json`** (if applicable):
     - `"<project>:dev"`: `"pnpm --filter <app> dev"`
     - `"<project>:tunnel"`: `"pnpm --filter <app> dev:tunnel"`
     - `"<project>:remote"`: `"pnpm --filter <app> dev:remote"`
     - `"<project>:clear"`: `"pnpm --filter <app> dev:clear"`
3. **Tunnel Dependency**: Ensure `@expo/ngrok` is installed in `devDependencies` (required for tunnel/remote modes).
4. **Environment & Secrets**: Verify `.env` exists (copy from `.env.example` if missing).
5. **Diagnostics & Health Check**: Run `pnpm install` if out of sync; check ports 8081–8085 via `Get-NetTCPConnection`.
6. **Confirmation**: Report configured profiles and readiness concisely.

---

## **MODE 2: STARTUP MODE**

### **1. Target Project & Script Resolution**
- **Project**: Scan prompt for explicit project references, or default to current active workspace.
- **Script**: Map intent to `<project>:<mode>` (fallback: `dev:<mode>`):
  - *Clear / No Cache*: `<project>:clear`
  - *Tunnel*: `<project>:tunnel`
  - *Remote / All*: `<project>:remote`
  - *Standard*: `<project>:dev`

### **2. Launch Pipeline**
Execute in project root via `run_command` (`WaitMsBeforeAsync: 3000-5000`):

```powershell
Remove-Item server.log -ErrorAction SilentlyContinue; $p=(8081..8085|?{!(Get-NetTCPConnection -LocalPort $_ -ea 0)})[0]; cmd /c "pnpm <target_script> -- --port $p 2>&1" | tee server.log
```

### **3. Monitoring & Health Check**
- Confirm the selected port is listening and Metro bundler initialized cleanly without fatal errors.
- Query `http://localhost:<port>/_expo/open` or inspect `server.log` to extract active URLs.

---

## **REPORT BACK TO USER**

Report concisely to the user:
- **Expo:** `[exp://<host>](http://<host>/_expo/link?platform=ios)` *(route via `_expo/link` redirect so markdown parsers do not prefix `\` or `/` before `exp://`)*
- **Web:** `[http://<host>](http://<host>/)`
