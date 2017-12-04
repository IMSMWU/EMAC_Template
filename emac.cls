%% (Basic) EMAC-Submission Latex Template
%% 
%% provided by the Institute for Interactive Marketing and Social Media,
%% Vienna University of Economics and Business
%%
%% THIS TEMPLATE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED
%%
%% 2017 Christian Hotz-Behofsits <christian.hotz-behofsits@wu.ac.at>
%% Guideline: http://www.emac-2018.org/UserFiles/Guidelines_CompetitivePapers_EMAC2018.pdf

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emac}[2017/11/25 v0.1 LaTeX document class for articles submitted to EMAC]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

%% a4 12pt normal font 
\LoadClass[12pt,a4paper,oneside]{article}

%% section set font size to 12
%% one single line (\baselineskip) before and one line after major heading
\renewcommand\section{\@startsection {section}{1}{\z@}%
    {\baselineskip}%
    {\baselineskip}%
    {\normalfont\normalsize\bfseries}}
%% section: add period after number
\renewcommand{\thesection}{\arabic{section}.}

%% subsection: 12pt (normalsize) Times New Roman (normalfont)
%% newline before (\baselineskip) and just a break after (hotfix)
%% HOTFIX: used 0.0001 baselineskip for a simple linebreak
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
    {\baselineskip}%
    {0.001\baselineskip}%
    {\normalfont\normalsize\itshape}}

\renewcommand{\thesubsection}{\thesection\arabic{subsection}}

%% 2.5cm margins
\RequirePackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\RequirePackage{amsmath,enumerate,fancyhdr,url,graphicx,hyperref}

%% single spaced
\RequirePackage[singlespacing]{setspace}

%% left justified throughout
\RequirePackage[document]{ragged2e}

%% indent paragraphs
\setlength{\RaggedRightParindent}{\parindent}

%% avoid indent in tables and figures
\usepackage{etoolbox}
\AtBeginEnvironment{figure}{\setlength{\RaggedRightParindent}{0em}}
\AtBeginEnvironment{table}{\setlength{\RaggedRightParindent}{0em}}

%% Times New Roman + umlaute
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{newtxmath,newtxtext}

%% english apa style
%% natbib=true provides citep and citet backends
\usepackage[backend=biber,style=apa,natbib=true]{biblatex}
\DeclareLanguageMapping{english}{english-apa}

%% remove pdf-metainfo
\hypersetup{
    pdfauthor={},
    pdfcreator={},
    pdfproducer={}
}

\def\KEYWORDSname{{\bf Keywords\/}{\kern0.7pt}:\enskip}
\def\KEYWORDS#1{\gdef\theKEYWORDS{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\KEYWORDSname {\it #1}\endgraf}}\def\theKEYWORDS{}%
  
\def\TRACKname{{\bf Track\/}{\kern0.7pt}:\enskip}
\def\TRACK#1{\gdef\theTRACK{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\TRACKname {\it #1}\endgraf}}\def\theTRACK{}%

\long\def\ABSTRACT#1{\long\gdef\theABSTRACT{#1}}\def\theABSTRACT{}%

%% left justified, bold, times new roman 12px
\def\theARTICLEABSTRACT{%
  \vspace*{0pt}
  %%\begin{minipage}{\textwidth}
    
    \noindent{\bf Abstract}
    
    \begin{flushleft}
    \noindent{\bf\theABSTRACT\endgraf}
    \end{flushleft}
    
    \vskip5pt
    \theKEYWORDS
    \theTRACK
  %%\end{minipage}%
  
  }

%% Title: centered, bold and 14pt
\def\@maketitle{%
  %% title
  \begin{center}
  {\fontsize{14}{20}\bf \@title}
  \end{center}
  
  \medskip
  \theARTICLEABSTRACT
  \newpage
}
