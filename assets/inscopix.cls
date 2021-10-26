% A template for Inscopix documents
%
% Created by Srinvias Gorur-Shandilya
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inscopix}

\RequirePackage[english]{babel}

\RequirePackage{calc}
\RequirePackage{etoolbox}
\RequirePackage{regexpatch}
\RequirePackage{ifxetex,ifluatex}

\newif\if@reqslineno
\DeclareOption{lineno}{\@reqslinenotrue}

%% Linespacing.
\newif\if@onehalfspacing
\newif\if@doublespacing
\DeclareOption{onehalfspacing}{\@onehalfspacingtrue}
\DeclareOption{doublespacing}{\@doublespacingtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass{extarticle}

\RequirePackage{amsmath}
\RequirePackage{mdframed}

\RequirePackage{lineno}
\if@reqslineno\linenumbers\fi

% fonts 
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{stix}
\RequirePackage[default]{opensans}
\renewcommand{\ttdefault}{lmtt}

\linespread{1.2}
\if@onehalfspacing\linespread{1.6}\fi
\if@doublespacing\linespread{2.0}\fi


% colors
\RequirePackage{graphicx,xcolor}
\definecolor{inscopixBlue}{HTML}{347ab4}
\definecolor{inscopixGray}{HTML}{6D6E70}
\definecolor{inscopixGreen}{HTML}{83b53e}

\RequirePackage{booktabs}
\RequirePackage{authblk}

\RequirePackage[left=2cm,%
                marginparwidth=4cm,%
                marginparsep=0.5cm,%
                right=2cm,%
                top=2cm,%
                bottom=2.5cm,%
                headheight=21pt,%
                headsep=2\baselineskip,%
                columnsep=2em,%
                letterpaper]{geometry}%
\RequirePackage{changepage}

%
% headers and footers
%
\usepackage{graphicx}
\usepackage{fancyhdr}
\pagestyle{fancy}
\usepackage{xcolor}
\usepackage{lipsum}

% inscopix logo in header on every page
\rhead{\includegraphics[width=2cm]{logo.pdf}}

% Footers
\preto{\footrule}{\color{inscopixGray}}
\renewcommand{\headrulewidth}{.5pt}
\renewcommand{\footrulewidth}{.5pt}


% section/subsection/paragraph set-up
\setcounter{secnumdepth}{0}
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{inscopixBlue}\Large\bfseries}
  {\thesection}{}{#1}[]
\titleformat{\subsection}
  {\color{inscopixGreen} \large\bfseries}
  {\thesubsection}{}{#1}[]
\titleformat{\subsubsection}
  {\large}
  {\thesubsubsection}{}{#1}[]    
\titleformat{\paragraph}
  {\color{inscopixBlue}\large}
  {\theparagraph}{}{#1}[] 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{0pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{0pt}
  
\RequirePackage{enumitem}




\reversemarginpar


\renewcommand{\Authfont}{\bfseries\large\raggedright}

\renewcommand{\maketitle}{%
  \vskip36pt%
  {\color{inscopixBlue}\raggedright\bfseries\fontsize{22}{27}\selectfont \@title\par}%
  \vskip16pt
  {\@author\par}
  \vskip8pt
}

\endinput