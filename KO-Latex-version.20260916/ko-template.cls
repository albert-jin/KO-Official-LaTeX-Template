\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ko-template}[2026/09/16 v1.1 Knowledge Organization Article Template]

\newif\ifKOportablefonts
\newif\ifKOlegacydecor
\newif\ifKOblankseparator
\DeclareOption{portablefonts}{\KOportablefontstrue}
\DeclareOption{legacydecor}{\KOlegacydecortrue}
\DeclareOption{blankseparator}{\KOblankseparatortrue}
\ProcessOptions\relax

\LoadClass[10pt,a4paper]{article}

\RequirePackage{iftex}
\RequirePackage{etoolbox}
\ifXeTeX
\else
  \ifLuaTeX
  \else
    \ClassError{ko-template}{Unsupported engine: use XeLaTeX or LuaLaTeX}{Select XeLaTeX or LuaLaTeX in your editor, then compile again.}
    \expandafter\expandafter\expandafter\endinput
  \fi
\fi

\RequirePackage[a4paper,left=54pt,right=54pt,top=72pt,bottom=72pt]{geometry}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{eso-pic}
\RequirePackage{lineno}
\RequirePackage{needspace}
\RequirePackage{enumitem}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage[
  backend=biber,
  style=authoryear,
  sorting=nyt,
  sortcites=true,
  giveninits=true,
  dateabbrev=false,
  useprefix=true,
  maxcitenames=2,
  mincitenames=1,
  uniquelist=false,
  maxbibnames=6,
  minbibnames=6,
  uniquename=init,
  dashed=false
]{biblatex}
\RequirePackage{hyperref}

\newcommand{\KOSelectFont}[3]{%
  \ifKOportablefonts
    #1{#3}%
  \else
    \IfFontExistsTF{#2}{#1{#2}}{%
      \ClassWarningNoLine{ko-template}{Font #2 unavailable; using #3}%
      #1{#3}}%
  \fi
}
\KOSelectFont{\setmainfont}{Times New Roman}{TeX Gyre Termes}
\KOSelectFont{\setsansfont}{Arial}{TeX Gyre Heros}
\KOSelectFont{\setmonofont}{Courier New}{TeX Gyre Cursor}
\setmathfont{TeX Gyre Termes Math}

% CJK glyph coverage for author names; Latin text keeps the selected fonts.
\ifXeTeX
  \RequirePackage{xeCJK}
  \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
\else
  \RequirePackage{luatexja-fontspec}
  \setmainjfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
\fi

\definecolor{KOGray}{HTML}{A6A6A6}
\definecolor{KODarkGray}{HTML}{767171}
\definecolor{KOLink}{HTML}{0070C0}

\hypersetup{
  colorlinks=true,
  linkcolor=KOLink,
  citecolor=black,
  urlcolor=KOLink
}
\urlstyle{same}

\pagestyle{empty}
% Make size switches restore the KO sizes, including after floats and lists.
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{10.5}{15.6}%
  \abovedisplayskip 10pt plus 2pt minus 5pt
  \abovedisplayshortskip 0pt plus 3pt
  \belowdisplayshortskip 6pt plus 3pt minus 3pt
  \belowdisplayskip\abovedisplayskip
  \let\@listi\@listI
}
\renewcommand{\small}{%
  \@setfontsize\small{9}{12}%
  \abovedisplayskip 8pt plus 2pt minus 4pt
  \abovedisplayshortskip 0pt plus 2pt
  \belowdisplayshortskip 4pt plus 2pt minus 2pt
  \belowdisplayskip\abovedisplayskip
}
\renewcommand{\footnotesize}{%
  \@setfontsize\footnotesize{8}{10}%
  \abovedisplayskip 6pt plus 2pt minus 3pt
  \abovedisplayshortskip 0pt plus 1pt
  \belowdisplayshortskip 3pt plus 1pt minus 2pt
  \belowdisplayskip\abovedisplayskip
}
\normalsize
\DeclareCaptionFont{ko}{\fontsize{9}{12}\selectfont}
\captionsetup{font=ko,labelsep=period}
\captionsetup[figure]{name=Fig.,labelfont=bf,textfont=normalfont,
  justification=justified,singlelinecheck=false,position=bottom,skip=6pt}
\captionsetup[table]{labelfont=bf,textfont=bf,
  justification=centering,singlelinecheck=false,position=top,skip=8pt}
\newcommand{\KONormalParagraphStyle}{%
  \normalsize
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
\newcommand{\KOFooterImage}{figures/KO-footer.jpg}
\newcommand{\KOIncludeGraphics}[2][]{%
  \IfFileExists{#2}{\includegraphics[#1]{#2}}{%
    \ClassError{ko-template}{Missing template image: #2}{Download and extract the complete KO template ZIP. Keep the figures folder beside the main .tex file.}}%
}
\newcommand{\KOPlaceImage}[3]{%
  \put(\LenToUnit{#1},\LenToUnit{#2}){\KOIncludeGraphics[width=#3]{\KOHeaderImage}}%
}
\newcommand{\KOPlaceFooter}[2]{%
  \put(\LenToUnit{#1},\LenToUnit{34pt}){\KOIncludeGraphics[width=#2]{\KOFooterImage}}%
}
\newcommand{\KOFrontDecor}{%
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{54pt},\LenToUnit{771pt}){\KOIncludeGraphics[width=1.974in]{\KOHeaderImage}}%
    \ifKOlegacydecor
      \put(\LenToUnit{54pt},\LenToUnit{34pt}){\KOIncludeGraphics[width=5.599in]{\KOFooterImage}}%
    \fi
  }%
}
\newcommand{\KOBodyFirstDecor}{%
  \ifKOlegacydecor
  \AddToShipoutPictureFG*{%
    \put(\LenToUnit{54pt},\LenToUnit{754pt}){\KOIncludeGraphics[width=1.974in]{\KOHeaderImage}}%
    \put(\LenToUnit{54pt},\LenToUnit{34pt}){\KOIncludeGraphics[width=5.599in]{\KOFooterImage}}%
  }%
  \fi
}

\newcommand{\KOBlankPage}{%
  \clearpage
  \thispagestyle{empty}\null
  \clearpage
}
\newcommand{\KOEndCover}{%
  \ifKOblankseparator\KOBlankPage\else\clearpage\fi
}

\newcommand{\KOStartManuscript}{%
  \KOBodyFirstDecor
  \ifKOlegacydecor\vspace*{9pt}\fi
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
\newcommand{\KOCoverField}[2]{%
  \par\noindent{\fontsize{10.5}{14.4}\selectfont\textbf{#1:} #2\par}%
}
\ExplSyntaxOn
\NewDocumentCommand{\KORunningTitle}{m}{
  \int_compare:nNnT {\str_count:n {#1}} > {60}
    {\ClassWarningNoLine{ko-template}{Running~title~exceeds~60~characters~(including~spaces)}}
  \KOCoverField{Running~title}{#1}
}
\ExplSyntaxOff
% Compatibility alias: inline emphasis no longer depends on soul.
\newcommand{\KOHighlight}[1]{{\color{KODarkGray}#1}}
\newcommand{\KONote}[1]{%
  \par\addvspace{6pt}%
  {\small\color{KODarkGray}\noindent\textbf{Note:} #1\par}%
  \addvspace{6pt}%
}
\newcommand{\KOCoverHighlight}[1]{%
  \noindent{\fontsize{9}{14.4}\selectfont\bfseries #1}\par
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
  \par\Needspace{5\baselineskip}%
  \par\vspace{14pt}%
  \noindent{\bfseries\fontsize{12}{14.4}\selectfont #1}\par
  \vspace{13pt}%
}
\newcommand{\KOSubsection}[1]{%
  \par\Needspace{4\baselineskip}%
  \par\vspace{10pt}%
  \noindent{\itshape\fontsize{11}{14.4}\selectfont #1}\par
  \vspace{8pt}%
}
\newcommand{\KOSubsubsection}[1]{%
  \par\Needspace{3\baselineskip}%
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
  \noindent\makebox[\linewidth][c]{\KOIncludeGraphics[width=6.149in]{#1}}%
  \par\vspace{-4pt}%
}
\newcommand{\KOFigureCaption}[1]{%
  \par\noindent{\fontsize{9}{12}\selectfont #1}\par
}
\newcommand{\KOTableCaption}[1]{%
  \par\vspace{10pt}%
  {\centering\bfseries\fontsize{9}{12}\selectfont #1\par}%
  \vspace{13pt}%
}
\newenvironment{KOTable}[1][@{}X>{\centering\arraybackslash}X>{\centering\arraybackslash}X>{\centering\arraybackslash}X@{}]{%
  \par\begingroup
  \fontsize{10.5}{12.5}\selectfont
  \renewcommand{\arraystretch}{1.0}%
  \setlength{\arrayrulewidth}{0.4pt}%
  \noindent\tabularx{\linewidth}{#1}%
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
\renewcommand*{\bibinithyphendelim}{\mbox{-}}
\DeclareNameFormat{koauthor}{%
  \nameparts{#1}%
  \ifnumgreater{\value{listcount}}{1}{\addcomma\space}{}%
  \ifdefvoid\namepartprefix{}{\mkbibnameprefix{\namepartprefix}\space}%
  \mkbibnamefamily{\namepartfamily}%
  \ifdefvoid\namepartgiveni{}{\space\mkbibnamegiven{\namepartgiveni}}%
  \ifdefvoid\namepartsuffix{}{\space\mkbibnamesuffix{\namepartsuffix}\isdot}%
  \usebibmacro{name:andothers}%
}
\DeclareNameAlias{author}{koauthor}
\DeclareNameAlias{editor}{koauthor}
\DeclareNameAlias{holder}{koauthor}
\AtBeginBibliography{%
  \renewcommand*{\finalandcomma}{}%
  \DeclareDelimFormat{andothersdelim}{\addcomma\space}%
}
\DeclareFieldFormat[article,book,incollection,inbook,patent,online]{title}{#1}
\DeclareFieldFormat[incollection,inbook]{booktitle}{#1}
\DeclareFieldFormat[article]{journaltitle}{#1}
\DeclareFieldFormat{volume}{#1}
\DeclareFieldFormat{pages}{#1}
\DeclareFieldFormat{doi}{\url{https://doi.org/#1}}
\DeclareFieldFormat{url}{\url{#1}}
\DeclareFieldFormat[patent]{number}{#1}
\DeclareDelimFormat{nameyeardelim}{\addcomma\space}
\DeclareDelimFormat{multicitedelim}{\addsemicolon\space}
\renewcommand*{\multicitedelim}{\addsemicolon\space}
% Explicit day-month-year dates also work when only a year is supplied.
\newbibmacro*{ko:date}[1]{%
  \iffieldundef{#1year}{}{\printtext{%
    \iffieldundef{#1day}{}{\stripzeros{\thefield{#1day}}\space}%
    \iffieldundef{#1month}{}{\mkbibmonth{\thefield{#1month}}\space}%
    \thefield{#1year}}}%
}
\newbibmacro*{ko:publisher}{%
  \printlist{publisher}\setunit*{\addcolon\space}%
  \printlist{location}\newunit
  \printfield{year}%
}
\newbibmacro*{ko:title}{%
  \printfield{title}\setunit*{\addcolon\space}\printfield{subtitle}%
}
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}\usebibmacro{begentry}%
  \printnames{author}\newunit
  \usebibmacro{ko:title}\newunit
  \printfield{journaltitle}\newunit
  \printfield{year}\setunit*{\addsemicolon\space}%
  \printfield{volume}%
  \setunit*{\addcolon\space}\printfield{pages}\newunit
  \printfield{doi}%
  \usebibmacro{finentry}%
}
\DeclareBibliographyDriver{book}{%
  \usebibmacro{bibindex}\usebibmacro{begentry}%
  \ifnameundef{author}{\printnames{editor}\setunit{\addspace}%
    \usebibmacro{editorstrg}}{\printnames{author}}\newunit
  \usebibmacro{ko:title}\newunit
  \printfield{edition}\newunit
  \usebibmacro{ko:publisher}\usebibmacro{finentry}%
}
\DeclareBibliographyDriver{incollection}{%
  \usebibmacro{bibindex}\usebibmacro{begentry}%
  \printnames{author}\newunit
  \usebibmacro{ko:title}\newunit
  \printtext{In:}\setunit{\addspace}%
  \ifnameundef{editor}{}{\printnames{editor}\setunit{\addspace}%
    \usebibmacro{editorstrg}\newunit}%
  \printfield{booktitle}\setunit*{\addcolon\space}\printfield{booksubtitle}\newunit
  \iffieldundef{pages}{}{\printtext{\bibstring{pages}\addspace\printfield{pages}}\newunit}%
  \usebibmacro{ko:publisher}\usebibmacro{finentry}%
}
\DeclareBibliographyAlias{inbook}{incollection}
\DeclareBibliographyDriver{patent}{%
  \usebibmacro{bibindex}\usebibmacro{begentry}%
  \printnames{author}\newunit
  \ifnameundef{holder}{}{\printnames{holder}\setunit{\addcomma\space}%
    \printtext{assignee}\newunit}%
  \usebibmacro{ko:title}\newunit
  \printlist{location}\setunit*{\addspace}%
  \printfield{type}\setunit*{\addspace}\printfield{number}\newunit
  \usebibmacro{ko:date}{}\usebibmacro{finentry}%
}
\DeclareBibliographyDriver{online}{%
  \usebibmacro{bibindex}\usebibmacro{begentry}%
  \printnames{author}\newunit
  \usebibmacro{ko:title}\newunit
  \printfield{year}\newunit
  \iffieldundef{url}{}{\printtext{Available at:}\setunit{\addspace}\printfield{url}}%
  \iffieldundef{urlyear}{}{\setunit{\addspace}%
    \printtext[parens]{Accessed:\space\usebibmacro{ko:date}{url}}}%
  \usebibmacro{finentry}%
}
\defbibheading{none}{}
\setlength{\bibitemsep}{0pt}
\setlength{\bibhang}{21pt}

\endinput
