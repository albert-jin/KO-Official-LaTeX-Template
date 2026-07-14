\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ko-template}[2026/07/14 Knowledge Organization Word-template replacement]

\LoadClass[10pt,a4paper]{article}

\RequirePackage{iftex}
\ifPDFTeX
  \ClassError{ko-template}{This template requires XeLaTeX or LuaLaTeX}{Compile with xelatex or lualatex.}
\fi

\RequirePackage[a4paper,left=54pt,right=54pt,top=72pt,bottom=72pt]{geometry}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{soul}
\RequirePackage{eso-pic}
\RequirePackage{lineno}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{hyperref}
\RequirePackage[
  backend=biber,
  style=authoryear,
  giveninits=true,
  maxcitenames=2,
  maxbibnames=99,
  uniquename=init,
  dashed=false
]{biblatex}

\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
\setmathfont{TeX Gyre Termes Math}

\definecolor{KOGray}{HTML}{A6A6A6}
\definecolor{KODarkGray}{HTML}{767171}
\definecolor{KOLink}{HTML}{0070C0}
\sethlcolor{yellow}

\hypersetup{
  colorlinks=true,
  linkcolor=KOLink,
  citecolor=black,
  urlcolor=KOLink
}
\urlstyle{same}

\pagestyle{empty}
\newcommand{\KONormalParagraphStyle}{%
  \fontsize{10.5}{15.6}\selectfont
  \setlength{\parindent}{21pt}%
  \setlength{\parskip}{0pt}%
}
\setlength{\parindent}{21pt}
\setlength{\parskip}{0pt}
\setlength{\tabcolsep}{6pt}
\renewcommand{\arraystretch}{1.08}
\AtBeginDocument{\KONormalParagraphStyle}

\setlength\linenumbersep{18pt}
\renewcommand\linenumberfont{\normalfont\fontsize{10.5}{15.6}\selectfont}

\newcommand{\KOHeaderImage}{figures/KO-header.png}
\newcommand{\KOFooterImage}{figures/KO-footnote.jpg}
\newcommand{\KOPlaceImage}[3]{%
  \put(\LenToUnit{#1},\LenToUnit{#2}){\includegraphics[width=#3]{\KOHeaderImage}}%
}
\newcommand{\KOPlaceFooter}[2]{%
  \put(\LenToUnit{#1},\LenToUnit{34pt}){\includegraphics[width=#2]{\KOFooterImage}}%
}
\newcommand{\KOFrontDecor}{%
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{54pt},\LenToUnit{771pt}){\includegraphics[width=1.974in]{\KOHeaderImage}}%
    \put(\LenToUnit{54pt},\LenToUnit{34pt}){\includegraphics[width=5.599in]{\KOFooterImage}}%
  }%
}
\newcommand{\KOBodyFirstDecor}{%
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{54pt},\LenToUnit{754pt}){\includegraphics[width=1.974in]{\KOHeaderImage}}%
    \put(\LenToUnit{54pt},\LenToUnit{34pt}){\includegraphics[width=5.599in]{\KOFooterImage}}%
  }%
}

\newcommand{\KOBlankPage}{%
  \clearpage
  \thispagestyle{empty}\null
  \clearpage
}

\newcommand{\KOStartManuscript}{%
  \KOBodyFirstDecor
  \vspace*{9pt}%
  \KONormalParagraphStyle
  \setcounter{linenumber}{1}%
  \linenumbers
}

\newcommand{\KOCoverPaperType}[1]{%
  \noindent{\itshape\fontsize{10.5}{14.4}\selectfont #1}\par
}
\newcommand{\KOCoverTitle}[1]{%
  \vspace{26pt}%
  \noindent{\bfseries\fontsize{18}{21.6}\selectfont #1}\par
  \vspace{23pt}%
}
\newcommand{\KOCoverAuthors}[1]{%
  \noindent{\fontsize{10.5}{14.4}\selectfont #1}\par
  \vspace{21pt}%
}
\newcommand{\KOCoverAffiliation}[1]{%
  \noindent{\fontsize{10.5}{14.4}\selectfont #1}\par
}
\newcommand{\KOCoverGap}{\vspace{22pt}}
\newcommand{\KOHighlight}[1]{\begingroup\sethlcolor{yellow}\hl{#1}\endgroup}
\newcommand{\KOCoverHighlight}[1]{%
  \noindent{\fontsize{9}{14.4}\selectfont\KOHighlight{#1}}\par
}
\newcommand{\KOOrcidLine}[1]{%
  \noindent{\fontsize{10.5}{14.4}\selectfont #1}\par
}

\newcommand{\KOManuscriptTitle}[1]{%
  \noindent{\bfseries\fontsize{18}{21.6}\selectfont #1}\par
  \vspace{18pt}%
}
\newcommand{\KONoIndent}[1]{\par\KONormalParagraphStyle\noindent #1\par}
\newcommand{\KOParagraph}[1]{\par\KONormalParagraphStyle #1\par}
\newcommand{\KOLineBlank}{\par\noindent\mbox{}\par}

\newcommand{\KOSection}[1]{%
  \par\vspace{14pt}%
  \noindent{\bfseries\fontsize{12}{14.4}\selectfont #1}\par
  \vspace{13pt}%
}
\newcommand{\KOSubsection}[1]{%
  \par\vspace{10pt}%
  \noindent{\itshape\fontsize{11}{14.4}\selectfont #1}\par
  \vspace{8pt}%
}
\newcommand{\KOSubsubsection}[1]{%
  \par\vspace{8pt}%
  \noindent{\itshape\fontsize{11}{14.4}\selectfont #1}\par
  \vspace{6pt}%
}
\newcommand{\KOFourthHeading}[1]{%
  \par\noindent #1\par
}
\newcommand{\KOGray}[1]{\textcolor{KOGray}{#1}}
\newcommand{\KODarkGray}[1]{\textcolor{KODarkGray}{#1}}
\newcommand{\KOLink}[2]{\href{#2}{#1}}

\newcommand{\KOFigureImage}[1]{%
  \par\vspace{2pt}%
  \noindent\makebox[\linewidth][c]{\includegraphics[width=6.149in]{#1}}%
  \par\vspace{-4pt}%
}
\newcommand{\KOFigureCaption}[1]{%
  \par\noindent{\fontsize{9}{12}\selectfont #1}\par
}
\newcommand{\KOTableCaption}[1]{%
  \par\vspace{10pt}%
  \noindent\makebox[\linewidth][c]{\bfseries\fontsize{9}{12}\selectfont #1}\par
  \vspace{13pt}%
}
\newenvironment{KOTable}{%
  \par\begingroup
  \fontsize{10.5}{12.5}\selectfont
  \renewcommand{\arraystretch}{1.0}%
  \setlength{\arrayrulewidth}{0.4pt}%
  \noindent\tabularx{\linewidth}{@{}X>{\centering\arraybackslash}X>{\centering\arraybackslash}X>{\centering\arraybackslash}X@{}}%
  \hline
}{%
  \endtabularx\par
  \endgroup
}
\newcommand{\KOEquation}[2]{%
  \par\noindent\makebox[\linewidth]{\hfill $#1$\hfill\makebox[2.2em][r]{(#2)}}\par
}

\newlist{KOItemize}{itemize}{1}
\setlist[KOItemize]{label=\textbullet,leftmargin=42pt,labelsep=18pt,itemsep=0pt,topsep=0pt,parsep=0pt,partopsep=0pt}

\renewcommand*{\bibinitperiod}{}
\renewcommand*{\bibinitdelim}{}
\DeclareNameFormat{koauthor}{%
  \nameparts{#1}%
  \namepartfamily
  \ifblank{\namepartgiveni}{}{\space\namepartgiveni}%
  \ifthenelse{\value{listcount}<\value{liststop}}{\addcomma\space}{}%
}
\DeclareNameAlias{author}{koauthor}
\DeclareNameAlias{editor}{koauthor}
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[article]{journaltitle}{#1}
\DeclareFieldFormat{volume}{#1}
\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat{doi}{\url{https://doi.org/#1}}
\DeclareDelimFormat{nameyeardelim}{\addcomma\space}
\DeclareBibliographyDriver{article}{%
  \printnames{author}\addperiod\space
  \printfield{title}\addperiod\space
  \printfield{journaltitle}\addperiod\space
  \printfield{year}\addsemicolon\space
  \printfield{volume}%
  \iffieldundef{pages}{}{\addcolon\space\printfield{pages}}%
  \addperiod\space
  \printfield{doi}%
  \finentry
}
\DeclareBibliographyDriver{online}{%
  \printnames{author}\addperiod\space
  \printfield{title}\addperiod\space
  \printfield{year}\addperiod\space
  Available at: \printfield{url}%
  \finentry
}
\defbibheading{none}{}
\setlength{\bibitemsep}{0pt}
\setlength{\bibhang}{21pt}

\endinput
