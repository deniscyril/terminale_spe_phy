\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursprof}[2025/04/15 Classe personnalisée Physique-Chimie Lycée (Modernisée)]

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

% --- Nouvelle police ---
\RequirePackage{opensans}
\renewcommand{\familydefault}{\sfdefault} % Utiliser Open Sans comme police par défaut (sans-serif)
% Si vous préférez une police serif moderne et lisible, vous pouvez essayer:
%\RequirePackage{lmodern}
%\renewcommand{\familydefault}{\rmdefault} % Utiliser Latin Modern Roman comme police par défaut (serif)

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
\RequirePackage{fontawesome5} % doc: https://ctan.ceremade.dauphine.fr/fonts/fontawesome5/doc/fontawesome5.pdf
\RequirePackage{enumitem}
\RequirePackage{etoolbox} % Ajoute le package etoolbox
\RequirePackage[many]{tcolorbox}
\usetikzlibrary{patterns,arrows,shapes,snakes}

% --- Listes enumerate avec des puces au lieu de chiffres ---
\setlist[itemize]{
  label=\textbullet,   % symbole de la puce
  labelsep=0.5em,      % espace entre la puce et le texte
  leftmargin=*,        % aligne le retrait comme itemize
  itemsep=0.5\baselineskip % espacement vertical entre items (facultatif)
}


% tabularx custom
\newcolumntype{Y}{>{\centering\arraybackslash}X}

% Interligne (légèrement réduit pour Open Sans, si vous le choisissez)
\renewcommand{\baselinestretch}{1.3} % Ajustez selon votre préférence

% === Styles fancyhdr (avec la nouvelle police) ===
\pagestyle{fancy}
\fancyhfoffset{10pt}
\lhead{}
\chead{}
\rhead{\sffamily\bfseries\leftmark} % Police sans-serif pour l'en-tête
\lfoot{\sffamily C.DENIS} % Police sans-serif pour le pied de page
\cfoot{\sffamily Enseignement de Spécialité Terminale} % Police sans-serif pour le pied de page
\rfoot{\sffamily\thepage} % Police sans-serif pour le pied de page
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% Correction du problème itemize
\BeforeBeginEnvironment{itemize}{\vspace{0pt}} % Ajout d'espace vertical nul avant itemize

% === Titres personnalisés (avec la nouvelle police et des ajustements) ===
\definecolor{myBlue}{HTML}{D11B0C}
\definecolor{monbleu}{HTML}{154360}
\definecolor{gray75}{gray}{0.75}

\titleformat{\section}[block]{\Large\bfseries\sffamily\color{myBlue}} % Couleur appliquée ici
{\rlap{\color{myBlue}\rule[-6pt]{\textwidth}{1.2pt}}%
 \colorbox{myBlue}{
   \raisebox{0pt}[13pt][3pt]{
     \makebox[12pt]{\sffamily\bfseries\color{white}{\thesection}} % Police sans-serif et gras
   }
 }}
{10pt}
{#1} % La couleur est déjà appliquée à la ligne précédente

\titlespacing*{\section}{0pt}{3mm}{4mm}

\titleformat{\subsection}[hang]{\color{monbleu}\sffamily\bfseries} % Police sans-serif et gras
{\thesubsection}{2pt}{\sffamily\bfseries#1} % Police sans-serif et gras

\titleformat{\chapter}[hang]{\Huge\sffamily\bfseries\color{monbleu}} % Police sans-serif, gras et couleur
{\sffamily\bfseries\thechapter\hspace{20pt}\textcolor{gray75}{|}\hspace{20pt}}{0pt}{\Huge\bfseries #1} % Police sans-serif et gras

\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\arabic{subsection} - }
\renewcommand{\thesubsubsection}{\thesubsection\alph{subsubsection})}
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}{\theparagraph.\arabic{subparagraph}}
\setcounter{secnumdepth}{4}



\newcommand{\parcoeur}{\faHeart} % Icône de coeur
\newcommand{\technique}{\faWrench} % Icône de clé à molette (pour technique)
% Vous pouvez trouver d'autres icônes sur le site de Font Awesome (v5)
% avec les préfixes \fa... pour les icônes Solid et \far... pour Regular, etc.

% === Commandes étiquettes et blocs (utilisation de la nouvelle police) ===
\newcommand{\etiquettebleue}[1]{\fcolorbox{DodgerBlue3!80}{DodgerBlue3!80}{\textcolor{white}{\sffamily\bfseries #1}}}
\newcommand{\etiquetterouge}[1]{\fcolorbox{myBlue!80}{myBlue!80}{\textcolor{white}{\sffamily\bfseries #1}}}
\newcommand{\etiquette}[1]{\fcolorbox{monbleu!80}{monbleu!80}{\textcolor{white}{\sffamily\bfseries #1}}}


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
%\node[fancytitle, rounded corners] at (box.east) {À faire};
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

%--------------------------------------------------------
% Boîte « Attention »
%--------------------------------------------------------
\newtcolorbox{attention}[1][]{%
  enhanced, breakable, sharp corners,
  boxrule=0pt,        % pas de cadre
  frame hidden, interior hidden,     % pas de fond
  borderline west={3pt}{0pt}{red!80!black}, % barre verticale
  % --- contenu inséré avant le texte de l'utilisateur ---
  before upper={%
    \faExclamationTriangle\hspace{.6em}%
    \textbf{\textcolor{red!80!black}{Attention}}\par\smallskip},
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  before skip=10pt,after skip=10pt,
  #1}
  
%--------------------------------------------------------
% Boîte « Remarque »
%--------------------------------------------------------
\newtcolorbox{remarque}[1][]{%
  enhanced, breakable, sharp corners,
  boxrule=0pt,
  colback=white,
  borderline west={2pt}{0pt}{teal!80!black},
  before upper={%
    \faCommentDots[regular]\hspace{.6em}%
    \textbf{\textcolor{teal!80!black}{Remarque}}\par\smallskip},
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  before skip=10pt,after skip=10pt,
  #1}
  %--------------------------------------------------------
% Boîte « Exercices à Faire »
%--------------------------------------------------------
\newtcolorbox{travail}[1][]{%
  enhanced, breakable, sharp corners,
  boxrule=0pt,
%  colback=white,
  frame hidden, interior hidden,     % pas de fond
  borderline west={2pt}{0pt}{teal!80!black},
  before upper={%
    \faBusinessTime \hspace{.6em}%
    \textbf{\textcolor{teal!80!black}{Travail Personnel}}\par\smallskip},%
  left=6pt,right=6pt,top=6pt,bottom=6pt,
  before skip=10pt,after skip=10pt,
  #1}

% === Commande à trous (utilisation de la nouvelle police) ===
\newcommand{\RemplirTrou}{\ifremplirtrou true\else false\fi}
\newcommand{\TailleTrou}{\Large\sffamily} % Appliquer la police sans-serif ici
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