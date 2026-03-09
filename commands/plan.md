---
description: Create a detailed implementation plan for a feature or project
---

# Implementation Plan

Analyze requirements and produce a structured, phased implementation plan with dependencies and risks.

## Steps

1. Clarify requirements:
   - Identify the feature or change to implement.
   - List the functional requirements (what it must do).
   - List the non-functional requirements (performance, security, scalability).
   - Identify any ambiguities and resolve them before planning.

2. Analyze the existing codebase:
   - Identify files and modules that will be affected.
   - Map out dependencies between affected modules.
   - Note existing patterns and conventions to follow.
   - Identify any technical debt that may complicate implementation.

3. Break down into phases:
   - Phase 1: Foundation — data models, schemas, types, and interfaces.
   - Phase 2: Core logic — business rules, services, and utilities.
   - Phase 3: Integration — API endpoints, UI components, and wiring.
   - Phase 4: Testing — unit, integration, and E2E tests.
   - Phase 5: Refinement — error handling, validation, edge cases.

4. For each phase, list specific tasks:
   - File path and what will be created or modified.
   - Function or component name and its responsibility.
   - Dependencies on other tasks within or across phases.
   - Estimated complexity (low, medium, high).

5. Identify risks and mitigations:
   - Technical risks: unfamiliar APIs, complex integrations, performance concerns.
   - Dependency risks: external services, third-party libraries, team coordination.
   - For each risk, propose a mitigation strategy or fallback plan.

6. Define the testing strategy:
   - What unit tests are needed and for which modules.
   - What integration tests cover the feature end-to-end.
   - What E2E tests validate the user flow.
   - Target coverage: 80% or higher.

7. Review the plan for completeness:
   - Verify all requirements are addressed.
   - Verify dependencies are correctly ordered.
   - Check that no steps are missing or redundant.

## If Requirements Are Unclear

- List specific questions that need answers before proceeding.
- Propose reasonable defaults for ambiguous requirements.
- Mark assumptions explicitly so they can be validated.

## Output

A structured implementation plan with phases, tasks, file paths, dependencies, risks, and testing strategy.
