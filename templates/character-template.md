# Character Profile: [CHARACTER NAME]

**Novel**: [NOVEL TITLE]
**Branch**: `[###-novel-name]`
**Created**: [DATE]
**Character Type**: [Protagonist/Antagonist/Supporting/Minor]
**Status**: Draft

## Execution Flow (main)
```
1. Parse character concept from Input
   → If empty: ERROR "No character concept provided"
2. Extract key character elements from concept
   → Identify: role, goals, flaws, relationships, backstory
3. For each unclear aspect:
   → Mark with [NEEDS DEVELOPMENT: specific question]
4. Fill Character Foundation section
   → If no clear character arc: WARN "Character lacks growth journey"
5. Generate Character Requirements
   → Each element must serve narrative purpose
   → Mark ambiguous character points
6. Define relationships and dependencies
7. Run Review Checklist
   → If any [NEEDS DEVELOPMENT]: WARN "Character has uncertainties"
8. Return: SUCCESS (character ready for story integration)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHO this character is and WHY they matter to the story
- ❌ Avoid physical descriptions unless story-relevant
- 📖 Written for narrative development, focusing on character's story function

### Section Requirements
- **Mandatory sections**: Must be completed for every character
- **Optional sections**: Include only when relevant to the character's role
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this character profile from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS DEVELOPMENT: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something crucial, mark it
3. **Think like a reader**: Every vague element should fail the "compelling and clear" checklist item
4. **Common underspecified areas**:
   - Character motivations and internal conflicts
   - Relationship dynamics with other characters
   - Character flaws and how they create problems
   - Backstory elements that affect current actions
   - Character arc and growth trajectory
   - Role in advancing the main plot

---

## Character Foundation *(mandatory)*

### Core Identity
- **Full Name**: [Character's complete name]
- **Age**: [Relevant age or age range]
- **Role in Story**: [Protagonist/Antagonist/Love Interest/Mentor/etc.]
- **Core Essence**: [Who they are in one sentence]

### Character Psychology
- **Driving Want**: [External goal they're pursuing]
- **Deeper Need**: [Internal growth/change required for fulfillment]
- **Fatal Flaw**: [Character weakness that creates problems/conflict]
- **Greatest Fear**: [What they're most afraid of losing/facing]
- **Core Belief**: [Fundamental assumption about life/world that may be wrong]

### Background & Motivation
- **Origin**: [Where they came from, formative experiences]
- **Current Situation**: [Their life circumstances at story start]
- **Motivation Source**: [Why they want what they want]
- **Obstacles**: [Internal and external barriers to their goals]

## Character Arc *(mandatory)*

### Starting Point
- **Initial State**: [Character's emotional/psychological state at story beginning]
- **Initial Beliefs**: [What they believe about themselves/world at start]
- **Initial Capabilities**: [Skills, knowledge, resources they start with]

### Growth Journey
- **Arc Type**: [Change/Growth/Steadfast/Fall - select one]
- **Key Lessons**: [What they need to learn]
- **Turning Points**: [Major moments that force character growth]
- **Final State**: [How they'll be different by story's end]

### Character Requirements
- **CR-001**: Character MUST [specific trait, e.g., "demonstrate courage despite cowardice"]
- **CR-002**: Character MUST [relationship dynamic, e.g., "clash with protagonist over trust"]
- **CR-003**: Character MUST [plot function, e.g., "provide crucial information at midpoint"]
- **CR-004**: Character MUST [growth element, e.g., "overcome fear of vulnerability"]
- **CR-005**: Character MUST [story resolution role, e.g., "choose loyalty over self-interest"]

*Example of marking unclear requirements:*
- **CR-006**: Character MUST [NEEDS DEVELOPMENT: redemption arc unclear - redeemable or irredeemable?]

## Relationships & Dynamics *(include if interacts with other characters)*

### Primary Relationships
- **[Other Character Name]**:
  - *Relationship Type*: [Friend/Enemy/Love Interest/Mentor/etc.]
  - *Dynamic*: [How they interact, what tension exists]
  - *Story Function*: [How this relationship serves the plot]
  - *Evolution*: [How relationship changes throughout story]

### Relationship Patterns
- **Trust Issues**: [How they handle trust with others]
- **Communication Style**: [How they express themselves]
- **Conflict Approach**: [How they handle disagreements]
- **Intimacy Level**: [How close they allow others to get]

## Character Voice & Behavior *(optional - include if distinctive)*

### Dialogue Characteristics
- **Speech Patterns**: [Distinctive ways they speak]
- **Vocabulary**: [Formal/casual, educated/street-smart, etc.]
- **Topics**: [What they talk about, avoid talking about]

### Behavioral Traits
- **Habits**: [Recurring behaviors that show character]
- **Mannerisms**: [Physical or verbal tics]
- **Decision-Making**: [How they approach choices]
- **Stress Response**: [How they react under pressure]

## Character Secrets & Subtext *(optional - include if relevant)*

### Hidden Elements
- **Secret**: [What they're hiding from others]
- **Shame**: [What they're ashamed of]
- **Hidden Strength**: [Capability others don't know they have]
- **Hidden Vulnerability**: [Weakness they try to conceal]

### Subtext Layers
- **Says vs. Means**: [Gap between words and intentions]
- **Public vs. Private**: [How they differ in different settings]
- **Past Echoes**: [How past experiences influence current behavior]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Character Clarity
- [ ] Character serves clear narrative purpose
- [ ] Motivations are understandable and relatable
- [ ] Flaws create meaningful conflict
- [ ] Growth arc is compelling and clear
- [ ] All mandatory sections completed

### Character Completeness
- [ ] No [NEEDS DEVELOPMENT] markers remain
- [ ] Character feels three-dimensional
- [ ] Relationships serve story function
- [ ] Arc connects to main plot
- [ ] Voice/behavior is distinctive if needed
- [ ] Character avoids stereotypes and clichés

---

## Development Notes *(auto-generated during development)*

### Session [DATE]
*Development questions and answers will be recorded here*

---

## Execution Status
*Updated by main() during processing*

- [ ] Character concept parsed
- [ ] Key character elements extracted
- [ ] Ambiguities marked
- [ ] Character foundation defined
- [ ] Character arc outlined
- [ ] Requirements generated
- [ ] Relationships defined
- [ ] Review checklist passed

---