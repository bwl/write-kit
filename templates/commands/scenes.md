---
description: Generate an actionable, dependency-ordered scenes.md for the novel chapter based on available story design artifacts.
scripts:
  sh: scripts/bash/check-prerequisites.sh --json
  ps: scripts/powershell/check-prerequisites.ps1 -Json
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

1. Run `{SCRIPT}` from repo root and parse CHAPTER_DIR and AVAILABLE_DOCS list. All paths must be absolute.
2. Load and analyze available story design documents:
   - Always read outline.md for story structure and themes
   - **TEMPLATES**: Use `/templates/scene-template.md` for scene structure guidelines
   - **TEMPLATES**: Use `/templates/character-template.md` for POV character development
   - **TEMPLATES**: Use `/templates/world-building-template.md` for setting consistency
   - IF EXISTS: Read character-profiles.md for POV characters and motivations
   - IF EXISTS: Read world-building/ for setting details and rules
   - IF EXISTS: Read plot-threads.md for narrative arcs and conflicts
   - IF EXISTS: Read pacing-guide.md for scene timing and beats

   Note: Not all projects have all documents. For example:
   - Short stories might not have world-building/
   - Character-driven stories might not need extensive plot-threads.md
   - Generate scenes based on what's available

3. Generate scenes following the template:
   - Use `/templates/scenes-template.md` as the base
   - Replace example scenes with actual scenes based on:
     * **Opening scenes**: Chapter setup, character introduction, setting
     * **Development scenes [P]**: One per plot thread, one per character arc beat
     * **Core scenes**: One per major conflict, revelation, or turning point
     * **Transition scenes**: POV shifts, location changes, time jumps
     * **Climax scenes [P]**: Resolution beats, character growth, chapter conclusion

4. Scene generation rules:
   - Each character profile → character introduction scene marked [P]
   - Each plot thread in outline → development scene marked [P]
   - Each major conflict → climactic scene (not parallel if same POV character)
   - Each story beat → scene beat (not parallel if sequential narrative)
   - Different POV characters = can be parallel [P]
   - Same POV character = sequential (no [P])

5. Order scenes by narrative dependencies:
   - Opening before everything
   - Character setup before development
   - Plot setup before complications
   - Development before climax
   - Core scenes before transitions
   - Everything before chapter conclusion

6. Include parallel writing examples:
   - Group [P] scenes that can be written together
   - Show actual Scene agent commands

7. Create CHAPTER_DIR/scenes.md with:
   - Correct chapter name from story outline
   - Numbered scenes (S001, S002, etc.)
   - Clear POV character for each scene
   - Pacing and conflict notes
   - Parallel writing guidance

Context for scene generation: {ARGS}

The scenes.md should be immediately executable - each scene must be specific enough that a writer can draft it without additional narrative context.