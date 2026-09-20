---
name: prebuild
description: Establish a highly reliable local workflow and guarantee codebase stability before pushing to Git or triggering expensive EAS cloud builds. Trigger with /prebuild or prebuild.
---

Establish a reliable local workflow and guarantee codebase stability before pushing to Git or triggering expensive EAS cloud builds.


## **EXECUTION RULES**
- **Non-interactive Shell:** ALL shell commands must be executed non-interactively. Prefix commands with `CI=true`. Use flags like `-y`, `--yes`, or `--force` where applicable to prevent the terminal from hanging on user prompts.
- **Context Gathering:** Before starting, analyze the workspace to identify the Package Manager and target package context.
- **The Golden Rule:** Never commit the generated `android/` or `ios/` folders. They are local inspection artifacts. Keep them local, inspect your generated assets, and rest easy knowing your cloud EAS build will succeed.


## **THE PRE-FLIGHT VERIFICATION WORKFLOW**
Running these checks in this exact order prevents wasting time debugging bundling or runtime failures caused by underlying type mismatches or incorrect dependency versions.

### **Phase 1: Dependency Alignment & Diagnostics**
1. Run `CI=true pnpm install`.
2. Run `CI=true pnpm --filter <package> exec expo install --fix`.
3. Run `CI=true pnpm --filter <package> exec expo doctor`.

### **Phase 2: Static Analysis**
4. Run `CI=true pnpm --filter <package> check-types`.
5. Run `CI=true pnpm --filter <package> exec eslint . --fix`.

### **Phase 3: Domain Logic Validation**
6. Run `CI=true pnpm test`.

### **Phase 4: Bundling & Prebuild Smoke-Testing**
7. Run `CI=true pnpm --filter <package> exec expo export --platform all`.
8. Run `CI=true pnpm --filter <package> exec expo prebuild --clean`.

### **Phase 5: Report Back to User**
Report back to the user concisely.


## **WINDOWS-SPECIFIC CAVEATS**
- **Android (Fully Valid):** Executes exactly as on EAS. Generates `android/` with all Gradle files/resources.
- **iOS (Partially Valid):** Generates `ios/` structure and Xcode files but skips `pod install` (requires macOS). Still validates asset paths and `app.config.ts`.
