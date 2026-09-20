---
name: audit
description: Autonomous full-system security, performance, infrastructure, and safety auditor. Audits git repositories, scans secrets, verifies ports, evaluates disk capacity, checks .gitignore defenses, and tests endpoint latencies. Trigger with /audit or audit.
---

Perform a comprehensive security, performance, infrastructure, and safety audit across all active repositories, global skills, host services, and portable SSD environments.

---

## **AUDIT PHASES & EXECUTION RULES**

Execute the following phases strictly sequentially:

### **Phase 1: Secrets & Credentials Scan (Zero Leak Guarantee)**
1. Scan all repositories (`hans_onskills`, `Hans_ongrades`, `hanson_interactive_resume`, `Drone`, etc.) and `~/.gemini/config/skills` for accidentally committed secrets using ripgrep:
   - GitHub PATs: `(ghp_[a-zA-Z0-9]{36}|github_pat_[a-zA-Z0-9_]{50,})`
   - AWS Keys: `AKIA[0-9A-Z]{16}`
   - Google AI Keys: `AIza[0-9A-Za-z\-_]{35}`
   - OpenAI / Anthropic Keys: `sk-[a-zA-Z0-9]{20,}`
   - Private Keys: `BEGIN (RSA|EC|OPENSSH|DSA|PGP)? PRIVATE KEY`
2. If any exposed secret is detected, immediately alert the user and recommend credential rotation.

### **Phase 2: Git Defense & .gitignore Hardening**
1. Inspect the `.gitignore` of each active repository.
2. Verify protection against:
   - Environment variables: `.env`, `.env.*`
   - Certificates / Keys: `*.pem`, `*.key`, `*.token`, `*.p12`
   - OS & editor artifacts: `.DS_Store`, `*.swp`
   - Heavy cache files: `CacheClip/`, `.gallery/`, `*.dpx`, `*.pyc`, `__pycache__/`
3. Proactively harden any `.gitignore` missing these standard defenses.

### **Phase 3: Repository Parity & Branch Synchronization**
1. For each repository:
   - Check `git status -s` for untracked or uncommitted changes.
   - Check remote configuration (`git remote -v`) to ensure correct URLs, casing, and SSH connectivity (`git@github.com`).
   - Check branch alignment (`git branch -a`) to verify feature branches are merged into `main` and pushed to origin.

### **Phase 4: Infrastructure & Network Port Verification**
1. Scan active listening TCP ports via `lsof -iTCP -sTCP:LISTEN -n -P`.
2. Verify all development and agent services (CDP on 9222, Antigravity language services on 49331-49334, Raycast on 7265) are strictly bound to loopback `127.0.0.1`.
3. Confirm no sensitive developer services or debugging ports are exposed on `0.0.0.0` or public interfaces.

### **Phase 5: Performance, Storage & Endpoint Health**
1. Check SSD and internal disk capacity via `df -h`. Verify at least 15% free headroom.
2. Perform latency checks (`fetch` or `curl -I`) against production websites and repositories:
   - Verify HTTP status codes (`200 OK`) and latency under 500ms.
3. If Node.js packages exist, run non-interactive dependency audits (`npm audit --json`).

### **Phase 6: Audit Report & Deliverables**
Generate or update the `full_ecosystem_audit.md` artifact summarizing:
1. Executive Summary Table (Secrets, Git Defenses, Disk Health, Network, Dependencies).
2. Repositories Deep Dive with status and actions taken.
3. Network and port inspection results.
4. Storage and latency metrics.

Report back to the user concisely.
