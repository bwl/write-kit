---
description: Perform a non-destructive cross-artifact narrative consistency and quality review across spec.md, plan.md, and tasks.md after task generation.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

Goal: Identify narrative inconsistencies, plot holes, character arc gaps, and thematic weaknesses across the three core artifacts (`spec.md`, `plan.md`, `tasks.md`) before implementation. This command MUST run only after `/tasks` has successfully produced a complete `tasks.md`.

STRICTLY READ-ONLY: Do **not** modify any files. Output a structured narrative analysis report. Offer an optional remediation plan (user must explicitly approve before any follow-up editing commands would be invoked manually).

Constitution Authority: The project constitution (`/memory/constitution.md`) is **non-negotiable** within this review scope. Constitution conflicts are automatically CRITICAL and require adjustment of the spec, plan, or tasks—not dilution, reinterpretation, or silent ignoring of the principle. If a principle itself needs to change, that must occur in a separate, explicit constitution update outside `/review`.

Execution steps:

1. Run `{SCRIPT}` once from repo root and parse JSON for FEATURE_DIR and AVAILABLE_DOCS. Derive absolute paths:
   - SPEC = FEATURE_DIR/spec.md
   - PLAN = FEATURE_DIR/plan.md
   - TASKS = FEATURE_DIR/tasks.md
   Abort with an error message if any required file is missing (instruct the user to run missing prerequisite command).

2. Load artifacts:
   - Parse spec.md sections: Story Overview/Context, Character Requirements, Plot Requirements, Theme Requirements, Scene Descriptions, Edge Cases (if present).
   - Parse plan.md: Narrative structure/arc choices, Character Development references, Story Phases, Thematic constraints.
   - Parse tasks.md: Task IDs, descriptions, phase grouping, parallel markers [P], referenced scenes/chapters.
   - Load constitution `/memory/constitution.md` for principle validation.

3. Build internal narrative models:
   - Story elements inventory: Each character arc + plot requirement + theme with a stable key (derive slug based on narrative element; e.g., "Protagonist overcomes fear" -> `protagonist-overcomes-fear`).
   - Character journey/arc inventory.
   - Task coverage mapping: Map each task to one or more story elements or character arcs (inference by keyword / explicit reference patterns like IDs or key phrases).
   - Constitution rule set: Extract principle names and any MUST/SHOULD normative statements.

4. Detection passes:
   A. Narrative duplication detection:
      - Identify near-duplicate character arcs or plot points. Mark redundant elements for consolidation.
   B. Story ambiguity detection:
      - Flag vague character motivations lacking clear emotional drivers.
      - Flag unresolved story placeholders (TODO, TKTK, ???, <placeholder>, etc.).
   C. Narrative underspecification:
      - Character arcs with motivation but missing resolution or growth outcome.
      - Plot points missing dramatic tension or stakes.
      - Tasks referencing scenes or chapters not defined in spec/plan.
   D. Constitution alignment:
      - Any story element or plan conflicting with a MUST principle.
      - Missing mandated narrative sections or quality gates from constitution.
   E. Coverage gaps:
      - Story elements with zero associated tasks.
      - Tasks with no mapped story element/character arc.
      - Thematic requirements not reflected in tasks (e.g., character growth, symbolic elements).
   F. Story inconsistency:
      - Character trait drift (same character behaving differently without justification across scenes).
      - Plot elements referenced in plan but absent in spec (or vice versa).
      - Task ordering contradictions (e.g., character resolution tasks before character development tasks without dependency note).
      - Conflicting story elements (e.g., one requires character to be brave while other shows them as cowardly without arc explanation).

5. Severity assignment heuristic:
   - CRITICAL: Violates constitution MUST, missing core story artifact, or character arc with zero coverage that blocks narrative coherence.
   - HIGH: Duplicate or conflicting character motivation, ambiguous thematic element, unresolved plot thread.
   - MEDIUM: Character trait drift, missing thematic task coverage, underspecified scene transition.
   - LOW: Style/tone improvements, minor redundancy not affecting story flow.

6. Produce a Markdown report (no file writes) with sections:

   ### Story Consistency Review Report
   | ID | Category | Severity | Location(s) | Summary | Recommendation |
   |----|----------|----------|-------------|---------|----------------|
   | A1 | Plot Duplication | HIGH | spec.md:L120-134 | Two similar plot points ... | Merge events; keep more dramatic version |
   (Add one row per finding; generate stable IDs prefixed by category initial.)

   Additional subsections:
   - Story Coverage Summary Table:
     | Story Element Key | Has Task? | Task IDs | Notes |
   - Constitution Alignment Issues (if any)
   - Unmapped Tasks (if any)
   - Narrative Metrics:
     * Total Story Elements
     * Total Tasks
     * Coverage % (story elements with >=1 task)
     * Plot Hole Count
     * Character Arc Gap Count
     * Critical Issues Count

7. At end of report, output a concise Next Actions block:
   - If CRITICAL issues exist: Recommend resolving before `/implement`.
   - If only LOW/MEDIUM: User may proceed, but provide narrative improvement suggestions.
   - Provide explicit command suggestions: e.g., "Run /specify with character refinement", "Run /plan to adjust story structure", "Manually edit tasks.md to add coverage for 'protagonist-character-growth'".

8. Ask the user: "Would you like me to suggest concrete remediation edits for the top N narrative issues?" (Do NOT apply them automatically.)

Behavior rules:
- NEVER modify files.
- NEVER hallucinate missing story sections—if absent, report them.
- KEEP findings deterministic: if rerun without changes, produce consistent IDs and counts.
- LIMIT total findings in the main table to 50; aggregate remainder in a summarized overflow note.
- If zero issues found, emit a success report with coverage statistics and proceed recommendation.

Context: {ARGS}