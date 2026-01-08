# World-Building Guide: [WORLD/SETTING NAME]

**Novel**: [NOVEL TITLE]
**Branch**: `[###-novel-name]`
**Created**: [DATE]
**Setting Type**: [Contemporary/Historical/Fantasy/Sci-Fi/etc.]
**Status**: Draft

## Execution Flow (main)
```
1. Parse world concept from Input
   → If empty: ERROR "No world concept provided"
2. Extract key world elements from concept
   → Identify: setting, time period, rules, systems, cultures
3. For each unclear aspect:
   → Mark with [NEEDS DEVELOPMENT: specific question]
4. Fill World Foundation section
   → If no clear world rules: WARN "World lacks consistent logic"
5. Generate World Requirements
   → Each element must serve story function
   → Mark ambiguous world elements
6. Define systems and their interactions
7. Run Review Checklist
   → If any [NEEDS DEVELOPMENT]: WARN "World has inconsistencies"
8. Return: SUCCESS (world ready for story integration)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on elements that impact the STORY and CHARACTERS
- ❌ Avoid extensive detail that doesn't serve the narrative
- 🌍 Written for story consistency, focusing on plot-relevant elements

### Section Requirements
- **Mandatory sections**: Must be completed for every story world
- **Optional sections**: Include only when relevant to your specific story
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this world guide from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS DEVELOPMENT: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something crucial, mark it
3. **Think like a reader**: Every vague element should fail the "consistent and clear" checklist item
4. **Common underspecified areas**:
   - Rules governing magic/technology systems
   - Social structures and power dynamics
   - Economic systems and resources
   - Historical events that shape current world
   - Cultural values and conflicts
   - Geographic constraints that affect plot

---

## World Foundation *(mandatory)*

### Physical Setting
- **Time Period**: [When the story takes place]
- **Primary Location**: [Main setting where most action occurs]
- **Geographic Scope**: [How much of the world matters to the story]
- **Physical Constraints**: [Geography, climate, resources that affect plot]

### Core World Rules
- **Reality Type**: [Realistic/Magical/Futuristic/Alternate History]
- **Fundamental Laws**: [Basic rules that govern how this world works]
- **Limitations**: [What characters cannot do/achieve in this world]
- **Consequences**: [How breaking rules or failing costs characters]

### Historical Context
- **Relevant History**: [Past events that impact current story]
- **World State**: [Current condition - peaceful, war-torn, transitional, etc.]
- **Catalyst Events**: [Recent changes that created story opportunities]

## Systems & Structure *(include relevant systems only)*

### Social Organization
- **Power Structure**: [Who holds authority and how]
- **Class System**: [Social hierarchy if relevant to story]
- **Family Structure**: [How relationships/families work]
- **Gender Roles**: [If different from contemporary norms]

### Cultural Elements
- **Core Values**: [What this society prizes most]
- **Taboos**: [What's forbidden or shameful]
- **Traditions**: [Customs that affect character behavior]
- **Conflicts**: [Cultural tensions that create story opportunities]

### Economic System *(include if affects plot)*
- **Resources**: [What's valuable in this world]
- **Trade**: [How goods/services exchange hands]
- **Scarcity**: [What's rare and therefore creates conflict]
- **Wealth Distribution**: [Who has what and why it matters]

### Technology/Magic System *(include if present)*
- **Core Mechanism**: [How the system fundamentally works]
- **Capabilities**: [What it can accomplish]
- **Limitations**: [What it cannot do or costs to use]
- **Access**: [Who can use it and how they learn]
- **Impact**: [How it shapes society and daily life]

## World Requirements *(mandatory)*

### Environmental Requirements
- **WR-001**: World MUST [specific constraint, e.g., "limit travel between regions to create isolation"]
- **WR-002**: Setting MUST [story function, e.g., "provide sanctuary that can be threatened"]
- **WR-003**: Geography MUST [plot requirement, e.g., "force characters through dangerous territory"]

### System Requirements
- **WR-004**: [Magic/Tech] system MUST [capability, e.g., "allow healing but not resurrection"]
- **WR-005**: Social structure MUST [conflict source, e.g., "create class tension between characters"]
- **WR-006**: Cultural rules MUST [character constraint, e.g., "forbid protagonist's desired path"]

### Consistency Requirements
- **WR-007**: World logic MUST [consistency rule, e.g., "maintain established magic costs throughout"]
- **WR-008**: Historical events MUST [story relevance, e.g., "explain current political instability"]

*Example of marking unclear requirements:*
- **WR-009**: Magic system MUST [NEEDS DEVELOPMENT: power source unclear - innate ability, learned skill, external force?]

## Locations & Places *(include story-relevant locations)*

### Primary Locations
- **[Location Name]**:
  - *Description*: [What makes this place unique]
  - *Atmosphere*: [Mood/feeling this place evokes]
  - *Function*: [Role this location plays in the story]
  - *Challenges*: [Problems/obstacles this place presents]
  - *Opportunities*: [Advantages/resources characters find here]

### Location Relationships
- **Travel**: [How characters move between places, time/cost involved]
- **Communication**: [How information travels between locations]
- **Influence**: [Which places affect others and how]

## Cultural Details *(optional - include if story-relevant)*

### Language & Communication
- **Common Language**: [What characters speak]
- **Special Terms**: [Unique words/phrases that matter to story]
- **Communication Barriers**: [Language obstacles that create conflict]

### Beliefs & Religion *(include if affects character behavior)*
- **Dominant Beliefs**: [What most people believe]
- **Religious Structure**: [How organized religion works if present]
- **Spiritual Practices**: [Rituals/customs that impact characters]
- **Conflicts**: [Religious tensions that create story opportunities]

### Daily Life & Customs
- **Typical Day**: [How ordinary people live]
- **Social Rituals**: [Important ceremonies or gatherings]
- **Food/Shelter/Clothing**: [Basics of survival in this world]
- **Entertainment**: [How people spend leisure time]

## Threats & Conflicts *(mandatory)*

### External Threats
- **Natural Dangers**: [Environmental hazards characters face]
- **Political Tensions**: [Conflicts between groups/nations]
- **Systemic Problems**: [Ongoing issues that create obstacles]

### Internal Conflicts
- **Moral Dilemmas**: [Ethical conflicts the world creates]
- **Competing Loyalties**: [When world systems force difficult choices]
- **Identity Struggles**: [How world expectations conflict with character needs]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### World Clarity
- [ ] World rules are consistent and clear
- [ ] Systems serve story function rather than existing for their own sake
- [ ] Setting creates appropriate obstacles and opportunities
- [ ] Cultural elements feel authentic and integrated
- [ ] All mandatory sections completed

### World Completeness
- [ ] No [NEEDS DEVELOPMENT] markers remain
- [ ] World supports character goals and conflicts
- [ ] Systems have clear limitations to create tension
- [ ] Historical context explains current story situation
- [ ] Locations feel distinct and purposeful
- [ ] World avoids contradictions and plot holes

---

## Development Notes *(auto-generated during development)*

### Session [DATE]
*Development questions and answers will be recorded here*

---

## Execution Status
*Updated by main() during processing*

- [ ] World concept parsed
- [ ] Key world elements extracted
- [ ] Ambiguities marked
- [ ] World foundation defined
- [ ] Systems outlined
- [ ] Requirements generated
- [ ] Locations defined
- [ ] Threats identified
- [ ] Review checklist passed

---