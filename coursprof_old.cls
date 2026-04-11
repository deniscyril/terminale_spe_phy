
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursprof}[2025/04/15 Classe personnalisée Physique-Chimie Lycée]

% Classe de base
\LoadClass[a4paper,11pt]{book}

% === Options ===
\newif\ifremplirtrou
\DeclareOption{complet}{\remplirtroutrue}
\DeclareOption{trous}{\remplirtroufalse}
\ProcessOptions\relax

% === Packages ===
\RequirePackage[margin=1.5cm]{geometry}
\RequirePackage[french]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[x11names]{xcolor}
\RequirePackage{xifthen}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amssymb, amsfonts, amsthm}
\RequirePackage{siunitx}
\RequirePackage{hyperref}
\RequirePackage{boxedminipage}
\RequirePackage{tabularx}
\RequirePackage{chemfig}
\RequirePackage[version=4]{mhchem}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage[explicit]{titlesec}
\RequirePackage{enumerate}
\RequirePackage{pgf}
\RequirePackage{cprotect}
\usetikzlibrary{patterns,arrows,shapes,snakes}

% tabularx custom
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% Interligne
\renewcommand{\baselinestretch}{1.5}

% === Styles fancyhdr ===
\pagestyle{fancy}
\fancyhfoffset{10pt}
\lhead{}
\chead{}
\rhead{\leftmark}
\lfoot{C.DENIS}
\cfoot{Enseignement de Spécialité Terminale}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% === Titres personnalisés ===
\definecolor{myBlue}{HTML}{D11B0C}
\definecolor{monbleu}{HTML}{154360}
\definecolor{gray75}{gray}{0.75}

\titleformat{\section}[hang]{\Large\bfseries\sffamily}
{\rlap{\color{myBlue}\rule[-6pt]{\textwidth}{1.2pt}}\colorbox{myBlue}{
  \raisebox{0pt}[13pt][3pt]{ \makebox[60pt]{\fontfamily{phv}\selectfont\color{white}{\thesection}}}}}
{15pt}
{ \color{myBlue}#1 }

\titlespacing*{\section}{0pt}{3mm}{5mm}

\titleformat{\subsection}[hang]{\color{monbleu}\fontfamily{phv}\bfseries\selectfont}
{\thesubsection}{2pt}{\fontfamily{phv}\bfseries\selectfont#1}

\titleformat{\chapter}[hang]{\Huge\fontfamily{phv}\bfseries\selectfont}
{\thechapter\hspace{20pt}\textcolor{gray75}{|}\hspace{20pt}}{0pt}{\Huge\bfseries #1}

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection}- }
\renewcommand{\thesubsubsection}{\thesubsection\alph{subsubsection})}
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}{\theparagraph.\arabic{subparagraph}}
\setcounter{secnumdepth}{4}

% === Commandes mathématiques ===
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}

% === Commandes étiquettes et blocs ===
\newcommand{\etiquettebleue}[1]{\fcolorbox{DodgerBlue3!80}{DodgerBlue3!80}{\textcolor{white}{\bf #1}}}
\newcommand{\etiquetterouge}[1]{\fcolorbox{myBlue!80}{myBlue!80}{\textcolor{white}{\fontfamily{phv}\bfseries\selectfont  #1}}}
\newcommand{\etiquette}[1]{\fcolorbox{monbleu!80}{monbleu!80}{\textcolor{white}{\fontfamily{phv}\bfseries\selectfont #1}}}


\newcommand{\blocgris}[2]{
\tikzstyle{mybox} = [fill= Snow2, draw= monbleu!80, very thick,
  rectangle, rounded corners, inner sep=10pt, inner ysep=10pt]
\tikzstyle{fancytitle} =[draw=DodgerBlue3,left color= DodgerBlue3!70, right color= DodgerBlue3!80,text=white, rounded corners]

\begin{tikzpicture}

\node [mybox] (box){%
  \begin{minipage}{0.90\textwidth}
  \etiquette{#1}  #2
  \end{minipage}
};


%\node[fancytitle, rounded corners] at (box.east) {Ã  faire};
\end{tikzpicture}%
}

\newcommand{\blocrouge}[2]{
\tikzstyle{mybox} = [fill=Snow2, draw=red, thick,
    rectangle, rounded corners, inner sep=10pt, inner ysep=10pt]
\begin{tikzpicture}
\node [mybox] (box){
    \begin{minipage}{0.90\textwidth}
   \etiquetterouge{#1}  #2
    \end{minipage}
};
\end{tikzpicture}}

\newcommand{\blocoval}[2]{
\tikzstyle{mybox} = [draw=DodgerBlue4!75,left color=LemonChiffon1!90,
  right color=LemonChiffon1!5, very thick,
    rectangle, rounded corners, inner sep=10pt, inner ysep=20pt]
\tikzstyle{fancytitle} =[fill= DodgerBlue4!75,text=Snow1, ellipse]
\begin{tikzpicture}
\node [mybox] (box){
    \begin{minipage}{0.90\textwidth}
    #2
    \end{minipage}
};
\node[fancytitle, right=150pt] at (box.north west) {
\bf #1
};
\end{tikzpicture}}

% === Commande à trous ===
\newcommand{\RemplirTrou}{\ifremplirtrou true\else false\fi}
\newcommand{\TailleTrou}{\Large}
\newcommand{\ColorTrou}{black}
\newlength{\DeltaTrou}
\setlength{\DeltaTrou}{0pt}
\newsavebox{\totoTrou}
\newsavebox{\tataTrou}
\newlength{\longpointTrou}
\newlength{\profondeurTrou}
\newlength{\hauteurTrou}

\newcommand{\trou}[2][\RemplirTrou]{%
        \savebox{\tataTrou}{\hbox{\color{\ColorTrou}.}}%
        \leavevmode%
        \ifthenelse{\equal{#1}{false}}{%
                \ifmmode%
                        \ifinner%
                                \savebox{\totoTrou}{\TailleTrou$#2$}%
                                \settodepth{\profondeurTrou}{\TailleTrou$#2$}%
                                \settoheight{\hauteurTrou}{\TailleTrou$#2$}%
                        \else%
                                \savebox{\totoTrou}{\TailleTrou$\displaystyle#2$}%
                                \settodepth{\profondeurTrou}{\TailleTrou$\displaystyle#2$}%
                                \settoheight{\hauteurTrou}{\TailleTrou$\displaystyle#2$}%
                        \fi%
                \else%
                        \savebox{\totoTrou}{\TailleTrou#2}%
                        \settodepth{\profondeurTrou}{\TailleTrou#2}%
                        \settoheight{\hauteurTrou}{\TailleTrou#2}%
                \fi%
                \setlength{\longpointTrou}{0pt}%
                \whiledo{\lengthtest{\longpointTrou<\wd\totoTrou}}{%
                        \hbox{%
                            \rule[-\profondeurTrou-\DeltaTrou]{0pt}{\profondeurTrou+\hauteurTrou+2\DeltaTrou}%
                            \usebox{\tataTrou}%
                        }%
                        \penalty0\advance\longpointTrou by\wd\tataTrou%
                }%
        }{%
                {\color{\ColorTrou}#2}%
        }%
}
