# Knowledge Organization LaTeX Template - 2026-11-19 (v1.2, APA 7)

This is a separate, self-contained copy of the 2026-09-16 template. It switches citations and references to APA 7 using `biblatex-apa`, and credits template contributor Wei Qiang Jin (金伟强). The original version folder is unchanged.

All resource links in this README refer to this version. Do not mix these files with the older template files from the repository root.

## Download

[Download the complete APA template ZIP](https://github.com/albert-jin/KO-Official-LaTeX-Template/raw/refs/heads/main/KO-Latex-version.20261119-APA/KO-LaTeX-Article-Template-APA-20261119.zip)

[View the compiled PDF](./LaTex-Article-template-KO.pdf) | [Original Word template](./Microsoft-Word-Article-template-KO.docx)

Sources: [sample manuscript](./LaTex-Article-template-KO.tex), [document class](./ko-template.cls), and [bibliography](./references.bib).

The ZIP is stored in this directory as `KO-LaTeX-Article-Template-APA-20261119.zip` and contains the files listed under [Release Contents](#release-contents), including this README. It excludes build outputs and local QA reports.

Extract the entire ZIP before compiling; keep the `.tex`, class, bibliography, and `figures/` directory together.

## Compile

Run from this directory. Use XeLaTeX or LuaLaTeX with **Biber** and the `biblatex-apa` package (APA 7), not BibTeX or pdfLaTeX:

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
# Alternatively:
latexmk -lualatex -interaction=nonstopmode -halt-on-error LaTex-Article-template-KO.tex
```

Without latexmk, run `xelatex`, `biber`, `xelatex`, `xelatex` on the document basename, omitting `.tex` for Biber. Substitute `lualatex` for LuaLaTeX. In Overleaf, select the main `.tex` file and one of these engines.

Use a current full TeX Live or MiKTeX installation. Required packages include iftex, etoolbox, fontspec, unicode-math, biblatex, biblatex-apa, csquotes, geometry, graphicx, xcolor, eso-pic, lineno, needspace, enumitem, array, tabularx, booktabs, caption, amsmath, hyperref, xeCJK (XeLaTeX), and luatexja-fontspec (LuaLaTeX). TeX Gyre and Fandol fonts are supplied by TeX distributions, not by this ZIP.

### Fonts

The class prefers Times New Roman, Arial, and Courier New. If a font is unavailable, it warns and selects TeX Gyre Termes, Heros, or Cursor, respectively. To select all portable fonts explicitly:

```latex
\documentclass[portablefonts]{ko-template}
```

Substitutions can change line wrapping and pagination; use Microsoft fonts for the closest Word-layout match. No Microsoft font files are redistributed. Chinese names use Fandol Song; rare characters and other writing systems may need additional fonts configured by the author.

## Writing the Manuscript

Write paragraphs directly, separated by blank lines. No `\KOParagraph{...}` wrapper is needed. The class owns indentation, spacing, typography, and manuscript line numbering. `\normalsize` is formally defined as 10.5 pt with a 15.6 pt baseline; `\small` is 9/12 pt and `\footnotesize` is 8/10 pt. Returning from a list, caption, or smaller-font group restores the correct body size.

The default remains single-column. `\KOEndCover` starts the manuscript on the next page, without a blank separator. Only the cover logo is shown; the author's manuscript has no publisher copyright artwork or Year placeholder. Optional compatibility modes are available:

```latex
\documentclass[legacydecor,blankseparator]{ko-template}
```

`legacydecor` restores the old header/footer artwork on the cover and first manuscript page only; it is not a full publication layout. `blankseparator` restores the blank second page. These options are independent and may be combined with `portablefonts`. The explicit legacy `\KOBlankPage` command still inserts a blank page when called. Footer artwork is now named `figures/KO-footer.jpg`; update any custom reference to the old `KO-footnote.jpg` filename. No copyright information needs to be filled in by authors.

Example guidance uses the plain `\KONote{...}` command rather than yellow highlighting. `\KOHighlight` and `\KOCoverHighlight` remain compatible command names, but render without soul or a yellow background.

Fill in the full correspondence address, email and telephone, main-text and abstract word counts, and figure/table totals. ORCID is optional, but recommended. `\KORunningTitle{...}` accepts plain text and warns above 60 characters including spaces. Counts are author-supplied, not automatic.

Revised submission artwork requirements: line art 800 dpi; combination artwork 600 dpi; halftone 300 dpi; TIF or JPG in RGB, not CMYK; no 72 dpi web-quality images. For direct LaTeX inclusion, use JPG, PNG, or PDF; convert a TIF while retaining the original submission artwork. Missing template images produce a class error requesting the complete package when the image is used.

## Tables, Figures, and Equations

`KOTable` accepts an optional standard column specification. Omitting it preserves the original four-column layout. Use `X` for flexible-width columns; `>{...}`, `p{...}`, `l`, `c`, and `r` follow the usual array/tabularx rules. Include at least one `X` when using KOTable to fill the text width. For natural-width tables, standard `tabular` is also supported.

```latex
\begin{table}[htbp]
  \caption{A three-column example.}
  \label{tab:results}
  \begin{KOTable}[@{}XXX@{}]
    Method & Score & Time \\
    \hline
    Baseline & 0.75 & 10 \\
    \hline
  \end{KOTable}
\end{table}
```

For two columns use `[@{}XX@{}]`; for five use `[@{}*{5}{X}@{}]`, and similarly for more columns. KOTable supplies an initial horizontal rule; authors supply row separators and the bottom rule. Standard `tabularx` is available when more control is needed.

Use standard floats and put `\label` **after** `\caption`:

```latex
\begin{figure}[htbp]
  \centering
  \KOIncludeGraphics[width=\linewidth]{figures/Fig. 1. Figure title.jpg}
  \caption{A figure caption that can wrap across multiple lines.}
  \label{fig:example}
\end{figure}
See Fig.~\ref{fig:example} and Table~\ref{tab:results}.
```

The class supplies 9/12 pt captions, bold labels, justified figure captions below images, and centered bold table captions above tables. Captions wrap within the available width. LaTeX may move floats according to `[htbp]`; do not manually type a figure/table number into the caption.

```latex
\begin{equation}
  a = b + c.\label{eq:sum}
\end{equation}
See Eqn.~\eqref{eq:sum}.
```

The amsmath `equation`, `align`, `gather`, and `multline` environments support automatic numbering and `\label`/`\eqref`. Use their starred variants for unnumbered displays. Recompile to resolve references (latexmk handles this automatically).

Legacy `\KOEquation{math}{number}`, `\KOFigureImage`, `\KOFigureCaption`, and `\KOTableCaption` remain available for old manuscripts. The legacy equation and caption helpers retain manual numbering and do not step the standard counters; use the standard environments for new work. Legacy table captions now wrap instead of overflowing a single-line box.

## References

`references.bib` contains the two original published sample references and **14 fictitious compilation examples**, with keys beginning `koexample-`. Every fictitious title explicitly says it is a compilation-only example; one uses a Chinese title. Two clearly labeled notes in the manuscript cite all 14 examples, including deliberately shuffled citation keys. These are formatting fixtures, **not evidence for manuscript claims**. Remove both compilation notes and all `koexample-*` entries before submitting a real paper. No invented DOI is supplied; the website fixture uses `example.org`.

The examples cover 1, 2, 3, 4, 6, 7, and 8 authors, name prefixes/suffixes, hyphenated initials, accented/compound names, institutional authors, Chinese names, and article/book/chapter/patent/website entries. All `koexample-*` entries are explicitly fictitious compilation examples and must be removed before real submission.

APA 7 formatting is provided by the standard `biblatex-apa` package; no custom `.bst`, `.bbx`, or `.cbx` file is needed. The class loads it with Biber, APA sorting, sorted multi-citations, and the required `csquotes` support.

Use `\parencite{keyC,keyA,keyB}` for multiple works in one parenthesis; APA sorting orders works and separates them with semicolons. APA 7 in-text citations use `&` between two authors and `et al.` for three or more. The reference list prints up to 20 authors in full; entries with 21 or more follow APA 7's first-19, ellipsis, final-author rule. `biblatex-apa` formats journal articles, books, chapters, patents, and websites consistently.

| Type | Fields in output order |
| --- | --- |
| `article` | `author`, `title`, `journaltitle`, `date`/`year`, `volume`, `pages`, `doi` |
| `book` | `author` (or `editor`), `title`, optional `edition`, `publisher`, `location`, `date`/`year` |
| `incollection` / `inbook` | `author`, `title`, `editor`, `booktitle`, `pages`, `publisher`, `location`, `date`/`year` |
| `patent` | inventor in `author`, assignee in `holder`, `title`, country in `location`, optional `type`, `number`, full `date` |
| `online` | `author`, `title`, `date`/`year`, `url`, `urldate` |

Use ISO dates such as `date={2000-08-08}` and a bare DOI (not a DOI URL). APA 7 only prints retrieval dates for sources designed to change over time; `biblatex-apa` applies that rule.

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
LaTex-Article-template-KO.tex
LaTex-Article-template-KO.pdf
ko-template.cls
references.bib
Microsoft-Word-Article-template-KO.docx
figures/KO-header.png
figures/KO-footer.jpg
figures/Fig. 1. Figure title.jpg
tests/references-qa.bib
tests/references-qa.tex
tests/portable-qa.tex
tests/missing-font.tex
tests/missing-image.tex
tests/running-title.tex
tests/layout-qa.tex
tests/legacy-layout.tex
tests/run_qa.py
```

No fonts, local QA reports, intermediate build files, caches, or nested ZIP are included. Reproducible test sources remain included. The preview uses XeLaTeX and the available Microsoft fonts; the Word template is unmodified.

## Validation

With Python 3, Poppler (`pdftotext`), and TeX tools on PATH:

```bash
python tests/run_qa.py
```

This compiles with both engines and checks APA citation sorting, two-author and three-plus-author in-text formatting, APA reference entries, and international/institutional names. Outputs stay in ignored `build/`.

The APA sample has been compiled with XeLaTeX and Biber. See the sample PDF and run the validation script for local checks. Linux/macOS and Overleaf have not been tested.
