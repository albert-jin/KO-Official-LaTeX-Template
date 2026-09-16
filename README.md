新版请参考 [KO-Latex-version.20260916](./KO-Latex-version.20260916/README.md) 里面的模板和说明。

# Knowledge Organization LaTeX Article Template

This repository provides a LaTeX replacement for the KO Word article template. The latest version is **2026-09-16 (v1.1)**, maintained in [KO-Latex-version.20260916](./KO-Latex-version.20260916/README.md). It includes revised references, configurable tables, standard figures and equations with cross-references, stable font sizes, and a simplified single-column author layout without a blank second page or copyright footer by default.

All download and resource links below point to this version. The older template files in the repository root are retained for historical comparison and are not the current release. The old manuscript source is named `LaTex-Article-template-KO.tex.old`; the obsolete root-level ZIP has been removed.

## Download

Authors can download the complete **2026-09-16** LaTeX package here:

[Download the latest LaTeX template ZIP](https://github.com/albert-jin/KO-Official-LaTeX-Template/raw/refs/heads/main/KO-Latex-version.20260916/KO-LaTeX-Article-Template-20260916.zip)

The ZIP is generated from `KO-Latex-version.20260916/` and contains:

- [ko-template.cls](./KO-Latex-version.20260916/ko-template.cls): page layout, headings, line numbers, typography, and reference formatting.
- [LaTex-Article-template-KO.tex](./KO-Latex-version.20260916/LaTex-Article-template-KO.tex): the revised editable sample manuscript.
- [references.bib](./KO-Latex-version.20260916/references.bib): sample references.
- `figures/KO-header.png`, `figures/KO-footer.jpg`, and `figures/Fig. 1. Figure title.jpg`: assets in the latest version; the footer is used only with the optional `legacydecor` mode.
- The compiled PDF, original Word template, `.gitignore`, README, validation report, and test sources.

See the [complete package manifest and instructions](./KO-Latex-version.20260916/README.md#release-contents). Paths inside the ZIP are relative to its extraction directory; the package is self-contained and does not use the older root-level files.

If the link does not download automatically, open the file page on GitHub and click **Download raw file**.

## Compiled Preview

The LaTeX-compiled PDF is included for quick visual inspection:

[View the latest compiled LaTeX PDF](./KO-Latex-version.20260916/LaTex-Article-template-KO.pdf)

## Source Template

The original Word template is included for comparison:

[Microsoft-Word-Article-template-KO.docx](./KO-Latex-version.20260916/Microsoft-Word-Article-template-KO.docx)

Authors should edit the `.tex` file for manuscript content and keep the `.cls` file as the shared journal template unless journal formatting rules change.
Ordinary manuscript paragraphs can be written directly in the `.tex` file; leave a blank line between paragraphs. Use helper commands such as `\KONoIndent{}` only for lines that intentionally need special formatting.

## Recommended Build

From a repository checkout, enter the latest version directory and compile with XeLaTeX and Biber:

```bash
cd KO-Latex-version.20260916
latexmk -xelatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
```

If using the downloaded ZIP, run the `latexmk` command directly in the extraction directory. LuaLaTeX is also supported: replace `-xelatex` with `-lualatex`. See the [latest README](./KO-Latex-version.20260916/README.md#compile) for dependencies and font options.

## Repository Contents

The current source files, image assets, Word reference, compiled preview, and downloadable ZIP are all under `KO-Latex-version.20260916/`. Intermediate build files are excluded by `.gitignore`. See the [validation report](./KO-Latex-version.20260916/QA.md) for test results and limitations.
