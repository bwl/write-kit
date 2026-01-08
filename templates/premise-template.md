# Novel Premise: [NOVEL TITLE]

**Branch**: `[###-novel-name]`
**Created**: [DATE]
**Status**: Draft
**Input**: Story concept: "$ARGUMENTS"

## Execution Flow (main)
```
1. Parse story concept from Input
   → If empty: ERROR "No story concept provided"
2. Extract key story elements from concept
   → Identify: protagonist, antagonist, conflict, setting, themes
3. For each unclear aspect:
   → Mark with [NEEDS DEVELOPMENT: specific question]
4. Fill Story Foundation & Core Elements section
   → If no clear protagonist journey: ERROR "Cannot determine main character arc"
5. Generate Story Requirements
   → Each element must contribute to narrative arc
   → Mark ambiguous story points
6. Identify Key Characters and Setting (if specified)
7. Run Review Checklist
   → If any [NEEDS DEVELOPMENT]: WARN "Premise has uncertainties"
   → If technical details found: ERROR "Remove non-story elements"
8. Return: SUCCESS (premise ready for development)
```

---

## ⚡ Quick Guidelines
- ✅ Focus on WHO the story is about and WHAT they want
- ❌ Avoid HOW to write it (no prose style, POV, or structure decisions yet)
- 📖 Written for creative development, focusing on story essence

### Section Requirements
- **Mandatory sections**: Must be completed for every novel
- **Optional sections**: Include only when relevant to the story
- When a section doesn't apply, remove it entirely (don't leave as "N/A")

### For AI Generation
When creating this premise from a user prompt:
1. **Mark all ambiguities**: Use [NEEDS DEVELOPMENT: specific question] for any assumption you'd need to make
2. **Don't guess**: If the prompt doesn't specify something (e.g., "romance story" without character details), mark it
3. **Think like a reader**: Every vague element should fail the "compelling and clear" checklist item
4. **Common underspecified areas**:
   - Character motivations and flaws
   - Central conflict specifics
   - Setting time period and scope
   - Stakes and consequences
   - Genre conventions and expectations
   - Target audience age/demographic

---

## Story Foundation & Core Elements *(mandatory)*

### Protagonist
- **Name**: [Character name or placeholder]
- **Core Identity**: [Who they are in one sentence]
- **Want**: [External goal they're pursuing]
- **Need**: [Internal growth/change required]
- **Fatal Flaw**: [Character weakness that creates problems]

### Central Conflict
**External**: [The main plot problem/challenge]
**Internal**: [The emotional/psychological struggle]
**Stakes**: [What happens if protagonist fails]

### Setting
- **Time**: [When the story takes place]
- **Place**: [Where the story unfolds]
- **World**: [Key aspects of the story world that matter]

## Story Requirements *(mandatory)*

### Narrative Elements
- **NE-001**: Story MUST feature [specific protagonist journey, e.g., "a reluctant hero discovering their courage"]
- **NE-002**: Plot MUST include [key conflict, e.g., "a mystery that threatens the protagonist's family"]
- **NE-003**: Character MUST experience [growth arc, e.g., "learning to trust others after betrayal"]
- **NE-004**: Setting MUST provide [story function, e.g., "isolated location that forces character confrontation"]
- **NE-005**: Resolution MUST address [story question, e.g., "whether love conquers fear"]

*Example of marking unclear requirements:*
- **NE-006**: Antagonist MUST be [NEEDS DEVELOPMENT: villain type not specified - human, supernatural, internal?]
- **NE-007**: Romance subplot MUST [NEEDS DEVELOPMENT: relationship importance unclear - central or secondary?]

### Key Characters *(include if mentioned in concept)*
- **[Protagonist]**: [Role in story, key traits, relationship to conflict]
- **[Antagonist]**: [Opposition they represent, motivation, connection to hero]
- **[Supporting Character]**: [Function in story, relationship to protagonist]

### Themes *(optional - include if clear from concept)*
- **Primary Theme**: [Main message or question the story explores]
- **Secondary Themes**: [Additional ideas woven through the narrative]

---

## Review & Acceptance Checklist
*GATE: Automated checks run during main() execution*

### Story Clarity
- [ ] No writing craft details (POV, structure, prose style)
- [ ] Focused on story essence and character journey
- [ ] Written for creative development purposes
- [ ] All mandatory sections completed

### Premise Completeness
- [ ] No [NEEDS DEVELOPMENT] markers remain
- [ ] Story elements are compelling and clear
- [ ] Character motivations are understandable
- [ ] Conflict has clear stakes
- [ ] Setting supports the story
- [ ] Genre expectations addressed

---

## Execution Status
*Updated by main() during processing*

- [ ] Story concept parsed
- [ ] Key story elements extracted
- [ ] Ambiguities marked
- [ ] Story foundation defined
- [ ] Requirements generated
- [ ] Characters and setting identified
- [ ] Review checklist passed

---