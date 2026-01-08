---
description: "Story outline template for novel development"
scripts:
  sh: scripts/bash/update-agent-context.sh __AGENT__
  ps: scripts/powershell/update-agent-context.ps1 -AgentType __AGENT__
---

# Story Outline: [STORY_TITLE]

**Branch**: `[###-story-name]` | **Date**: [DATE] | **Spec**: [link]
**Input**: Story specification from `/specs/[###-story-name]/spec.md`

## Execution Flow (/outline command scope)
```
1. Load story spec from Input path
   → If not found: ERROR "No story spec at {path}"
2. Fill Genre Context (scan for NEEDS CLARIFICATION)
   → Detect Story Type from context (standalone=single book, series=multi-book)
   → Set Structure Decision based on story type
3. Fill the Constitution Check section based on the content of the constitution document.
4. Evaluate Constitution Check section below
   → If violations exist: Document in Complexity Tracking
   → If no justification possible: ERROR "Simplify approach first"
   → Update Progress Tracking: Initial Constitution Check
5. Execute Phase 0 → research.md
   → If NEEDS CLARIFICATION remain: ERROR "Resolve unknowns"
6. Execute Phase 1 → plot-structure, character-profiles.md, scene-breakdown.md, agent-specific template file (e.g., `CLAUDE.md` for Claude Code, `.github/copilot-instructions.md` for GitHub Copilot, `GEMINI.md` for Gemini CLI, `QWEN.md` for Qwen Code or `AGENTS.md` for opencode).
7. Re-evaluate Constitution Check section
   → If new violations: Refactor design, return to Phase 1
   → Update Progress Tracking: Post-Design Constitution Check
8. Plan Phase 2 → Describe chapter generation approach (DO NOT create chapter-summaries.md)
9. STOP - Ready for /chapters command
```

**IMPORTANT**: The /outline command STOPS at step 7. Phases 2-4 are executed by other commands:
- Phase 2: /chapters command creates chapter-summaries.md
- Phase 3-4: Writing execution (manual or via tools)

## Summary
[Extract from story spec: primary narrative + thematic approach from research]

## Genre Context
**Genre/Subgenre**: [e.g., Fantasy Romance, Sci-Fi Thriller, Historical Fiction or NEEDS CLARIFICATION]
**Target Audience**: [e.g., Adult, Young Adult, Middle Grade or NEEDS CLARIFICATION]
**Point of View**: [e.g., First Person, Third Limited, Multiple POV or NEEDS CLARIFICATION]
**Tense**: [e.g., Past, Present, Mixed or NEEDS CLARIFICATION]
**Setting Period**: [e.g., Contemporary, Medieval, Future 2150 or NEEDS CLARIFICATION]
**Story Type**: [standalone/series - determines structure approach]
**Word Count Goal**: [e.g., 80k words, 100k words, 120k words or NEEDS CLARIFICATION]
**Tone/Mood**: [e.g., Dark and gritty, Light and hopeful, Mysterious or NEEDS CLARIFICATION]
**Content Rating**: [e.g., Clean, Moderate violence, Adult themes or NEEDS CLARIFICATION]

## Constitution Check
*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

[Gates determined based on constitution file]

## Story Structure

### Documentation (this story)
```
specs/[###-story]/
├── outline.md            # This file (/outline command output)
├── research.md           # Phase 0 output (/outline command)
├── character-profiles.md # Phase 1 output (/outline command)
├── scene-breakdown.md    # Phase 1 output (/outline command)
├── plot-structure/       # Phase 1 output (/outline command)
└── chapter-summaries.md  # Phase 2 output (/chapters command - NOT created by /outline)
```

### Manuscript (repository root)
```
# Option 1: Single novel (DEFAULT)
manuscript/
├── chapters/
│   ├── chapter-01.md
│   ├── chapter-02.md
│   └── ...
├── characters/
│   ├── protagonists/
│   ├── antagonists/
│   └── supporting/
└── world-building/
    ├── locations/
    ├── magic-systems/
    └── cultures/

# Option 2: Series (when "book 1", "sequel", or "series" detected)
series/
├── book-01/
│   ├── chapters/
│   ├── characters/
│   └── world-building/
├── book-02/
│   └── [same structure]
└── shared/
    ├── timeline.md
    ├── world-bible.md
    └── character-arcs.md

# Option 3: Anthology/Collection (when "short stories" detected)
collection/
├── stories/
│   ├── story-01/
│   ├── story-02/
│   └── ...
└── shared/
    └── theme-notes.md
```

**Structure Decision**: [DEFAULT to Option 1 unless Genre Context indicates series/anthology]

## Phase 0: Research & Foundation
1. **Extract unknowns from Genre Context** above:
   - For each NEEDS CLARIFICATION → research task
   - For each genre convention → best practices task
   - For each world-building element → development task

2. **Generate and dispatch research agents**:
   ```
   For each unknown in Genre Context:
     Task: "Research {unknown} for {story context}"
   For each genre choice:
     Task: "Find conventions for {genre} in {target audience}"
   ```

3. **Consolidate findings** in `research.md` using format:
   - Decision: [what was chosen]
   - Rationale: [why chosen]
   - Alternatives considered: [what else evaluated]

**Output**: research.md with all NEEDS CLARIFICATION resolved

## Phase 1: Characters & Plot Structure
*Prerequisites: research.md complete*

1. **Extract characters from story spec** → `character-profiles.md`:
   - Character name, role, arc
   - Motivations, conflicts, relationships
   - Character growth patterns from premise

2. **Generate plot structure** from narrative requirements:
   - For each story beat → plot point
   - Use standard Three-Act/Hero's Journey patterns
   - Output detailed structure to `/plot-structure/`

3. **Generate scene breakdown** from plot structure:
   - One scene per story beat
   - Assert character actions and conflicts
   - Scenes must flow logically (story continuity)

4. **Extract chapter framework** from scene breakdown:
   - Each group of scenes → chapter
   - Chapter pacing = scene validation steps

5. **Update agent file incrementally** (O(1) operation):
   - Run `{SCRIPT}`
     **IMPORTANT**: Execute it exactly as specified above. Do not add or remove any arguments.
   - If exists: Add only NEW story elements from current outline
   - Preserve manual additions between markers
   - Update recent changes (keep last 3)
   - Keep under 150 lines for token efficiency
   - Output to repository root

**Output**: character-profiles.md, /plot-structure/*, scene flow, scene-breakdown.md, agent-specific file

## Phase 2: Chapter Planning Approach
*This section describes what the /chapters command will do - DO NOT execute during /outline*

**Chapter Generation Strategy**:
- Load `.specify/templates/chapters-template.md` as base
- Generate chapters from Phase 1 design docs (plot structure, character arcs, scene breakdown)
- Each plot point → chapter outline [P]
- Each character arc → character development tasks [P]
- Each scene → scene writing task
- Writing tasks to complete chapters

**24-Chapter Framework**:
```
Act I: Setup (Chapters 1-6)
  Ch 1-2: Hook & World Introduction
  Ch 3-4: Character Introduction & Inciting Incident
  Ch 5-6: Call to Adventure & First Plot Point

Act II-A: Rising Action (Chapters 7-12)
  Ch 7-8: New World & Allies
  Ch 9-10: First Obstacles & Character Growth
  Ch 11-12: Midpoint Crisis & Revelation

Act II-B: Complications (Chapters 13-18)
  Ch 13-14: New Strategy & Deeper Conflict
  Ch 15-16: Major Setbacks & Character Testing
  Ch 17-18: Dark Moment & All Hope Lost

Act III: Resolution (Chapters 19-24)
  Ch 19-20: Final Push & Climax Preparation
  Ch 21-22: Climax & Final Confrontation
  Ch 23-24: Resolution & New Normal
```

**Ordering Strategy**:
- Story order: Chapters follow narrative progression
- Character order: Character arcs before plot events before themes
- Mark [P] for parallel execution (independent scenes)

**Estimated Output**: 24 numbered, ordered chapter outlines in chapter-summaries.md

**IMPORTANT**: This phase is executed by the /chapters command, NOT by /outline

## Phase 3+: Future Writing
*These phases are beyond the scope of the /outline command*

**Phase 3**: Chapter execution (/chapters command creates chapter-summaries.md)
**Phase 4**: Writing (execute chapter-summaries.md following constitutional principles)
**Phase 5**: Revision (edit chapters, execute scene-breakdown.md, pacing validation)

## Complexity Tracking
*Fill ONLY if Constitution Check has violations that must be justified*

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| [e.g., 4th POV character] | [current story need] | [why 3 POVs insufficient] |
| [e.g., Complex magic system] | [specific plot problem] | [why simple magic insufficient] |


## Progress Tracking
*This checklist is updated during execution flow*

**Phase Status**:
- [ ] Phase 0: Research complete (/outline command)
- [ ] Phase 1: Design complete (/outline command)
- [ ] Phase 2: Chapter planning complete (/outline command - describe approach only)
- [ ] Phase 3: Chapters generated (/chapters command)
- [ ] Phase 4: Writing complete
- [ ] Phase 5: Revision passed

**Gate Status**:
- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [ ] All NEEDS CLARIFICATION resolved
- [ ] Complexity deviations documented

---
*Based on Constitution v2.1.1 - See `/memory/constitution.md`*