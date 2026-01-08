# Scenes: [CHAPTER NAME]

**Input**: Story design documents from `/stories/[###-chapter-name]/`
**Prerequisites**: outline.md (required), character-profiles.md, world-building/, plot-threads.md

## Execution Flow (main)
```
1. Load outline.md from chapter directory
   → If not found: ERROR "No story outline found"
   → Extract: themes, structure, pacing goals
2. Load optional design documents:
   → character-profiles.md: Extract POV characters → introduction scenes
   → world-building/: Each location → setting establishment scene
   → plot-threads.md: Extract conflicts → development scenes
3. Generate scenes by category:
   → Opening: chapter setup, character introduction, setting
   → Development: plot advancement, character arcs, conflicts
   → Core: climactic moments, revelations, turning points
   → Transition: POV shifts, location changes, time jumps
   → Conclusion: resolution beats, character growth, chapter end
4. Apply scene rules:
   → Different POV characters = mark [P] for parallel
   → Same POV character = sequential (no [P])
   → Setup before development (narrative flow)
5. Number scenes sequentially (S001, S002...)
6. Generate dependency graph
7. Create parallel writing examples
8. Validate scene completeness:
   → All plot threads have development?
   → All characters have meaningful arcs?
   → All conflicts have resolution beats?
9. Return: SUCCESS (scenes ready for writing)
```

## Format: `[ID] [P?] Description`
- **[P]**: Can write in parallel (different POV characters, independent storylines)
- Include exact POV character and conflict focus in descriptions

## Structure Conventions
- **Single POV**: All scenes sequential from one perspective
- **Multi-POV**: `pov-alice/`, `pov-bob/` scene directories
- **Anthology**: `story-a/`, `story-b/` separate storylines
- Paths shown below assume single POV - adjust based on outline.md structure

## Phase 3.1: Opening
- [ ] S001 Establish setting and mood in opening scene
- [ ] S002 Introduce POV character with compelling hook
- [ ] S003 [P] Set up primary conflict or mystery

## Phase 3.2: Character Development ⚠️ MUST COMPLETE BEFORE 3.3
**CRITICAL: These character beats MUST be established before major conflicts**
- [ ] S004 [P] Alice's internal conflict revealed in introspective scene
- [ ] S005 [P] Bob's backstory motivation shown through dialogue
- [ ] S006 [P] Character relationships established in interaction scene
- [ ] S007 [P] Stakes clarified through character decision point

## Phase 3.3: Plot Development (ONLY after character setup)
- [ ] S008 [P] First plot complication from Alice's POV
- [ ] S009 [P] Parallel subplot advancement from Bob's POV
- [ ] S010 [P] World-building detail that impacts plot
- [ ] S011 Rising action scene with escalating conflict
- [ ] S012 Midpoint revelation or plot twist
- [ ] S013 Character forced into difficult choice
- [ ] S014 Consequences of choice create new obstacles

## Phase 3.4: Climactic Moments
- [ ] S015 Confrontation scene with primary antagonist
- [ ] S016 Character growth moment under pressure
- [ ] S017 Resolution of central conflict
- [ ] S018 Emotional payoff for character arc

## Phase 3.5: Chapter Conclusion
- [ ] S019 [P] Wrap up immediate plot threads
- [ ] S020 Plant seeds for next chapter's conflicts
- [ ] S021 [P] Character reflection on growth/change
- [ ] S022 Strong chapter-ending hook or transition
- [ ] S023 Review chapter pacing and flow

## Dependencies
- Character setup (S004-S007) before plot development (S008-S014)
- S008 blocks S011, S015
- S016 blocks S018
- Plot development before conclusion (S019-S023)

## Parallel Example
```
# Launch S004-S007 together (different character POVs):
Scene: "Alice's internal conflict revealed in introspective scene"
Scene: "Bob's backstory motivation shown through dialogue"
Scene: "Character relationships established in interaction scene"
Scene: "Stakes clarified through character decision point"
```

## Notes
- [P] scenes = different POV characters, no narrative dependencies
- Maintain consistent character voice throughout
- Track emotional arc progression
- Avoid: vague character motivations, same POV conflicts

## Scene Generation Rules
*Applied during main() execution*

1. **From Character Profiles**:
   - Each POV character → introduction scene [P]
   - Each character arc → development scene

2. **From Plot Threads**:
   - Each conflict → escalation scene [P]
   - Interweaving threads → transition scenes

3. **From Story Beats**:
   - Each beat → corresponding scene [P]
   - Pacing requirements → scene length guidance

4. **Ordering**:
   - Opening → Character Setup → Plot Development → Climax → Conclusion
   - Character dependencies block parallel writing

## Validation Checklist
*GATE: Checked by main() before returning*

- [ ] All plot threads have corresponding scenes
- [ ] All characters have meaningful arc progression
- [ ] All setup comes before payoff
- [ ] Parallel scenes truly independent (different POVs)
- [ ] Each scene specifies POV character and conflict focus
- [ ] No scene conflicts with another [P] scene's narrative flow
- [ ] Chapter maintains consistent pacing and tone
- [ ] Proper transitions between scenes and POV shifts