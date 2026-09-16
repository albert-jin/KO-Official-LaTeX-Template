# Knowledge Organization LaTeX Template - 2026-09-16

This version applies the supplied KO template review recommendations while preserving the original single-column manuscript layout. The parent directory remains the previous version; this directory is self-contained.

All resource links in this README refer to this version. Do not mix these files with the older template files from the repository root.

## Download

[Download the complete 2026-09-16 template ZIP](https://github.com/albert-jin/KO-Official-LaTeX-Template/raw/refs/heads/main/KO-Latex-version.20260916/KO-LaTeX-Article-Template-20260916.zip)

[View the compiled PDF](./LaTex-Article-template-KO.pdf) | [Original Word template](./Microsoft-Word-Article-template-KO.docx)

Sources: [sample manuscript](./LaTex-Article-template-KO.tex), [document class](./ko-template.cls), and [bibliography](./references.bib).

The ZIP is stored in this directory as `KO-LaTeX-Article-Template-20260916.zip` and contains the files listed under [Release Contents](#release-contents), including this updated README. It excludes the previous root-level release and all temporary build outputs.

The download link becomes available when this version is published to GitHub. Extract the entire ZIP before compiling; keep the `.tex`, class, bibliography, and `figures/` directory together.

## Compile

Run from this directory. Use XeLaTeX or LuaLaTeX with **Biber**, not BibTeX or pdfLaTeX:

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
# Alternatively:
latexmk -lualatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
```

Without latexmk, run `xelatex`, `biber`, `xelatex`, `xelatex` on the document basename, omitting `.tex` for Biber. Substitute `lualatex` for LuaLaTeX. In Overleaf, select the main `.tex` file and one of these engines.

Use a current full TeX Live or MiKTeX installation. Required packages include fontspec, unicode-math, biblatex, geometry, graphicx, xcolor, soul, eso-pic, lineno, needspace, enumitem, tabularx, booktabs, amsmath, hyperref, xeCJK (XeLaTeX), and luatexja-fontspec (LuaLaTeX). TeX Gyre and Fandol fonts are required and supplied by TeX distributions, not by this ZIP.

### Fonts

The class prefers Times New Roman, Arial, and Courier New. If a font is unavailable, it warns and selects TeX Gyre Termes, Heros, or Cursor, respectively. To select all portable fonts explicitly:

```latex
\documentclass[portablefonts]{ko-template}
```

Substitutions can change line wrapping and pagination; use Microsoft fonts for the closest Word-layout match. No Microsoft font files are redistributed. Chinese names use Fandol Song; rare characters and other writing systems may need additional fonts configured by the author.

## Writing the Manuscript

Write paragraphs directly, separated by blank lines. No `\KOParagraph{...}` wrapper is needed. The class owns indentation, spacing, typography, and manuscript line numbering. The sample retains the title page and original intentional blank second page.

Fill in the full correspondence address, email and telephone, main-text and abstract word counts, and figure/table totals. ORCID is optional, but recommended. `\KORunningTitle{...}` accepts plain text and warns above 60 characters including spaces. Counts are author-supplied, not automatic.

Revised submission artwork requirements: line art 800 dpi; combination artwork 600 dpi; halftone 300 dpi; TIF or JPG in RGB, not CMYK; no 72 dpi web-quality images. For direct LaTeX inclusion, use JPG, PNG, or PDF; convert a TIF while retaining the original submission artwork. Missing template images produce a class error requesting the complete package.

## References

Real sample references remain in `references.bib`. Validation fixtures in `tests/references-qa.bib` are **synthetic, not real publications**.

Use `\parencite{keyC,keyA,keyB}` for multiple works in one bracket: keys are sorted by author and separated by semicolons. `\parencites` groups may carry separate notes and retain input order; order them explicitly or use one `\parencite` list. One- and two-author citations list names; three or more use the first author and `et al.`. Bibliographies list all 1-6 authors; 7 or more list the first six and `et al.`.

| Type | Fields in output order |
| --- | --- |
| `article` | `author`, `title`, `journaltitle`, `date`/`year`, `volume`, `pages`, `doi` |
| `book` | `author` (or `editor`), `title`, optional `edition`, `publisher`, `location`, `date`/`year` |
| `incollection` / `inbook` | `author`, `title`, `editor`, `booktitle`, `pages`, `publisher`, `location`, `date`/`year` |
| `patent` | inventor in `author`, assignee in `holder`, `title`, country in `location`, optional `type`, `number`, full `date` |
| `online` | `author`, `title`, `date`/`year`, `url`, `urldate` |

Use ISO dates: `date={2000-08-08}` for a patent and `urldate={2000-08-08}` for a website. The latter prints `(Accessed: 8 August 2000)`. Supply an access date for every website. Use `pages={21--35}` and a bare DOI, not a full DOI URL. Other entry types retain BibLaTeX defaults and have not been normalized by this release.

Name input examples (separate alternatives):

```bibtex
author = {Smith, John and Smith, Jr., John and de la Cruz, Juan
          and van Beethoven, Ludwig and Dupont, Jean-Pierre
          and García Márquez, José}
author = {{World Health Organization}}
author = {{张三} and {李四}}
```

Prefixes, suffixes, accents, and hyphens are retained. Braced literal names preserve institutional or Chinese name order. A `sortkey` can specify a desired romanized sort position for a Chinese name. Save sources as UTF-8.

## Release Contents

The ZIP contains exactly:

```text
.gitignore
README.md
QA.md
LaTex-Article-template-KO.tex
LaTex-Article-template-KO.pdf
ko-template.cls
references.bib
Microsoft-Word-Article-template-KO.docx
figures/KO-header.png
figures/KO-footnote.jpg
figures/Fig. 1. Figure title.jpg
tests/references-qa.bib
tests/references-qa.tex
tests/portable-qa.tex
tests/missing-font.tex
tests/missing-image.tex
tests/running-title.tex
tests/run_qa.py
```

No fonts, intermediate build files, or nested ZIP are included. The preview uses XeLaTeX and the available Microsoft fonts; the Word template is unmodified.

## Validation

With Python 3, Poppler (`pdftotext`), and TeX tools on PATH:

```bash
python tests/run_qa.py
```

This verifies both engines, reference fixtures, portable fonts, and missing-resource, unsupported-engine, and running-title diagnostics. Outputs stay in ignored `build/`. See [QA.md](./QA.md) for validation results and limits.
