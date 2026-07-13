# AGENTS.md

## Scope
This repository is a Marlin 2.1.x firmware fork for Neptune 2S on MKS Robin Nano V3.1 hardware.

## Build And Test Ownership
- The user runs all builds and tests from the VS Code UI (Tasks / PlatformIO / Auto Build Marlin).
- Agents must not run build or test commands in terminal tools.
- Even if explicitly asked, agents must not execute build/test commands; instead, ask the user to run them in the VS Code UI and share the resulting output.
- Agents should still identify the intended target environment for the user:
  - Default: `mks_robin_nano_v3_1`
  - Common variant: `mks_robin_nano_v3_1_usb_flash_drive`
- When verification is needed, agents ask the user to run the relevant UI task and then analyze the reported errors.

## Verification In VS Code UI
- Use VS Code UI tasks for verification, selected by the user.
- If the user asks what to run, suggest the matching task/target, but do not execute it.

## High-Value Files
- Main firmware config: [Marlin/Configuration.h](Marlin/Configuration.h), [Marlin/Configuration_adv.h](Marlin/Configuration_adv.h)
- PlatformIO root config: [platformio.ini](platformio.ini)
- STM32F4 board environments: [ini/stm32f4.ini](ini/stm32f4.ini)
- Board ID mapping: [Marlin/src/core/boards.h](Marlin/src/core/boards.h)
- Board-to-pins include routing: [Marlin/src/pins/pins.h](Marlin/src/pins/pins.h)
- Build/test helpers: [Makefile](Makefile), [buildroot/bin/mftest](buildroot/bin/mftest), [buildroot/bin/run_tests](buildroot/bin/run_tests)

## Repo-Specific Conventions
- Keep board and environment aligned:
  - `MOTHERBOARD` in [Marlin/Configuration.h](Marlin/Configuration.h) must match the chosen PlatformIO environment in [platformio.ini](platformio.ini) and [ini/stm32f4.ini](ini/stm32f4.ini).
- Prefer small, targeted changes in config headers over broad refactors.
- Preserve Marlin preprocessor style and feature guards (`#if`, `ENABLED(...)`, `DISABLED(...)`, `TERN(...)`).

## Agent Workflow
1. Confirm target environment before changing behavior (`mks_robin_nano_v3_1` vs USB flash-drive variant).
2. Make minimal edits in config or feature files.
3. Ask the user to run the build/test from VS Code UI when validation is needed.
4. Analyze user-provided build/test output and propose focused fixes.

## Build Failure Triage
- If a build fails, agents can use VS Code-exposed task/terminal output when available in this chat session.
- If output is incomplete, agents should ask the user to share the failing log lines/error block and then continue diagnosis.

## Log Request Template
- When build/test output is incomplete, agents should ask:
  - "Please run the build/test in VS Code UI and paste the first error block, including about 20 lines before and after the error."
  - "Also include the target environment name shown by the task (for example `mks_robin_nano_v3_1_usb_flash_drive`)."

## Pitfalls
- Test command names differ between docs and Makefile:
  - Root README mentions `tests-config-*`, but local Makefile targets are `tests-all-local` and `tests-single-local`.
- `buildroot/bin/run_tests` updates `Marlin/config.ini` during test runs and restores/reset logic can run in CI flows. Avoid running with destructive reset flags unless explicitly requested.
- `buildroot/bin/mftest` assumes it is run from repository root.

## Reference Docs
- Project overview and contribution/testing notes: [README.md](README.md)
- Unit test architecture: [test/README.md](test/README.md)
- Internal design docs: [docs/Maintenance.md](docs/Maintenance.md), [docs/Queue.md](docs/Queue.md), [docs/Serial.md](docs/Serial.md)

## Optional Next Customizations
If you want stricter automation next, add:
- A file-scoped instruction for config-only edits (`.github/instructions/marlin-config.instructions.md`).
- A reusable build-and-verify prompt (`.github/prompts/build-target.prompt.md`).
- A skill for board-switch workflows (`.github/skills/switch-board/SKILL.md`).
