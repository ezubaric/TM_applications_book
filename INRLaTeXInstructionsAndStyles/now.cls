%% now.cls v20130725
%% (c) 2013 Neal Parikh (Stanford University)
%% 
%% Based on earlier NOW style files by S. Kumar,
%% J. Sebastian, T. Hoekwater, and B.V. Elvenkind

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{now}
              [2013/08/01 v1.0
               NOW document class]

% use 'book' as a base class
\PassOptionsToClass{letterpaper,11pt,twoside,onecolumn,final}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}

% only list chapters and sections in contents
\setcounter{tocdepth}{1}

% override some font size options
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xipt\@xivpt
   \abovedisplayskip 9\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 5\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI
   }
\def\@xvpt{15}
\def\@xxviipt{27}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xipt{13}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xvpt{19}}
\renewcommand\Huge{\@setfontsize\Huge\@xxviipt{27}}

\setlength\parskip{0pt}

% make table of contents sans serif
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \sffamily\slshape\contentsname}{\sffamily\slshape\contentsname}}%
    {\sffamily \@starttoc{toc}}%
    \if@restonecol\twocolumn\fi
    }

% define custom chapter titles
\def\CNfont{\sffamily\Huge\bfseries\centering}%
\def\CTfont{\sffamily\LARGE\bfseries\centering\boldmath}%
\def\@makechapterhead#1{\vbox to 19pc{%
  \vspace*{15\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        {\CNfont\thechapter\par}\addvspace{10pt}\nobreak
        \noindent\hrule\@width1\columnwidth\@height1\p@
        \vskip 14\p@
      \fi
    \fi
    \interlinepenalty\@M
    {\CTfont#1\vphantom{y}\par}\addvspace{10pt}\nobreak
    \noindent\hrule\@width1\columnwidth\@height1\p@
    \vskip 14pc
  }}}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
\vbox to 16pc{%
  \vspace*{55\p@}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    {\CTfont#1\vphantom{y}\par}\addvspace{8pt}\nobreak
    \noindent\hrule\@width1\columnwidth\@height1\p@
  }}}

%% page headers
\RequirePackage{fancyhdr}

% chapter openings
\fancypagestyle{plain}{
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\sffamily\thepage}
}

% regular pages
\pagestyle{fancy}
\fancypagestyle{headings}{
\fancyhead{}
\fancyheadoffset{0pt}
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[RE]{\sffamily\slshape\nouppercase \leftmark}
\fancyhead[LE,RO]{\sffamily\thepage}
\fancyhead[LO]{\sffamily\slshape\nouppercase \rightmark}
\fancyfoot[C]{}
}

% make parts use \sffamily and empty pagestyle
% note: other section types redefined using titlesec
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \thispagestyle{empty}
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \sffamily \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries \sffamily #1\par}%
    \@endpart}

% section title fonts
\RequirePackage{titlesec}

\def\sectionfont{\fontsize{12}{14}\selectfont\sffamily\bfseries\boldmath}
\def\subsectionfont{\sffamily\large\bfseries\boldmath}
\def\paragraphfont{\sffamily\normalsize\bfseries\boldmath}

\titleformat*{\section}{\sectionfont}
\titleformat*{\subsection}{\subsectionfont}
\titleformat*{\subsubsection}{\paragraphfont}
\titleformat*{\paragraph}{\paragraphfont}
\titleformat*{\subparagraph}{\paragraphfont}

% small caption font
\RequirePackage[footnotesize,bf]{caption}

% appendices
\renewcommand\appendix{\par
  \if@openright \cleardoublepage \else \clearpage \fi
  \thispagestyle{empty}
  \addcontentsline{toc}{part}{Appendices}%
  \vspace*{\fill}
  \begin{flushright}
  {\huge\sffamily\bfseries Appendices}
  \end{flushright}
  \vspace*{\fill}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

% abstract environment
\newcommand\abstractname{Abstract}
\newenvironment{abstract}{%
      \thispagestyle{empty}
      \section*{\abstractname}%
      \if@openright \else \setcounter{page}{\@firstpage} \fi
      \sfcode`\.\@m}
    {\vfill\noindent
    \rule{\textwidth}{0.5pt}\\[1pt]
    {\footnotesize
    \raggedright
    \@copyrightowner. \emph{\@title}.  \@journaltitleprefix\
    \@journaltitle, vol.~\@volume, no.~\@issue, pp.~\@firstpage--\@lastpage,
    \@pubyear.\\
    DOI: \@doi.}
    \def\@noitemerr
    {\@latex@warning{Empty `theabstract' environment}}%
    \endlist}

% acknowledgments environment
\newcommand\acknowledgmentsname{Acknowledgments}
\newenvironment{acknowledgments}{%
      \chapter*{\acknowledgmentsname}%
      \@mkboth{\acknowledgmentsname}{\acknowledgmentsname}%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `theacknowledgments' environment}}%
      \endlist}

% acknowledgements environment
\newcommand\acknowledgementsname{Acknowledgements}
\newenvironment{acknowledgements}{%
      \chapter*{\acknowledgementsname}%
      \@mkboth{\acknowledgementsname}{\acknowledgementsname}%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `theacknowledgements' environment}}%
      \endlist}

% don't include headers on empty pages
\RequirePackage{emptypage}

% front matter
\input frontmatter.tex

% don't leave empty page before mainmatter for journal version
\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}}

% some default packages worth including
\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}

% bibliography style
\RequirePackage{natbib}
\renewcommand{\bibname}{References}
\renewcommand{\bibfont}{\small\interlinepenalty 10000\relax}
\setlength{\bibsep}{1ex}
\renewcommand\bibsection{%
    \markboth{\bibname}{\bibname}%
    \chapter*{\bibname}
    \addcontentsline{toc}{chapter}{\bibname}}

% theorem environments
\RequirePackage{amsthm}

% custom length changes below needed to ensure that lists
% contained in theorem and proof environments are properly
% indented as they should be; misalignment presumably due
% to some weird package conflict

\newtheoremstyle{now}
{}
{}
{\addtolength{\@totalleftmargin}{2.5em}}
{}
{\sffamily\bfseries}
{.}
{.5em}
{}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \addtolength{\@totalleftmargin}{2.5em}
  \addtolength{\linewidth}{-2.5em}
  \trivlist
  \item[\hskip\labelsep
        \itshape
        #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

\theoremstyle{now}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{remark}{Remark}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{example}{Example}[chapter]

% high-level typesetting style
\pagestyle{headings}
\sloppy
\flushbottom
\frenchspacing

% page geometry
\RequirePackage[vcentering,hcentering,dvips]{geometry}
\geometry{papersize={216mm,279mm},total={118mm,180mm}}
\hoffset5pt
\voffset31.5pt

\RequirePackage{hyperref}

\endinput
