# Math-training

## Purpose

This repository turns selected Markdown materials into Typst so you can keep
writing, refining, and publishing book answers in Typst.

In practice, this directory acts as a Typst authoring workspace for
solution-style documents based on source books and converted Markdown.

This directory lives inside the parent repository `Take-Down-IMO` and is now a
normal tracked folder inside that repo.

## What "Correct Work" Means Here

Human collaborators and AI agents should treat this repo as a Typst authoring
workspace, not just a PDF output folder.

Correct ways to work on this project:

- Keep book/source-specific documents as top-level Typst entry files.
- Keep shared style and reusable logic in `utils/`.
- Keep generated outputs in `output/`.
- Reuse the established document style instead of ad hoc formatting drift.
- Preserve the repo as an editable authoring system, not just a final PDF dump.

Avoid:

- Editing shared utilities casually for a one-off document need.
- Mixing source `.typ` files with generated PDFs.
- Reviving the older `results/` convention for new work.

## Environment

Current expectation:

- Typst CLI available on the system
- Typst compiler version 0.14.0 or newer
- Local font asset `ukai.ttc` available to the project

Basic compile pattern:

```powershell
typst compile Note-to-EGMO.typ output/Note-to-EGMO.pdf
typst compile Note-to-MONT.typ output/Note-to-MONT.pdf
```

## First Useful Commands

Compile the reference document:

```powershell
typst compile Note-to-EGMO.typ output/Note-to-EGMO.pdf
```

Compile the MONT document:

```powershell
typst compile Note-to-MONT.typ output/Note-to-MONT.pdf
```

## Inputs

Typical inputs for this repo are:

- Selected Markdown content produced from `PDF-to-Markdown`
- Source PDFs from `../../Project-source/Math/`
- Existing Typst source files and shared helpers in `utils/`

When starting a new book or source set, prefer creating a new top-level Typst
entry file such as:

```text
Note-to-BOOK.typ
```

## Outputs

Put generated files under:

```text
output/
```

Typical outputs include:

- Final PDFs
- Build notes such as `Changing Description.txt`

## File Map

Top-level files and folders:

- `.gitignore`
  - Git ignore rules for Typst build artifacts and system files.
- `README.md`
  - This project working guide.
- `Note-to-EGMO.typ`
  - Reference Typst implementation and style baseline.
- `Note-to-MONT.typ`
  - Active book-oriented Typst document.
- `Typst_Project_Structure_Guide.md`
  - Architecture and workflow guide for the repo.
- `utils/`
  - Shared Typst utilities, styling, references, and helper logic.
- `output/`
  - Generated output artifacts for this repo.
- `ukai.ttc`
  - Local font asset used by the project.

Files inside `utils/`:

- `init.typ`
  - Main project initialization entry that wires together fonts, styles,
    headings, math behavior, references, graphs, page setup, and outline.
- `math.typ`
  - Math environments and proof/equation helpers.
- `heading.typ`
  - Heading presentation and related heading behavior.
- `fonts.typ`
  - Font configuration.
- `style.typ`
  - Global style rules.
- `ref.typ`
  - Reference/cross-reference helpers.
- `graph.typ`
  - Geometry/graph helper functions and setup.
- `utils.typ`
  - Shared lower-level utility helpers.

## Working Rules for AI Agents

If you are an AI agent working in this directory:

1. Read this README first.
2. Prefer reusing `Note-to-EGMO.typ` as a style reference.
3. Treat `utils/` as shared infrastructure and edit it carefully.
4. Put generated PDFs in `output/`.
5. If you introduce a new book/document flow, document it in the README or a
   dedicated local guide.

## Before Push Checklist

Before pushing to GitHub, check:

- Generated PDFs are in `output/`, not mixed with source files.
- Shared utility changes in `utils/` were intentional and tested.
- No accidental regression to the older `results/` convention was introduced.
- New entry files follow the existing naming style.
- README updates were included if the workflow or structure changed.
- Remember these files are pushed through the parent `Take-Down-IMO` repo.

## Current Gaps

- Repo history still references an older `results/` output convention, while the
  current workspace standard is `output/`.
- `results/*.pdf` is still present in the tracked Git history, so this repo has
  legacy build-artifact baggage to clean up later.
- `ukai.ttc` may be intentional, but it is a large local asset and should be
  treated as such.
