---
description: Define or update the novel's themes and narrative guidelines from interactive or provided creative inputs, ensuring all dependent templates stay aligned.
---

The user input to you can be provided directly by the agent or as a command argument - you **MUST** consider it before proceeding with the prompt (if not empty).

User input:

$ARGUMENTS

You are updating the novel's thematic foundation at `/memory/themes.md`. This file is a TEMPLATE containing placeholder tokens in square brackets (e.g. `[NOVEL_TITLE]`, `[THEME_1_NAME]`). Your job is to (a) collect/derive concrete creative values, (b) fill the template precisely, and (c) propagate any changes across dependent story artifacts.

Follow this execution flow:

1. Load the existing themes template at `/memory/themes.md`.
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]`.
   **IMPORTANT**: The user might require different themes than the ones used in the template. If specific themes are mentioned, respect that - follow the general template structure. You will update the doc accordingly.

2. Collect/derive values for placeholders:
   - If user input (conversation) supplies a value, use it.
   - Otherwise infer from existing repo context (README, docs, prior constitution versions if embedded).
   - For creative dates: `CREATION_DATE` is when themes were first established, `LAST_REVISED_DATE` is today if changes are made, otherwise keep previous.
   - `THEMES_VERSION` must increment according to creative versioning rules:
     * MAJOR: Fundamental theme changes or complete genre shifts.
     * MINOR: New theme added or significant expansion of existing themes.
     * PATCH: Clarifications, refinements, minor thematic adjustments.
   - If version bump type ambiguous, propose reasoning before finalizing.

3. Draft the updated themes content:
   - Replace every placeholder with concrete creative text (no bracketed tokens left except intentionally retained template slots that the story has chosen not to define yet—explicitly justify any left).
   - Preserve heading hierarchy and comments can be removed once replaced unless they still add creative guidance.
   - Ensure each Theme section: succinct thematic statement, paragraph (or bullet list) capturing core story elements, explicit creative rationale if not obvious.
   - Ensure Creative Guidelines section lists theme development procedure, consistency requirements, and story alignment expectations.

4. Creative consistency propagation checklist:
   - Read `/templates/outline-template.md` and ensure any "Theme Integration" sections align with updated themes.
   - Read `/templates/premise-template.md` for story/theme alignment—update if themes add/remove mandatory story elements or constraints.
   - Read `/templates/scenes-template.md` and ensure scene categorization reflects new or updated thematic requirements.
   - Read `/templates/character-template.md` and ensure character arc requirements align with updated themes.
   - Read `/templates/world-building-template.md` and ensure cultural/world elements support updated themes.
   - Read `/templates/scene-template.md` and ensure scene purpose templates reflect thematic goals.
   - Read `/templates/manuscript-template.md` and ensure structural requirements support thematic development.
   - Read each command file in `/templates/commands/*.md` (including this one) to verify no outdated references to old themes or creative guidelines.
   - Read any creative guidance docs (e.g., `README.md`, `novel-writing.md`, or writing assistant files if present). Update references to themes changed.

5. Produce a Creative Sync Report (prepend as an HTML comment at top of the themes file after update):
   - Version change: old → new
   - List of modified themes (old theme → new theme if changed)
   - Added thematic elements
   - Removed thematic elements
   - Templates requiring updates (✅ updated / ⚠ pending) with file paths
   - Follow-up TODOs if any placeholders intentionally deferred.

6. Validation before final output:
   - No remaining unexplained bracket tokens.
   - Version line matches report.
   - Dates ISO format YYYY-MM-DD.
   - Themes are clear, compelling, and support story structure (vague concepts → replace with specific thematic statements where appropriate).

7. Write the completed themes back to `/memory/themes.md` (overwrite).

8. Output a final summary to the user with:
   - New version and bump rationale.
   - Any files flagged for manual follow-up.
   - Suggested commit message (e.g., `docs: update themes to vX.Y.Z (thematic development + creative guidelines)`).

Formatting & Style Requirements:
- Use Markdown headings exactly as in the template (do not demote/promote levels).
- Wrap long rationale lines to keep readability (<100 chars ideally) but do not hard enforce with awkward breaks.
- Keep a single blank line between sections.
- Avoid trailing whitespace.

If the user supplies partial updates (e.g., only one theme revision), still perform validation and version decision steps.

If critical info missing (e.g., creation date truly unknown), insert `TODO(<FIELD_NAME>): explanation` and include in the Creative Sync Report under deferred items.

Do not create a new template; always operate on the existing `/memory/themes.md` file.
