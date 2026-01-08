---
description: Develop underspecified areas in the current novel premise by asking up to 5 highly targeted development questions and encoding answers back into the premise.
scripts:
   sh: scripts/bash/check-prerequisites.sh --json --paths-only
   ps: scripts/powershell/check-prerequisites.ps1 -Json -PathsOnly
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

Goal: Detect and develop ambiguous or missing story elements in the active novel premise and record the developments directly in the premise file.

Note: This development workflow is expected to run (and be completed) BEFORE invoking `/outline`. If the user explicitly states they are skipping development (e.g., exploratory draft), you may proceed, but must warn that story consistency risk increases.

Execution steps:

1. Run `{SCRIPT}` from repo root **once** (combined `--json --paths-only` mode / `-Json -PathsOnly`). Parse minimal JSON payload fields:
   - `NOVEL_DIR`
   - `PREMISE_FILE`
   - (Optionally capture `OUTLINE_PLAN`, `SCENES` for future chained flows.)
   - If JSON parsing fails, abort and instruct user to re-run `/premise` or verify novel branch environment.

2. Load the current premise file. Perform a structured story development & coverage scan using this taxonomy. For each category, mark status: Clear / Partial / Missing. Produce an internal coverage map used for prioritization (do not output raw map unless no questions will be asked).

   Story Foundation & Character:
   - Core protagonist goals & character arc
   - Explicit story scope boundaries
   - Character roles / persona differentiation

   Setting & World-Building:
   - World rules, magic/tech systems, societies
   - Cultural and historical context
   - Environmental and location details
   - Scope of world complexity

   Plot Flow & Story Structure:
   - Critical story beats / sequences
   - Conflict escalation patterns
   - Pacing and tension considerations

   Genre & Style Elements:
   - Voice and narrative perspective
   - Genre conventions and expectations
   - Tone and mood consistency
   - Target audience and content appropriateness
   - Thematic depth and complexity
   - Publishing format considerations (if any)

   Character Relationships & Dependencies:
   - Supporting character connections and roles
   - Romance/friendship dynamics
   - Mentor/antagonist relationship patterns

   Conflict & Crisis Handling:
   - Subplot complications
   - Character failure responses
   - Plot twist and revelation management

   Creative Constraints & Choices:
   - Genre limitations and opportunities
   - Explicit creative choices or rejected alternatives

   World Terms & Consistency:
   - Character names and titles
   - World-specific terminology and rules

   Story Resolution Signals:
   - Character arc completion criteria
   - Plot thread resolution indicators

   Undeveloped Elements:
   - TODO markers / unresolved story decisions
   - Vague descriptions ("mysterious", "powerful") lacking specific details

   For each category with Partial or Missing status, add a candidate question opportunity unless:
   - Development would not materially change story structure or character development
   - Information is better deferred to outlining phase (note internally)

3. Generate (internally) a prioritized queue of candidate development questions (maximum 5). Do NOT output them all at once. Apply these constraints:
    - Maximum of 5 total questions across the whole session.
    - Each question must be answerable with EITHER:
       * A short multiple‑choice selection (2–5 distinct, mutually exclusive options), OR
       * A one-word / short‑phrase answer (explicitly constrain: "Answer in <=5 words").
   - Only include questions whose answers materially impact plot structure, character development, world-building, thematic resonance, story pacing, genre consistency, or narrative coherence.
   - Ensure category coverage balance: attempt to cover the highest impact unresolved categories first; avoid asking two low-impact questions when a single high-impact area (e.g., protagonist motivation) is unresolved.
   - Exclude questions already answered, trivial stylistic preferences, or outline-level execution details (unless blocking story coherence).
   - Favor developments that reduce story inconsistency risk or prevent misaligned character arcs.
   - If more than 5 categories remain unresolved, select the top 5 by (Story Impact * Character Uncertainty) heuristic.

4. Sequential questioning loop (interactive):
    - Present EXACTLY ONE question at a time.
    - For multiple‑choice questions render options as a Markdown table:

       | Option | Description |
       |--------|-------------|
       | A | <Option A description> |
       | B | <Option B description> |
       | C | <Option C description> | (add D/E as needed up to 5)
       | Short | Provide a different short answer (<=5 words) | (Include only if free-form alternative is appropriate)

    - For short‑answer style (no meaningful discrete options), output a single line after the question: `Format: Short answer (<=5 words)`.
    - After the user answers:
       * Validate the answer maps to one option or fits the <=5 word constraint.
       * If ambiguous, ask for a quick disambiguation (count still belongs to same question; do not advance).
       * Once satisfactory, record it in working memory (do not yet write to disk) and move to the next queued question.
    - Stop asking further questions when:
       * All critical ambiguities resolved early (remaining queued items become unnecessary), OR
       * User signals completion ("done", "good", "no more"), OR
       * You reach 5 asked questions.
    - Never reveal future queued questions in advance.
    - If no valid questions exist at start, immediately report no critical ambiguities.

5. Integration after EACH accepted answer (incremental update approach):
    - Maintain in-memory representation of the premise (loaded once at start) plus the raw file contents.
    - For the first integrated answer in this session:
       * Ensure a `## Development Notes` section exists (create it just after the highest-level story/overview section per the premise template if missing).
       * Under it, create (if not present) a `### Session YYYY-MM-DD` subheading for today.
    - Append a bullet line immediately after acceptance: `- Q: <question> → A: <final answer>`.
    - Then immediately apply the development to the most appropriate section(s):
       * Character ambiguity → Update or add details in Character sections or Story Requirements.
       * Plot/story interaction → Update Story Foundation or Character subsection (if present) with clarified motivation, conflict, or arc.
       * World-building elements → Update Setting & World-Building (add rules, systems, relationships) preserving narrative flow; note added details succinctly.
       * Genre/style constraint → Add/modify specific criteria in Genre & Style Elements section (convert vague description to specific narrative target).
       * Conflict/crisis scenario → Add a new element under Conflict & Crisis Handling (or create such subsection if template provides placeholder for it).
       * Terminology conflict → Normalize term across premise; retain original only if necessary by adding `(formerly referred to as "X")` once.
    - If the development invalidates an earlier ambiguous statement, replace that statement instead of duplicating; leave no obsolete contradictory text.
    - Save the premise file AFTER each integration to minimize risk of context loss (atomic overwrite).
    - Preserve formatting: do not reorder unrelated sections; keep heading hierarchy intact.
    - Keep each inserted development minimal and story-focused (avoid excessive detail drift).

6. Validation (performed after EACH write plus final pass):
   - Development session contains exactly one bullet per accepted answer (no duplicates).
   - Total asked (accepted) questions ≤ 5.
   - Updated sections contain no lingering vague placeholders the new answer was meant to resolve.
   - No contradictory earlier statement remains (scan for now-invalid alternative story choices removed).
   - Markdown structure valid; only allowed new headings: `## Development Notes`, `### Session YYYY-MM-DD`.
   - Story consistency: same canonical character/world terms used across all updated sections.

7. Write the updated premise back to `PREMISE_FILE`.

8. Report completion (after questioning loop ends or early termination):
   - Number of questions asked & answered.
   - Path to updated premise.
   - Sections touched (list names).
   - Coverage summary table listing each taxonomy category with Status: Resolved (was Partial/Missing and addressed), Deferred (exceeds question quota or better suited for outlining), Clear (already sufficient), Outstanding (still Partial/Missing but low impact).
   - If any Outstanding or Deferred remain, recommend whether to proceed to `/outline` or run `/develop` again later post-outline.
   - Suggested next command.

Behavior rules:
- If no meaningful story gaps found (or all potential questions would be low-impact), respond: "No critical story elements need development." and suggest proceeding.
- If premise file missing, instruct user to run `/premise` first (do not create a new premise here).
- Never exceed 5 total asked questions (development retries for a single question do not count as new questions).
- Avoid speculative writing craft questions unless the absence blocks story coherence.
- Respect user early termination signals ("stop", "done", "proceed").
 - If no questions asked due to full coverage, output a compact coverage summary (all categories Clear) then suggest advancing.
 - If quota reached with unresolved high-impact categories remaining, explicitly flag them under Deferred with rationale.

Context for prioritization: {ARGS}
