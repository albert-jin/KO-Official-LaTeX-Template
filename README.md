新版请参考 [KO-Latex-version.20261119-APA](./KO-Latex-version.20261119-APA/README.md) 里面的模板和说明。

# Knowledge Organization LaTeX Article Template

This repository provides a LaTeX replacement for the KO Word article template. The latest version is **2026-11-19 (v1.2, APA 7)**, maintained in [KO-Latex-version.20261119-APA](./KO-Latex-version.20261119-APA/README.md). The prior version remains unchanged.

All download and resource links below point to this version. The older template files are retained for historical comparison and are not the current release.

## Download

Authors can download the complete **APA 7** LaTeX package here:

[Download the latest LaTeX template ZIP](https://github.com/albert-jin/KO-Official-LaTeX-Template/raw/refs/heads/main/KO-Latex-version.20261119-APA/KO-LaTeX-Article-Template-APA-20261119.zip)

The ZIP is generated from `KO-Latex-version.20261119-APA/` and contains:

- [ko-template.cls](./KO-Latex-version.20261119-APA/ko-template.cls): page layout, headings, line numbers, typography, and APA 7 setup.
- [LaTex-Article-template-KO.tex](./KO-Latex-version.20261119-APA/LaTex-Article-template-KO.tex): the editable sample manuscript.
- [references.bib](./KO-Latex-version.20261119-APA/references.bib): sample references plus fictitious compilation examples. Remove the fictitious examples before submission.
- `figures/KO-header.png`, `figures/KO-footer.jpg`, and `figures/Fig. 1. Figure title.jpg`: template assets.
- The compiled PDF, original Word template, `.gitignore`, README, and reproducible test sources.

See the [complete package manifest and instructions](./KO-Latex-version.20261119-APA/README.md#release-contents). Paths inside the ZIP are relative to its extraction directory; the package is self-contained.

If the link does not download automatically, open the file page on GitHub and click **Download raw file**.

## Compiled Preview

The APA-formatted LaTeX PDF is included for quick visual inspection:

[View the latest compiled LaTeX PDF](./KO-Latex-version.20261119-APA/LaTex-Article-template-KO.pdf)

## Source Template

The original Word template is included for comparison:

[Microsoft-Word-Article-template-KO.docx](./KO-Latex-version.20261119-APA/Microsoft-Word-Article-template-KO.docx)

Authors should edit the `.tex` file for manuscript content and keep the `.cls` file as the shared journal template unless journal formatting rules change.
Ordinary manuscript paragraphs can be written directly in the `.tex` file; leave a blank line between paragraphs. Use helper commands such as `\KONoIndent{}` only for lines that intentionally need special formatting.

## Recommended Build

From a repository checkout, enter the latest version directory and compile with XeLaTeX and Biber:

```bash
cd KO-Latex-version.20261119-APA
latexmk -xelatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
```

If using the downloaded ZIP, run the `latexmk` command directly in the extraction directory. LuaLaTeX is also supported: replace `-xelatex` with `-lualatex`. See the [latest README](./KO-Latex-version.20261119-APA/README.md#compile) for dependencies and font options.

## Repository Contents

The current source files, image assets, Word reference, compiled preview, and downloadable ZIP are all under `KO-Latex-version.20261119-APA/`. Local QA reports, intermediate build files, caches, and temporary files are excluded by `.gitignore`.
