# Take-Down-IMO

## Purpose

This repository is a Typst-based mathematics authoring project.

It brings together:

- the active authoring workspace in `Math-training/`
- local AI-agent support material in `typst-skills/`
- project-specific limits/reference material in `limits/`

## What "Correct Work" Means Here

Human collaborators and AI agents should treat this repo as the parent project
for the whole Take-Down-IMO workflow.

Correct ways to work on this project:

- Use `Math-training/` for actual Typst authoring and generated outputs.
- Use `typst-skills/` as support/reference material for AI-assisted writing.
- Treat `Math-training/` as the main working directory inside this repository.
- Document workflow changes here when they affect the whole project.

Avoid:

- Treating `typst-skills/` as the main authoring output area.
- Mixing project-level documentation with generated files.
- Treating `Math-training/` as a separate Git repository. It is now an
  ordinary folder inside `Take-Down-IMO`.

## Git Structure

This repository is the single Git root for the full `Take-Down-IMO` project.

That means:

- `Take-Down-IMO/.git` is the only Git metadata that matters here.
- `Math-training/` is now a normal tracked folder inside the repo.
- The repository remote is intended to continue the original `Math-training`
  GitHub lineage.

## Environment

This project itself is mostly a coordination layer.

The active working environment depends on which part you are touching:

- `Math-training/`
  - Typst CLI workflow
- `typst-skills/`
  - Reference/support content, not a build target

## First Useful Commands

Check the repository status:

```powershell
git status
```

Compile the main authoring documents from the main authoring directory:

```powershell
typst compile Math-training/Note-to-EGMO.typ Math-training/output/Note-to-EGMO.pdf
typst compile Math-training/Note-to-MONT.typ Math-training/output/Note-to-MONT.pdf
```

## Inputs

Typical inputs for this project are:

- Shared source PDFs from `../../Project-source/Math/`
- Markdown or extracted content that eventually feeds `Math-training/`
- Typst support/reference material in `typst-skills/`

## Outputs

The active concrete output location is:

```text
Math-training/output/
```

At the moment, the parent repo does not maintain a separate top-level output
pipeline; `Math-training/` is the output-producing component.

## File Map

Top-level files and folders:

- `.gitignore`
  - Parent-level ignore rules for temporary and generated top-level artifacts.
- `README.md`
  - This project working guide.
- `Math-training/`
  - Main authoring directory for Typst work and outputs.
- `typst-skills/`
  - AI-agent support material for Typst and Touying authoring.
- `limits/`
  - AI-agent limit/reference material.

## Working Rules for AI Agents

If you are an AI agent working in this repo:

1. Read this README first.
2. Treat `Math-training/` as part of this same repository.
3. If editing `Math-training/`, still check its own `README.md` because it is
   the main authoring area.
4. Do not confuse support material in `typst-skills/` with the main authoring
   source.
5. Keep generated output in the defined output locations and source edits in
   source folders.

## Before Push Checklist

Before pushing to GitHub, check:

- `Math-training/` changes are staged as normal repository files.
- No generated artifacts were added at the parent level by accident.
- README updates were included if the project structure or workflow changed.
- The repo remote still points where you expect before pushing.
