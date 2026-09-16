# Validation - 2026-09-16

## Environment

- Windows, TeX Live 2026, Biber 2.21, latexmk 4.88.
- XeTeX 0.999998 and LuaHBTeX 1.24.0.
- Main preview: XeLaTeX, Microsoft fonts available; six A4 pages, including the intentional blank second page.

## Automated Results

`python tests/run_qa.py` completed all 13 build/diagnostic cases successfully:

| Case | XeLaTeX | LuaLaTeX |
| --- | --- | --- |
| Main manuscript + Biber | Pass | Pass |
| Reference fixtures + Biber | Pass | Pass |
| Explicit TeX Gyre portable-font variant + Biber | Pass | Pass |
| Unavailable font warns and falls back | Pass | Pass |
| Missing image produces the intended class error | Pass | Pass |
| Running title above 60 characters warns | Pass | Pass |

The thirteenth case confirms that pdfLaTeX is rejected with the explicit XeLaTeX/LuaLaTeX class error.

PDF-text assertions verify:

- One-, two-, three-, and four-author citations.
- A deliberately shuffled four-key `\parencite` outputs Alpha, Bravo, Charlie, Delta, with semicolons.
- All six authors remain; a seven-author entry ends after the sixth name with `et al.` and excludes the seventh.
- Journal article, book, chapter, patent, and website outputs, including all required fixture fields.
- Full patent date and website access date: `8 August 2000`.
- Prefixes (`de la`, `van`), suffix (`Jr.`), hyphenated initials (`J-P`), accents, corporate names, and Chinese names.
- Website without an author/publication date retains its title, URL, and access date without stray separators.
- New cover fields and optional/recommended ORCID text.

Final successful manuscript/reference build logs contain no missing-character messages, undefined citations/references, overfull boxes, or requests to rerun Biber. Expected errors in negative tests are intentional.

## Visual Review

Rendered and inspected the title page, all populated manuscript pages, and the reference QA page. Checked artwork, cover fields, line numbers, paragraph indentation, table/figure layout, hanging references, and text boundaries. Added heading-space checks to prevent the Funding heading being stranded at a page bottom. The existing normal-paragraph defaults remain; no paragraph wrappers are required.

## Scope and Limits

- The synthetic reference fixtures are not real sources and are excluded from the manuscript bibliography.
- This applies the supplied review requirements; it is not an independent certification of current journal policy.
- Windows builds were tested. Native Linux/macOS and Overleaf were not run; portable-font tests exercise the TeX-distributed alternatives locally.
- Font fallback can alter pagination. Rare CJK characters or scripts outside the configured fonts may require author font configuration.
- Running title length is checked for plain text. Word counts and figure/table totals are author-entered placeholders, not calculated.
- `\parencites` groups retain input order; use a single comma-separated `\parencite` list for automatic within-bracket sorting.
- The ZIP includes the PDF, original Word template, `.gitignore`, sources, artwork, README, this report, and test sources. Build outputs and fonts are excluded.
