---
description: Execute the writing plan by processing and writing all chapters defined in tasks.md
scripts:
  sh: scripts/bash/check-prerequisites.sh --json --require-tasks --include-tasks
  ps: scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
---

The user input can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

1. Run `{SCRIPT}` from repo root and parse FEATURE_DIR and AVAILABLE_DOCS list. All paths must be absolute.

2. Load and analyze the writing context:
   - **REQUIRED**: Read tasks.md for the complete chapter list and writing plan
   - **REQUIRED**: Read plan.md for story structure, themes, and manuscript organization
   - **TEMPLATES**: Use `/templates/character-template.md` for character development structure
   - **TEMPLATES**: Use `/templates/scene-template.md` for scene construction guidelines
   - **TEMPLATES**: Use `/templates/manuscript-template.md` for overall manuscript organization
   - **IF EXISTS**: Read character-profiles.md for character development and relationships
   - **IF EXISTS**: Read outlines/ for scene breakdowns and plot specifications
   - **IF EXISTS**: Read research.md for world-building notes and reference materials
   - **IF EXISTS**: Read style-guide.md for voice, tone, and formatting requirements

3. Parse tasks.md structure and extract:
   - **Writing phases**: Setup, Drafts, Scenes, Revision, Polish
   - **Chapter dependencies**: Sequential vs parallel writing rules
   - **Chapter details**: ID, description, scene locations, parallel markers [P]
   - **Writing flow**: Order and dependency requirements

4. Execute writing following the chapter plan:
   - **Phase-by-phase writing**: Complete each phase before moving to the next
   - **Respect dependencies**: Write sequential chapters in order, parallel chapters [P] can be written together
   - **Follow outline-driven approach**: Execute scene tasks based on detailed outlines
   - **Character-based coordination**: Chapters affecting the same character arcs must maintain consistency
   - **Draft checkpoints**: Review each phase completion before proceeding

5. Writing execution rules:
   - **Setup first**: Initialize manuscript structure, character sheets, world-building foundation
   - **Outlines before prose**: If you need to develop scene outlines for chapters and key moments
   - **Core writing**: Draft chapters, develop character arcs, execute major plot points
   - **Scene integration**: Connect chapters, maintain pacing, develop subplots
   - **Revision and polish**: Style consistency, voice refinement, final manuscript preparation

6. Progress tracking and quality control:
   - Report progress after each completed chapter
   - Halt writing if any non-parallel chapter creates plot inconsistencies
   - For parallel chapters [P], continue with successful drafts, report problematic ones
   - Provide clear feedback with context for revision needs
   - Suggest next steps if writing cannot proceed due to plot or character issues
   - **IMPORTANT** For completed chapters, make sure to mark the task off as [X] in the tasks file.

7. Completion validation:
   - Verify all required chapters are completed
   - Check that written content matches the original story outline
   - Validate that character arcs are consistent and compelling throughout
   - Confirm the manuscript follows the established style guide and voice
   - Report final status with summary of completed writing and word count

Note: This command assumes a complete chapter breakdown exists in tasks.md. If chapters are incomplete or missing, suggest running `/tasks` first to regenerate the chapter list.