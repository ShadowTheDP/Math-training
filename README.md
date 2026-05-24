# Take-Down-IMO

## Purpose

This repository is a Typst-based mathematics authoring project for producing
clean, reusable math documents from source books, extracted Markdown, and
manual Typst editing.

It is one project, one repository, and one Git history.

Current working areas:

- `Math-training/`
  - The main Typst authoring workspace.
- `typst-skills/`
  - Bundled support/reference material for AI-assisted Typst work.
  - Because this is a skill/reference bundle rather than a work subproject, it
    may keep its own `README.md`.

## What "Correct Work" Means Here

Human collaborators and AI agents should treat this repo as the parent project
for the whole Take-Down-IMO workflow.

Correct ways to work on this project:

- Use `Math-training/` for actual Typst authoring and generated outputs.
- Use `typst-skills/` only as support/reference material.
- Keep all project rules in this single repository-root README.
- Keep generated output local to the work area that produced it.
- Document workflow changes here when they affect the whole project.

Avoid:

- Treating `typst-skills/` as the main authoring output area.
- Mixing project-level documentation with generated files.
- Treating `Math-training/` as a separate Git repository.
- Adding README files to small book-specific subprojects.
- Creating a repo-root output dump for work that belongs in a subfolder.
- Forgetting that skill/reference folders are the one allowed README
  exception because they support the main project instead of acting as a
  work subproject.

## Git Structure

This repository is the single Git root for the full `Take-Down-IMO` project.

That means:

- `Take-Down-IMO/.git` is the only Git metadata that matters here.
- `Math-training/` is a normal tracked folder inside the repo.
- `Changing Description.txt` in the repository root is the only official
  project change log.
- The GitHub repository name should match this project name:
  `Take-Down-IMO`.
- Generated output and local font assets should stay out of Git.

## Environment

This repository is mostly a coordination layer around the main authoring
workspace in `Math-training/`.

The active working environment depends on which part you are touching:

- `Math-training/`
  - Typst CLI workflow and source editing
- `typst-skills/`
  - Local skill/documentation bundle for AI-assisted Typst work

Current expectation for authoring work:

- Typst CLI available
- Typst compiler version `0.14.0` or newer
- Local font asset such as `Math-training/ukai.ttc` available if the current
  style depends on it

## First Useful Commands

Check the repository status:

```powershell
git status
```

Check that the repository remote points at the renamed GitHub repository:

```powershell
git remote -v
```

Compile the main authoring documents from the repository root:

```powershell
typst compile Math-training/Note-to-EGMO.typ Math-training/output/Note-to-EGMO.pdf
typst compile Math-training/Note-to-MONT.typ Math-training/output/Note-to-MONT.pdf
```

## Authoring Model

This repository currently follows a simple model:

1. Source material lives outside the repo in `../../Project-source/Math/` or
   arrives as Markdown from the sibling `PDF-to-Markdown` project.
2. Active Typst writing happens in `Math-training/`.
3. Existing style and structure should start from
   `Math-training/Note-to-EGMO.typ`.
4. Shared logic should stay in `Math-training/utils/`.
5. Generated PDFs and build notes should go to the local `output/` folder of
   the work area that produced them.

For the current top-level documents, that local output folder is
`Math-training/output/`.

## Working Inside Math-training

When editing the main Typst workspace, follow this working pattern:

- Keep book/source-specific documents as top-level Typst entry files.
- Reuse `Math-training/Note-to-EGMO.typ` as the current style baseline.
- Treat `Math-training/Note-to-MONT.typ` as the active working document.
- When starting a new source set, prefer a new top-level entry file such as
  `Note-to-BOOK.typ`.
- Keep shared layout, math environments, and helper logic in
  `Math-training/utils/`.
- Change `Math-training/utils/` only when the change is intentionally global.
- Keep generated output in `Math-training/output/` or in a deeper local
  `output/` folder that belongs to the specific work area.
- Do not revive the older `results/` convention for new work.

For book-style answer sets, the preferred structure is:

- preliminaries at the beginning when needed
- main solve-oriented chapters in the middle
- appendix or collected supporting results at the end when useful

## Inputs

Typical inputs for this project are:

- Shared source PDFs from `../../Project-source/Math/`
- Markdown or extracted content that eventually feeds `Math-training/`
  through manual Typst authoring
- Typst support/reference material in `typst-skills/`

## Outputs

There is no preferred repository-root output directory for this project.

Each output-producing work area should keep its own local `output/` folder.

The current concrete example is:

```text
Math-training/output/
```

If future work grows into a dedicated folder, prefer a pattern like:

```text
Math-training/book-name/
  source.typ
  output/
```

Generated files in those local output folders are working artifacts and are not
supposed to be committed.

Small subprojects should not add their own README. Their purpose should stay
clear through naming, entry files, and this parent README.

Skill/reference bundles are the explicit exception. `typst-skills/` may keep a
local `README.md` because it is support material for humans and AI agents, not
a work subproject.

## File Map

Top-level files and folders:

- `.gitignore`
  - Parent-level ignore rules for generated artifacts, caches, and local
    assets.
- `README.md`
  - This project working guide and the authoritative repo-wide rule set.
- `Changing Description.txt`
  - The single official project change log. Update it after completed work,
    especially before pushing to GitHub.
- `Math-training/`
  - Main authoring directory for Typst work and outputs.
  - Contains current entry files, shared Typst utilities, and local output.
- `typst-skills/`
  - Bundled AI-agent support material for Typst and Touying authoring.
  - Not the main place for document output.
  - May keep its own README because it is a support bundle, not a project
    subworkspace.

Important files inside `Math-training/`:

- `Note-to-EGMO.typ`
  - Reference Typst implementation and current style baseline.
- `Note-to-MONT.typ`
  - Active book-oriented Typst document.
- `Typst_Project_Structure_Guide.md`
  - Supplemental architecture and workflow reference for the authoring
    workspace.
- `utils/`
  - Shared Typst modules used by multiple documents.
- `output/`
  - Current local output folder for the top-level `Math-training/` documents.
- `ukai.ttc`
  - Optional local font asset used by the current style. Keep it out of Git
    unless a human explicitly decides to vendor fonts.

Important files inside `typst-skills/`:

- `README.md`
  - Support-bundle guide for how the skill material should be used.
  - Allowed because `typst-skills/` is not a project work subfolder.
- `typst-author/`
  - General-purpose Typst reference bundle and local documentation mirror.
- `touying-author/`
  - Touying slide/presentation reference bundle and examples.

## Folder Roles

Use each top-level folder for a distinct responsibility:

- `Math-training/`
  - The only place in this repository where main Typst source files should be
    authored and compiled.
- `Math-training/output/`
  - Local generated PDFs and notes. Keep this directory out of Git.
- `Math-training/utils/init.typ`
  - Main project initialization entry that wires fonts, styles, headings,
    references, math behavior, graphs, page setup, and outline together.
- `Math-training/utils/math.typ`
  - Math environments and proof/equation helpers.
- `Math-training/utils/heading.typ`
  - Heading presentation and related heading behavior.
- `Math-training/utils/fonts.typ`
  - Font configuration.
- `Math-training/utils/style.typ`
  - Global style rules.
- `Math-training/utils/ref.typ`
  - Reference and cross-reference helpers.
- `Math-training/utils/graph.typ`
  - Geometry and graph helper functions/setup.
- `Math-training/utils/utils.typ`
  - Shared lower-level utility helpers.
- `typst-skills/README.md`
  - Usage notes for the skill bundle that supports AI-assisted work.
- `typst-skills/typst-author/`
  - Local Typst language/reference support for agents.
- `typst-skills/touying-author/`
  - Local Touying presentation support for agents.

## Using typst-skills

Use `typst-skills/` when the agent or collaborator needs syntax help,
examples, or package-specific guidance.

The main current bundles are:

- `typst-author/`
  - General Typst writing support with mirrored reference/tutorial content.
- `touying-author/`
  - Touying slide-authoring support and examples.

Inside this repository, the intended usage is simple:

1. Author actual source files in `Math-training/`.
2. Consult `typst-skills/` when syntax, layout, or package usage is unclear.
3. Return to `Math-training/` to implement the real source change.

## Working Rules for AI Agents

If you are an AI agent working in this repo:

1. Read this README first.
2. Treat this README as the single source of truth for repo-wide rules.
3. Treat `Math-training/` as part of this same repository.
4. Do not confuse support material in `typst-skills/` with the main authoring
   source.
5. Keep generated output in the defined output locations and source edits in
   source folders.
6. Follow Typst 0.14+ patterns and prefer current Typst idioms over older
   habits when they conflict.
7. Reuse `Math-training/utils/` and `Math-training/Note-to-EGMO.typ` unless a
   real global change is necessary.
8. Do not add README files to small subprojects.
9. Skill/reference bundles such as `typst-skills/` may keep their own README
   because they support the main project instead of acting as work
   subprojects.
10. Update `Changing Description.txt` after meaningful completed work,
    especially before push.
11. Do not commit local build output or local-only font assets unless a human
    explicitly asks for it.
12. If the repository workflow or structure changes, update this README in the
    same task.

## Before Push Checklist

Before pushing to GitHub, check:

- `Math-training/` changes are staged as normal repository files.
- No generated artifacts were added at the parent level by accident.
- Local output folders such as `Math-training/output/` remain local-only.
- No new README was added inside non-skill work subfolders.
- `Changing Description.txt` was updated to reflect the completed work.
- The remote URL points at `https://github.com/ShadowTheDP/Take-Down-IMO`.
- README updates were included if the project structure or workflow changed.
