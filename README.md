# Knowledge Organization LaTeX Article Template

Suggested repository name: `knowledge-organization-latex-template`

GitHub description:

> A LaTeX article template for Knowledge Organization manuscripts, rebuilt from the official Microsoft Word article template with matching structure, line numbers, header/footer artwork, sample BibTeX references, and a ready-to-edit manuscript example.

This repository provides a LaTeX replacement for `Microsoft-Word-Article-template-KO.docx`. It is intended for authors who prefer writing manuscripts in LaTeX while keeping the layout and submission structure aligned with the official Word template.

## Download

Authors can download the complete LaTeX package here:

[Download the LaTeX template ZIP](https://github.com/albert-jin/KO-Official-LaTeX-Template/raw/main/KO-LaTeX-Article-Template.zip)

The ZIP package is expected to contain:

- `ko-template.cls`: the document class that defines the KO-style page layout, headings, line numbers, typography, and figure/table formatting.
- `LaTex-Article-template-KO.tex`: the editable sample manuscript matching the official Word template content.
- `references.bib`: sample BibTeX references in the KO publication style.
- `figures/KO-header.png`, `figures/KO-footnote.jpg`, and `figures/Fig. 1. Figure title.jpg`: image assets used by the template.

If the link does not download automatically, open the file page on GitHub and click **Download raw file**.

## Compiled Preview

The LaTeX-compiled PDF is included for quick visual inspection:

[View the compiled LaTeX PDF](./LaTex-Article-template-KO.pdf)

## Source Template

The original Word template is included for comparison:

[Microsoft-Word-Article-template-KO.docx](./Microsoft-Word-Article-template-KO.docx)

Authors should edit the `.tex` file for manuscript content and keep the `.cls` file as the shared journal template unless journal formatting rules change.

## Recommended Build

Compile the sample manuscript with XeLaTeX and Biber:

```bash
latexmk -xelatex -jobname=LaTex-Article-template-KO LaTex-Article-template-KO.tex
```

The `-jobname` keeps the generated LaTeX PDF at `LaTex-Article-template-KO.pdf` and avoids overwriting the Word-exported reference PDF.

## Repository Contents

This repository is designed to publish only the source template, required image assets under `figures/`, the Word reference template, the compiled preview PDF, and the final downloadable ZIP package. Temporary Word lock files, rendered screenshots, published-paper reference scratch files, and LaTeX build artifacts are intentionally excluded by `.gitignore`.
