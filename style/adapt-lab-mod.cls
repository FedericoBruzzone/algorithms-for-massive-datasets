%%----------------------------------------------------------------------
%% adapt-lab.cls
%% author: Walter Cazzola (07-09-2014) last update: (07-08-2018) 
%%----------------------------------------------------------------------

\def\filename{adapt-lab-mod}
\def\fileversion{V1.2 (author: Walter Cazzola)}
\def\filedate{2014/09/14}

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesPackage{\filename}[\filedate{} \fileversion]
\typeout{Class file \filename', \fileversion, <\filedate>}

%%% THIS STYLE IS BASED ON THE KOMA BOOK CLASS %%%
\LoadClass[openany]{scrbook} % MOD add openany to avoid blank pages
\KOMAoptions{DIV=10,twoside=semi,fontsize=11pt}



%%% LOAD REQUIRED PACKAGES %%%
\RequirePackage{ifthen}

%%% Support for PDF/A %%%
%%% METADATA %%%
\RequirePackage{hyperxmp}

%%% RGB Color space %%%
%%% requires eciRGB_v2.icc in working directory
\immediate\pdfobj stream attr{/N 3}  file{eciRGB_v2.icc}
\pdfcatalog{
/OutputIntents [ <<
/Type /OutputIntent
/S/GTS_PDFA1
/DestOutputProfile \the\pdflastobj\space 0 R
/OutputConditionIdentifier (eciRGB v2)
/Info(eciRGB v2)
>> ]
}

%%% TYPOGRAPHIC IMPROVEMENTS %%%
\RequirePackage[protrusion=true,expansion=true]{microtype}    % Better typography
\RequirePackage{cmap}

%%% FONT %%%
\RequirePackage{fix-cm}                                       % Custom fontsizes
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% \RequirePackage{stmaryrd}
\RequirePackage[osf,sc]{mathpazo}                             % Palatino % MOD 
%\RequirePackage{times}                                        % Times  
\RequirePackage[scaled=.85]{beramono}                         % Beramono 

%%% Formatting the lists %%%
\RequirePackage[pointlessenum]{paralist}                      %
\setdefaultitem{\normalfont\bfseries\textendash}%             % How the labels should look 
    {\normalfont\bfseries\textendash}%
    {\normalfont\bfseries\textendash}%
    {\normalfont\bfseries\textendash}%
\setdefaultenum{1.}{a.}{i.}{A.}
\let\itemize\compactitem%                                      % replace the standar envs with the compacts
\let\enditemize\endcompactitem%
\let\enumerate\compactenum%
\let\endenumerate\endcompactenum%
\let\description\compactdesc%
\let\enddescription\endcompactdesc%

\setlength{\pltopsep}{2.5pt}                                  % Space between text and list 
\setlength{\plpartopsep}{2.5pt}
\setlength{\plitemsep}{1pt}                                   % Space between items
\setlength{\plparsep}{1pt}

% This style needs the babel package in order to use the << and >> symbol
\RequirePackage[italian,english]{babel}

%%% Comments %%%

\RequirePackage[table,svgnames]{xcolor}                       % Enabling colors by their 'svgnames'
\definecolor{BloodRed}{rgb}{.86,0,0}
\definecolor{NavyBlue}{HTML}{003366}

\RequirePackage{tikz}                                         % Graphic library
\usetikzlibrary{arrows, backgrounds, calc, %
     decorations, decorations.pathreplacing, decorations.shapes, %
     fit, intersections, matrix, mindmap, positioning, shadows, %
     shapes.arrows, shapes.callouts, shapes.geometric, %     
     shapes.misc, shapes.multipart, shapes.symbols, trees %
}

\RequirePackage{ifthen}

\RequirePackage{dowecomment?}
\newcommand{\profcomment}[2][P]{\usercomment{#1}{BloodRed}{#2}}
\newcommand{\studcomment}[2][S]{\usercomment{#1}{Blue}{#2}}
\newcommand{\mycomment}[2][M]{\usercomment{#1}{Green}{#2}}
\TurnCommentsOn%

\tikzstyle{every picture}+=[remember picture]
\tikzstyle{na} = [baseline=-2.5pt]

%%%% Typesetting listings %%%
\usepackage{showcode}
%\RequirePackage{listings}
%
%\lstset{language=java,%
%   basicstyle=\ttfamily\lst@ifdisplaystyle\small\fi,keywordstyle=\bfseries\lst@ifdisplaystyle\color{BloodRed}\fi,%
%   stringstyle=\ttfamily\bfseries,commentstyle=\color{gray}\ttfamily,%
%   showlines,showstringspaces=false,columns=fixed,escapechar=`,extendedchars=true,%
%   fontadjust,boxpos=c,inputencoding=utf8,numberbychapter=false,emptylines=1%
%} 
%
%\newcommand{\lstintext}[2][java]{\lstinline[language={#1},basicstyle=\ttfamily,emphstyle=\bfseries\ttfamily,stringstyle=\ttfamily,columns=fixed,commentstyle=\rmfamily\itshape]|#2|}
%
%\newcommand{\showcode}[5][\linewidth]{%
%   \tikz%
%      \node[draw=#3, thick, fill={#2}, shape=rectangle, opacity=.5, draw opacity=1, text opacity=1, 
%          text width=#1 -10pt, inner xsep=5pt, inner ysep=-4pt,outer sep=0pt] (codebox) {%
%               \lstinputlisting[language={#4}]{code/#5}%
%   } ;
%   \vskip -3pt
%}
%
%\newcommand{\showshell}[3][\linewidth]{%
%  \tikz%
%     \node[draw=black, semithick, fill=Black, double=white, double distance=1pt, shape=rectangle, opacity=.8, draw opacity=1, text opacity=1, text width=#1 -10pt, inner xsep=5pt, inner ysep=-4pt] {%
%        \lstinputlisting[language={#2},basicstyle=\color{white}\scriptsize\bfseries\ttfamily]{code/shell/#3}%
%     } ;
%     \vskip -3pt
%}
%
%\newcommand{\showjava}[2][\linewidth]{\showcode[#1]{Yellow!25}{Gold}{{[5.0]java}}{java/#2}}
%\newcommand{\showatjava}[2][\linewidth]{\showcode[#1]{Yellow!25}{Gold}{{@java}}{@java/#2}}
%\newcommand{\showataspectj}[2][\linewidth]{\showcode[#1]{Yellow!25}{Gold}{{@aspectj}}{@aspectj/#2}}
%\newcommand{\showscala}[2][\linewidth]{\showcode[#1]{Yellow!25}{Yellow}{scala}{scala/#2}}
%\newcommand{\showneverlang}[2][\linewidth]{\showcode[#1]{Bisque!50}{BloodRed}{neverlang}{nlg/#2}}
%\newcommand{\showsneverlang}[2][\linewidth]{\showcode[#1]{Bisque!50}{BloodRed}{{[scala]neverlang}}{nlg/#2}}
%\newcommand{\showerlang}[2][\linewidth]{\showcode[#1]{Teal!25}{Teal}{erlang}{erlang/#2}}
%\newcommand{\showml}[2][\linewidth]{\showcode[#1]{BloodRed!25}{BloodRed}{{[Objective]Caml}}{ml/#2}}
%\newcommand{\showpython}[2][\linewidth]{\showcode[#1]{LimeGreen!25}{LimeGreen}{{[3]python}}{python/#2}}
%\newcommand{\showjs}[2][\linewidth]{\showcode[#1]{Gray!50}{Teal}{Javascript}{javascript/#2}}
%\newcommand{\showevil}[2][\linewidth]{\showcode[#1]{LimeGreen!25}{LimeGreen}{evil}{evil/#2}}
%\newcommand{\showxml}[2][\linewidth]{\showcode[#1]{Orange!25}{Orange}{{xml}}{xml/#2}}
%
%\RequirePackage{float}
%\floatstyle{plain}
%\newfloat{Listing}{htp}{lol}[chapter]
%\floatname{Listing}{Listing}

%%% Typesetting API tables %%%
\definecolor{medcyan}{cmyk}{.40, 0, 0, 0}
\definecolor{lightcyan}{cmyk}{.20, 0, 0, 0}

\newcommand{\apicaption}{}
\newenvironment{apitable}[3][ht]%
  {\renewcommand{\apicaption}{\caption{#2}\label{#3}}
     \begin{table}[#1]\begin{center}\begin{scriptsize}
     \begin{tabular}{|p{.8\textwidth}|}\hline}%
  {\end{tabular}\end{scriptsize}\end{center}\apicaption\end{table}}

\newcommand{\apititle}[1]{\multicolumn{1}{|>{\columncolor{medcyan}}l|}{\color{black}\textbf{#1}}\cr\hline}
\newcommand{\apisubtitle}[1]{\multicolumn{1}{|>{\columncolor{lightcyan}}l|}{\color{black}\textbf{#1}}\cr\hline}
\newcommand{\apimember}[2]{%
  \multicolumn{1}{|>{\ttfamily}p{.8\textwidth}|}{#1}\cr
    \multicolumn{1}{|>{\itshape}l|}{\parbox{.8\textwidth}{\vspace{-3mm}\begin{quote}#2\end{quote}\vspace{-3mm}}}\cr\hline
  }
%%% Typesetting Figures %%%
  \RequirePackage[format=plain,labelsep=period,indention=.5cm,textformat=period,font=small,labelfont={bf,up},textfont={it},hypcap=true,hypcapspace=.5\baselineskip]{caption}   % Custom captions under/above floats

% Alter some LaTeX defaults for better treatment of figures:
\renewcommand{\topfraction}{0.9}          % max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}       % max fraction of floats at bottom
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}               % 2 may work better
\renewcommand{\textfraction}{0.07}        % allow minimal text w. figs
\renewcommand{\floatpagefraction}{0.7}    % require fuller float pages
\renewcommand{\dblfloatpagefraction}{0.7} % require fuller float pages

%%% Hyperlinks %%%
\RequirePackage[pdftex,   % driver used for rendering
   breaklinks,            % links can cross several lines and still point to the same element
   bookmarks,             % creates the outline menu
   bookmarksnumbered,     %
   pdfdisplaydoctitle,    % the titlebar shows the document title
   plainpages=false,      %
   pdfpagemode = UseNone, % hides the outline menu when opened
   pdfpagelabels,         %
   % hidelinks,             % disables links' colors and borders % MOD 
   pdfa=true,             % to have a archival compliant pdf (pdf/a)
   hyperindex]{hyperref}

\hypersetup{
  pdfinfo={Supervisor = {Walter Cazzola}}
 }

%%% Generic Packages
\RequirePackage{xspace}
\RequirePackage{url}
\RequirePackage{ulem}
\normalem%

%%% Custom sectioning (sectsty package)
\RequirePackage{sectsty}                                   % Custom sectioning 
\RequirePackage[grey,palatino]{quotchap}                   % Custom chapter style


%%% First Page %%%
\RequirePackage{textpos}

\newsavebox\tmp@title
\newsavebox\tmp@subtitle
\newsavebox\tmp@author
\newsavebox\tmp@ayear
\newsavebox\tmp@advisor
\newsavebox\tmp@coordinator
\newsavebox\tmp@coadvisor
\newsavebox\tmp@matricola
\newsavebox\tmp@degree
\newsavebox\tmp@school
\newsavebox\tmp@ciclo
\newsavebox\tmp@ssd

%%%%%%%%%%%%%% MOD %%%%%%%%%%%%%%%%%%
\newsavebox\tmp@authortwo 
\newsavebox\tmp@matricolatwo
\newsavebox\tmp@authorthree 
\newsavebox\tmp@matricolathree

\newcommand{\authortwo}[1]{%
   \savebox{\tmp@authortwo}{\Large\color{Black!75}\textbf{#1}}%
   % \hypersetup{ pdfauthor = {#2} }%
}

\newboolean{ThereIsAMatricolaTwo}
\setboolean{ThereIsAMatricolaTwo}{false}
\newcommand{\matricolatwo}[1]{%
   \setboolean{ThereIsAMatricolaTwo}{true}%
   \savebox{\tmp@matricolatwo}{\large\color{Black!75}\textbf{#1}}%
}

\newcommand{\authorthree}[1]{%
   \savebox{\tmp@authorthree}{\Large\color{Black!75}\textbf{#1}}%
   % \hypersetup{ pdfauthor = {#2} }%
}

\newboolean{ThereIsAMatricolaThree}
\setboolean{ThereIsAMatricolaThree}{false}
\newcommand{\matricolathree}[1]{%
   \setboolean{ThereIsAMatricolaThree}{true}%
   \savebox{\tmp@matricolathree}{\large\color{Black!75}\textbf{#1}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% localization
%\newcommand{\deftranslators}[3]{%
%    \newcommand{#1}{%
%        \iflanguage{english}{#2}{#3}%
%    }%
%}
%\deftranslators{\advisorlab}{Advisor}{Relatore}

\newcommand{\newlanguagecommand}[1]{%
  \newcommand#1{%
    \@ifundefined{\string#1\languagename}
      {``No def of \texttt{\string#1} for \languagename''}
      {\@nameuse{\string#1\languagename}}%
  }%
}
\newcommand{\addtolanguagecommand}[3]{%
  \@namedef{\string#1#2}{#3}}

\newlanguagecommand{\advisorlab}
\addtolanguagecommand{\advisorlab}{english}{Advisor}
\addtolanguagecommand{\advisorlab}{italian}{Relatore}

\newlanguagecommand{\coordinatorlab}
\addtolanguagecommand{\coordinatorlab}{english}{PhD School Headmaster}
\addtolanguagecommand{\coordinatorlab}{italian}{Coordinatore Scuola di Dottorato}

\newlanguagecommand{\coadvisorlab}
\addtolanguagecommand{\coadvisorlab}{english}{Co-Advisor}
\addtolanguagecommand{\coadvisorlab}{italian}{Corelatore}

\renewcommand{\title}[1]{%
   \savebox{\tmp@title}{\parbox{12cm}{\Huge\color{Black!80}\textbf{#1}}}%
   \hypersetup{ pdftitle = {#1} }%
}

\renewcommand{\subtitle}[1]{%
   \savebox{\tmp@subtitle}{\parbox{12cm}{\LARGE\color{Black!75}\textbf{#1}}}%
}

\renewcommand{\author}[1]{%
   \savebox{\tmp@author}{\Large\color{Black!75}\textbf{#1}}%
   \hypersetup{ pdfauthor = {#1} }%
}


\newboolean{ThereIsAMatricola}
\setboolean{ThereIsAMatricola}{false}
\newcommand{\matricola}[1]{%
   \setboolean{ThereIsAMatricola}{true}%
   \savebox{\tmp@matricola}{\large\color{Black!75}\textbf{#1}}%
}

\newcommand{\ayear}[1]{%
   \savebox{\tmp@ayear}{\normalsize\color{Black!80}\textbf{Academic Year #1}}%
}

\newboolean{ThereIsAnAd}
\setboolean{ThereIsAnAd}{false}

\newcommand{\advisor}[1]{%
   \setboolean{ThereIsAnAd}{true}%
   \savebox{\tmp@advisor}{\Large\color{Black!75}\textbf{#1}}%
}

\newboolean{ThereIsASSD}
\setboolean{ThereIsASSD}{false}

\newcommand{\ssd}[1]{%
   \setboolean{ThereIsASSD}{true}%
   \savebox{\tmp@ssd}{\normalsize\color{Black!80}\textbf{#1}}%
}

\newboolean{ThereIsACoordinator}
\setboolean{ThereIsACoordinator}{false}

\newcommand{\coordinator}[1]{%
   \setboolean{ThereIsACoordinator}{true}%
   \savebox{\tmp@coordinator}{\Large\color{Black!75}\textbf{#1}}%
}

\newboolean{ThereIsACoAd}
\setboolean{ThereIsACoAd}{false}

\newcommand{\coadvisor}[1]{%
   \setboolean{ThereIsACoAd}{true}%
   \savebox{\tmp@coadvisor}{\Large\color{Black!75}\textbf{#1}}%
}

\newcommand{\school}[1]{%
   \savebox{\tmp@school}{\LARGE\color{Black!80}\textbf{#1}}%
}

\newcommand{\degree}[1]{%
   \savebox{\tmp@degree}{\LARGE\color{Black!80}\textbf{#1}}%
}

\newcommand{\ciclo}[1]{%
   \savebox{\tmp@ciclo}{\normalsize\color{Black!80}\textbf{Ciclo #1}}%
}

\newcommand{\makefirstpage}{%
   \thispagestyle{empty}  
   \begin{textblock*}{5mm}(14cm, -4cm)
      \begin{tikzpicture}
         \draw[BloodRed, ultra thick] (0,0) -- (0,320mm);
         \draw[BloodRed, ultra thick] (.15,0) -- (.15,320mm);
         \path (.075,320mm) -- (.075,0) node[sloped,pos=.75,fill=white,inner sep=1pt,font=\small] {COMPUTER SCIENCE DEPARTMENT {\color{BloodRed}\textbullet} ADAPT-LAB} ;
      \end{tikzpicture}
   \end{textblock*}
   % section title and candidate
   \begin{textblock*}{10cm}(-1.5cm, 0cm)
      \begin{tabular*}{1cm}{l}
         \usebox{\tmp@title}    \\[.5cm]
         \usebox{\tmp@subtitle} \\[.75cm]
         \usebox{\tmp@author}   \\[.25cm]
         \ifthenelse{\boolean{ThereIsAMatricola}}{%
           \large\color{Black!75}\textbf{Id. Number:} \usebox{\tmp@matricola}\cr
         }{}

         %%%%%%%%%%%%%% MOD %%%%%%%%%%%%%%%%%%
         \\
         \usebox{\tmp@authortwo}   \\[.25cm]
         \ifthenelse{\boolean{ThereIsAMatricolaTwo}}{%
           \large\color{Black!75}\textbf{Id. Number:} \usebox{\tmp@matricolatwo}\cr
         }{}
         \\
         \usebox{\tmp@authorthree}   \\[.25cm]
         \ifthenelse{\boolean{ThereIsAMatricolaThree}}{%
           \large\color{Black!75}\textbf{Id. Number:} \usebox{\tmp@matricolathree}\cr
         }{}

         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      \end{tabular*}
   \end{textblock*}
   % section advisors
   \begin{textblock*}{10cm}(-1.5cm, 10cm)
      \begin{tabular*}{1cm}{l l}%
         \multicolumn{2}{l}{\usebox{\tmp@school}}     \\[5pt]%
         \multicolumn{2}{l}{\usebox{\tmp@degree}}     \\[10pt]%
         \ifthenelse{\boolean{ThereIsACoordinator}}{%
           \Large\color{Black!80}\textbf{\coordinatorlab:}\quad & \usebox{\tmp@coordinator}  \\[10pt]%
         }{}%
        \ifthenelse{\boolean{ThereIsAnAd}}{%
            \Large\color{Black!80}\textbf{\advisorlab:}\quad & \usebox{\tmp@advisor}            \\[5pt]%
         }{}%
         \ifthenelse{\boolean{ThereIsACoAd}}{%
           \Large\color{Black!80}\textbf{\coadvisorlab:}\quad & \usebox{\tmp@coadvisor}      \\%
         }{}%
      \end{tabular*}
   \end{textblock*}

   \begin{textblock*}{12cm}(-1.3cm, 17.5cm)
      \includegraphics[width=3.2cm]{minerva-new}\quad\includegraphics[width=3.2cm]{logo-lab}

      % \LARGE\textbf{\textcolor{NavyBlue}{\uppercase{Università degli Studi di Milano}}}
      \LARGE\textbf{\textcolor{NavyBlue}{\uppercase{University of Milan}}} % MOD 

      \Large\color{Black!80}\textbf{Computer Science Department}

      \textbf{ADAPT-Lab}
   \end{textblock*}

   \begin{textblock*}{12cm}(0cm, 24.8cm)
      \parbox{10cm}{%
        \centering
           \usebox{\tmp@ciclo}

           \ifthenelse{\boolean{ThereIsASSD}}{%
              \usebox{\tmp@ssd}
           }{}

           \usebox{\tmp@ayear}
      }
   \end{textblock*}

}


%%%%%%%%%%%%%% MOD %%%%%%%%%%%%%%%%%%

% \usepackage{titlesec}

% % Redefine sectioning fonts
% \titleformat{\chapter}[display]
%   {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
% \titleformat{\section}
%   {\normalfont\Large\bfseries}{\thesection}{1em}{\Large}
% \titleformat{\subsection}
%   {\normalfont\large\bfseries}{\thesubsection}{1em}{\large}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

