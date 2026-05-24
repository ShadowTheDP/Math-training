# Typst Project Architecture Guide

## 1. Project Overview
This document outlines the standard structure and workflow for converting math problem books (like MONT or EGMO) into Typst projects. The goal is to maintain a clean separation between content, logic, and style, ensuring maintainability and scalability.

**Reference Implementation**: `Note to EGMO.typ` (Template) -> `Note to MONT.typ` (Implementation)

## 2. Directory Structure
A standard project should look like this:

```
Typst-Project/
├── main.typ (or Note-to-MONT.typ)  # Entry point
├── typst.toml                      # Package configuration
├── utils/                          # Logic and Style modules
│   ├── init.typ                    # Document initialization & template logic
│   ├── math.typ                    # Math environment definitions (theorem, problem, etc.)
│   ├── heading.typ                 # Heading styling
│   ├── fonts.typ                   # Font configuration
│   └── preliminaries.typ           # Static frontmatter content
├── assets/                         # Images and static resources
└── scripts/                        # Automation scripts (e.g., Python converters)
```

## 3. Chapter Architecture (The "11-Chapter" Model)
For problem books, we adopt a standardized **11-Chapter Structure** (0-10):

*   **Chapter 0 (Preliminaries)**:
    *   **Content**: Title page, Preface, Notation, TOC.
    *   **Source**: Static file (`utils/preliminaries.typ`) or manually written in the main file.
    *   **Role**: Context setting before the actual content.

*   **Chapters 1-9 (Problem Sets)**:
    *   **Content**: **Only** the "Practice Problems" from the original source.
    *   **Selection Logic**:
        *   Identify sections explicitly marked as "Practice Problems" (usually at the end of a chapter).
        *   Extract entries tagged as `Problem` or `Question` within these sections.
        *   **Exclusion**: Do NOT include theory, examples, or lemmas in these chapters. They belong to Chapter 10.
    *   **Purpose**: Focus the reader on solving exercises.

*   **Chapter 10 (Appendix / Other Entries)**:
    *   **Content**: All non-problem entries found throughout the book.
    *   **Entry Types**: `Theorem`, `Lemma`, `Proposition`, `Corollary`, `Example`, `Definition`, `Remark`.
    *   **Organization**: Grouped by their original chapter context to maintain logical flow.
    *   **Purpose**: Serve as a reference for the theory behind the problems.

## 4. Automation Workflow (Python Scripting)
We use Python scripts (e.g., `convert_mont.py`) to parse Markdown/LaTeX sources and generate the Typst file.

### Key Parsing Logic
1.  **Chapter Detection**:
    *   Regex: `^#+\s+\**Chapter\s+(\d+)`
    *   Action: Start a new section in the data structure.

2.  **Practice Problem Extraction**:
    *   **Marker**: Look for specific headers like `## Practice Problems`.
    *   **Scope**: Only extract `Problem` entries while inside this section.
    *   **Exit Condition**: Encountering a header of equal or higher level (e.g., another `##` or `#`).

3.  **Other Entry Collection**:
    *   **Global Scan**: Scan the entire document for keywords (`**Theorem`, `**Lemma`, etc.).
    *   **Filtering**: If an entry is NOT a `Problem` (or is a Problem outside the Practice section), add it to the "Others" collection.

4.  **Cleaning & Formatting**:
    *   **Copyright Removal**: Filter out footer lines (e.g., `© Author Year`).
    *   **Artifact Removal**: Remove PDF artifacts like page numbers (`# Page 42`) or paragraph markers.
    *   **Escaping**: Escape Typst special characters (`=`, `#`, `$`, `@`) in the content to prevent syntax errors.

## 5. Typst Styling Guidelines
*   **Version**: Always use `compiler = "0.14.0"` or higher.
*   **Math Environments**: Use a custom function (e.g., `#mathenv`) to handle counters and styling uniformly.
*   **Context Awareness**: Use `context` (Typst 0.14+) for dynamic content like cross-references or state-dependent styling.
*   **Font Fallbacks**: Define a robust font list to handle special symbols and CJK characters (e.g., `Source Han Serif`, `Noto Serif CJK`).

## 6. Future Recommendations
*   **Metadata Config**: Keep Title and Author in a variable at the top of the script for easy modification.
*   **Modular Output**: Consider outputting each chapter as a separate `.typ` file and using `#include` in the main file for better editor performance.
*   **Error Handling**: Implement strict checks in the Python script to warn if the number of extracted problems deviates from expected values.


# example promat for AI Agent

你將獲得一本以 Markdown 格式編寫的數學教材。 `c:\Users\user\Desktop\Code-Project\Result-for-project\PDF-to-Markdown\MONT\MONT.md` 
你的任務寫一個Note-to-MONT `c:\Users\user\Desktop\Code-Project\Typst-Project\Math-training\Note-to-MONT.typ` 生成一個結構化的 PDF 文件，並遵循以下規則：

0.第0章使用以下代碼

‘’‘
= Preliminaries

This PDF give all solution of the book _Modern Olympiad Number Theory V2_ written by *Aditya Khurmi*.

== The description of mathenv

Take an example:

#definition(
  desp: "something"
)[
  the main body
]

$stretch(=)^"    type name   "|stretch(=)^" num "|stretch(=)^"source in the book"|stretch(=)^"    the main body    "$

At the very first of this example, is the type name of this example, followed by the serial number of the example, the string inside the brackets is usually the source in the book _MONT_, the string after the "." is the main body of this mathenv.
’‘’

1. Markdown 中的每一章，對應到 PDF 中的一章。

2. 在每一章中，只提取並保留「Practice Problem」部分，將其放入該章節。

3. 在 PDF 的最後新增一章，標題為「Collected Results」。
   - 在這一章中，收錄 Markdown 中所有非題目類型的條目，例如：「Theorem（定理）」、「Proposition（命題）」、「Lemma（引理）」、「Definition（定義）」、「Corollary（推論）」等。

4. 所有數學公式需正確排版。

5. PDF 需保持整潔的學術風格：
   - 標題、正文、數學公式字體一致。
   - 章節與題目需按順序編號。
   - 在 PDF 開頭添加目錄。

6. 最終輸出為一個完整的 PDF 文件。

7.請使用 `c:\Users\user\Desktop\Code-Project\Typst-Project\Math-training\utils` 模板，如非必要不能更改。

具體細節格式和 `c:\Users\user\Desktop\Code-Project\Typst-Project\Math-training\Note-to-EGMO.typ` 相同，請務必做到學習Note-to-EGMO的寫法。 `c:\Users\user\Desktop\Code-Project\Typst-Project\Math-training\Note-to-EGMO.typ` 正是由一本書md經過typst人工編寫處理後得到的。

輸入：數學教材的 Markdown 文件  
輸出：符合上述規則的 PDF 文件

重要：不要使用python文件嘗試進行編程提取關鍵内容，你可以自行閲讀並自行提取。