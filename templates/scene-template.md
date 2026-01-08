# Scene Template: [SCENE TITLE/DESCRIPTION]

**Novel**: [NOVEL TITLE]
**Branch**: `[###-novel-name]`
**Created**: [DATE]
**Chapter**: [Chapter Number/Name]
**Scene Position**: [Opening/Middle/Climax/Resolution/etc.]
**Status**: Draft

## Execution Flow (main)
```
1. Parse scene concept from Input
   → If empty: ERROR "No scene concept provided"
2. Extract key scene elements from concept
   → Identify: purpose, characters, setting, conflict, outcome
3. For each unclear aspect:
   → Mark with [NEEDS DEVELOPMENT: specific question]
4. Fill Scene Foundation section
   → If no clear scene goal: ERROR "Cannot determine scene purpose"
5. Generate Scene Requirements
   → Each element must advance story/character arc
   → Mark ambiguous scene elements
6. Define character objectives and obstacles
7. Run Review Checklist
   → If any [NEEDS DEVELOPMENT]: WARN "Scene has unclear elements"
8. Return: SUCCESS (scene ready for writing)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHY this scene needs to exist and WHAT it accomplishes
- ❌ Avoid detailed dialogue or prose (save that for actual writing)
- 📝 Written for story structure, focusing on narrative function

### Section Requirements
- **Mandatory sections**: Must be completed for every scene
- **Optional sections**: Include only when relevant to this specific scene
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this scene plan from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS DEVELOPMENT: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something crucial, mark it
3. **Think like a reader**: Every vague element should fail the "clear purpose" checklist item
4. **Common underspecified areas**:
   - Scene's specific goal or purpose
   - Character motivations within the scene
   - Conflict or tension source
   - How scene advances overall plot
   - Emotional arc within the scene
   - Transition to/from surrounding scenes

---

## Scene Foundation *(mandatory)*

### Core Purpose
- **Scene Goal**: [What this scene must accomplish for the story]
- **Character Arc**: [How protagonist/main character changes in this scene]
- **Plot Advancement**: [How this scene moves the overall story forward]
- **Information Revealed**: [Key facts, secrets, or realizations that emerge]

### Setting & Context
- **Location**: [Where this scene takes place]
- **Time**: [When - time of day, season, relative to other events]
- **Atmosphere**: [Mood/tone this scene should convey]
- **Environmental Factors**: [Weather, lighting, sounds that affect the scene]

### Character Dynamics
- **POV Character**: [Through whose perspective we experience the scene]
- **Present Characters**: [Who appears in this scene and why]
- **Character States**: [Emotional/physical condition of key characters at scene start]
- **Character Goals**: [What each major character wants in this scene]

## Scene Structure *(mandatory)*

### Opening
- **Entry Hook**: [How the scene begins - action, dialogue, description]
- **Initial Situation**: [Characters' circumstances at scene start]
- **Established Stakes**: [What characters have to gain/lose in this scene]

### Development
- **Central Conflict**: [Main tension or problem driving this scene]
- **Escalation**: [How tension increases throughout the scene]
- **Obstacles**: [What prevents characters from easily achieving their goals]
- **Revelations**: [Information discovered or shared during scene]

### Resolution
- **Climactic Moment**: [The peak moment of tension/emotion/action]
- **Outcome**: [How the scene conflict resolves (not necessarily how characters want)]
- **Character Impact**: [How characters are changed by scene events]
- **Transition Setup**: [How this scene leads into the next]

## Scene Requirements *(mandatory)*

### Narrative Requirements
- **SR-001**: Scene MUST [story function, e.g., "reveal antagonist's true motivation"]
- **SR-002**: Scene MUST [character development, e.g., "show protagonist's growing confidence"]
- **SR-003**: Scene MUST [plot advancement, e.g., "eliminate escape route option"]
- **SR-004**: Scene MUST [emotional goal, e.g., "establish romantic tension between leads"]
- **SR-005**: Scene MUST [world-building, e.g., "demonstrate magic system limitations"]

### Conflict Requirements
- **SR-006**: Scene MUST contain [conflict type, e.g., "internal struggle between duty and desire"]
- **SR-007**: Scene MUST escalate [tension source, e.g., "time pressure toward deadline"]
- **SR-008**: Scene MUST resolve [immediate problem, e.g., "current survival threat"]

*Example of marking unclear requirements:*
- **SR-009**: Scene MUST [NEEDS DEVELOPMENT: character relationship unclear - alliance or betrayal?]

## Character Objectives *(include for major characters)*

### [Character Name] - POV Character
- **Wants in Scene**: [Immediate, conscious goal]
- **Needs in Scene**: [Deeper requirement for growth/story]
- **Obstacle**: [What prevents them from getting what they want]
- **Strategy**: [How they try to achieve their goal]
- **Arc Moment**: [How they change/grow during this scene]

### [Character Name] - Supporting Character
- **Function**: [Why they're in this scene]
- **Goal**: [What they want from this interaction]
- **Conflict Source**: [How they create/represent tension]
- **Revelation**: [What they discover or reveal]

## Tension & Conflict *(mandatory)*

### Primary Tension
- **Type**: [External/Internal/Interpersonal/Societal]
- **Source**: [What creates the conflict]
- **Stakes**: [What happens if tension isn't resolved]
- **Escalation Pattern**: [How tension builds throughout scene]

### Secondary Tensions *(include if present)*
- **Subtext**: [Unspoken conflicts beneath surface dialogue/action]
- **Time Pressure**: [Deadline or urgency factor]
- **Moral Dilemma**: [Ethical choice characters must make]
- **Resource Scarcity**: [Limited options creating pressure]

## Scene Transitions *(mandatory)*

### Connection to Previous Scene
- **How Scene Opens**: [Immediate aftermath, time jump, location shift, etc.]
- **Carried Forward**: [Unresolved issues or emotional states from previous scene]
- **Contrast**: [How this scene's mood/pace differs from the last]

### Setup for Next Scene
- **Cliffhanger/Hook**: [Question or tension that pulls reader forward]
- **New Information**: [Facts that will affect subsequent events]
- **Character State**: [How characters leave this scene emotionally/physically]
- **Plot Thread**: [Story element that needs addressing next]

## Sensory & Atmosphere *(optional - include if distinctive)*

### Physical Environment
- **Visual Elements**: [Key sights that set the scene]
- **Sounds**: [Audio elements that enhance mood]
- **Physical Sensations**: [Temperature, textures, physical comfort/discomfort]
- **Symbolic Elements**: [Objects or settings that reinforce theme]

### Emotional Atmosphere
- **Mood**: [Overall feeling the scene should evoke]
- **Pacing**: [Fast/slow, urgent/leisurely rhythm]
- **Energy Level**: [High action/quiet contemplation/building tension]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Scene Clarity
- [ ] Scene has clear, specific purpose
- [ ] All characters have believable motivations
- [ ] Conflict creates appropriate tension
- [ ] Outcome advances story meaningfully
- [ ] All mandatory sections completed

### Scene Completeness
- [ ] No [NEEDS DEVELOPMENT] markers remain
- [ ] Scene connects logically to surrounding scenes
- [ ] Character arcs show progression
- [ ] Conflict resolves in a satisfying way (even if not how characters wanted)
- [ ] Information revealed serves story needs
- [ ] Pacing appropriate for scene's story position

---

## Development Notes *(auto-generated during development)*

### Session [DATE]
*Development questions and answers will be recorded here*

---

## Execution Status
*Updated by main() during processing*

- [ ] Scene concept parsed
- [ ] Key scene elements extracted
- [ ] Ambiguities marked
- [ ] Scene foundation defined
- [ ] Scene structure outlined
- [ ] Requirements generated
- [ ] Character objectives defined
- [ ] Tension/conflict identified
- [ ] Transitions planned
- [ ] Review checklist passed

---