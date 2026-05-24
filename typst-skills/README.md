# Typst Agent Skills

This directory bundles local agent skills for writing, editing, and debugging
[Typst](https://typst.app) documents inside the parent `Take-Down-IMO`
repository.

It is support material, not the main authoring workspace.

Repo-wide project rules still live in `../README.md`.

Most models struggle with Typst syntax because it is newer and less familiar
than LaTeX. These skills help by including local copies of documentation,
examples, and specialized prompts. Instead of guessing syntax or relying on
outdated memory, an agent should search these local resources before writing or
editing Typst files.

## Directory Role

Use this directory when you need agent-side reference material.

Do not use it as the place to write the main project documents. The real
Typst authoring work belongs in `../Math-training/`.

## Available Skills

### [typst-author](./typst-author/)

The general-purpose skill for writing Typst documents. It includes a local
mirror of the official Typst documentation, including references, tutorials,
and guides.

### [touying-author](./touying-author/)

A specialized skill for creating presentation slides using the
[Touying](https://github.com/touying-typ/touying) package. It includes a local
copy of Touying documentation and examples for slide decks, animations, and
custom themes.

## Usage

If you are using an agent that supports the
[Agent Skills](https://agentskills.io/home) open standard:

1. Clone this repository.
2. Move or copy the individual skill directories (`typst-author`,
   `touying-author`) into the `skills/` folder of your agentic coding
   assistant.

Inside this workspace, the usual pattern is simpler:

1. Work on Typst source in `../Math-training/`.
2. Read from this directory when the agent needs Typst or Touying reference
   material.
