# AGENTS.md

## Project Overview

FreelancePrep is a native iOS application designed to help freelancers manage projects, estimate profitability, track expenses, and evaluate their effective hourly earnings.

The project uses Swift and Swift Package Manager for its cross-platform core logic. The eventual iOS interface will use SwiftUI.

## Required Context

Before beginning development:

1. Read `AGENTS.md`.
2. Read `ARCHITECTURE.md`.
3. Read `ROADMAP.md`.
4. Read `STATUS.md`.
5. Inspect the relevant existing source code and tests.

Do not assume a feature is implemented solely because it appears in the roadmap.

## Development Rules

- Use Swift 6.4.2 and Swift Package Manager for the current core package.
- Maintain compatibility with Windows for `FreelancePrepCore`.
- Keep business logic independent of SwiftUI.
- Follow existing project conventions.
- Prefer simple, maintainable implementations over unnecessary abstractions.
- Do not introduce external dependencies without approval.
- Do not modify unrelated files.
- Do not remove working functionality without authorization.
- Never hardcode credentials, API keys, or sensitive user information.
- Do not make global system or IDE configuration changes without approval.
- Use Xcode build configurations for non-secret app settings.
- Never assume values bundled in an iOS app are secret.
- Store user-specific credentials in iOS Keychain.
- Keep developer-owned private API keys on a trusted backend.
- Never commit local secret files to Git.
- Never print sensitive credentials in logs or test output.


## Agent Responsibilities

Agents must:

- Understand the assigned task before modifying code.
- Identify affected files and dependencies.
- Implement only the assigned scope.
- Add or update tests for changed behavior.
- Explain architectural decisions when necessary.
- Report blockers instead of inventing solutions or silently changing requirements.

## Parallel Development

When multiple agents work simultaneously:

- Prefer separate Git branches and worktrees.
- Assign clear file ownership to reduce conflicts.
- Agree on shared interfaces before parallel implementation.
- Avoid editing another agent's assigned files.
- Do not merge branches automatically.
- Do not overwrite another agent's work.

## Validation

Before reporting completion, run:

```cmd
swift build
swift test
```

If validation cannot run, explain why.

Never claim tests passed unless they actually executed successfully.

## Documentation

After completing an approved task:

- Update `STATUS.md` with verified progress.
- Update `ROADMAP.md` when milestones or requirements change.
- Update `ARCHITECTURE.md` when technical design decisions change.
- Update `AGENTS.md` only when development rules change.

Do not mark a feature complete until its acceptance criteria have been met.

## Git Rules

- Never force-push.
- Never reset or discard uncommitted user changes.
- Do not commit, merge, or push without authorization.
- Keep changes focused and reviewable.

## Task Completion Report

At the end of each task, provide:

1. Summary of implementation.
2. Files created or modified.
3. Build and test results.
4. Outstanding issues or limitations.
5. Recommended next step.