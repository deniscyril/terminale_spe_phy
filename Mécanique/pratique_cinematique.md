---
document-class: article
font-size : 11 pt
geometry: margin = 1.5 cm
numbersections : False
header-includes:
- \usepackage{graphicx}
---

\fiche{Commment Exploiter une chronophotographie}{Fiche Pratique}{Terminale Spé}

# Problème à 1D
## Construction des vecteurs vitesses 

Un motard s'élance, avec une vitesse initiale nulle, sur une piste rectiligne en maintenant son accélération constante. La chronophotographie représente les positions successives du centre d'inertie G du système.

La durée $\tau=0,800$ s sépare deux positions successives de G. 

1. Exprimer les valeurs des vitesses $\overrightarrow{v_2}$ et $\overrightarrow{v_4}$.
2. Représenter ces vecteurs en respectant l'échelle: 1 cm pour 2 m/s.

## Construction du vecteur accélération

1. Représenter le vecteur $\Delta\overrightarrow{v_3} = \overrightarrow{v_4} - \overrightarrow{v_2}$.
2. Donner l'expression de $\overrightarrow{a_3}$ au point $G_3$ puis calculer sa valeur.
3. Représenter le vecteur accélération en respectant l'échelle: 1 cm pour 1 m/$s^2$.


# Problème à 2D
## Construction des vecteurs vitesses

On étudie le mouvement d'une cabine de grande roue à partir de son départ. Les positions sont relevées sur le documents 'Chronophotographies' toutes les 40 s.

1. Numéroter les points de $M_1$ à $M_{14}$ et tracer la trajectoire du point M.
2. Tracer les vecteurs vitesses $\overrightarrow{v_{10}}$ et $\overrightarrow{v_{12}}$ en utilisant l'échelle des vitesses: 1 cm pour 0,10 m/s.

## Construction d'un vecteur accélération

3. Tracer au point $M_{11}$, la variation $\Delta\overrightarrow{v_{11}}$ du vecteur vitesse.
4. Déterminer la norme de ce vecteur.
5. Déterminer la norme du vecteur $\overrightarrow{a_{11}}$ au point $M_{11}$.
6. Représenter ce vecteur accélération sur la chronophotographie en utilisant l'échelle 1 cm pour $2,5.10^{-4}\:m.s^{-2}$

## Repère de Frenet

1. Au point $M_{11}$, tracer le repère de Frenet et rappeler l'expression du vecteur accélération exprimée dans ce repère.
2. Justifier à l'aide du vecteur accélération le fait que la norme de la vitesse de la cabine augmente au cours de ce mouvement.
3. Nommer ce mouvement.

\newpage
\includegraphics{chronophotographies.pdf}

\newpage
# De la vitesse moyenne à la vitesse instantanée

Le graphique ci-dessous représente la position d'un faucon au cours du temps. On suppose que son mouvement est rectiligne.
\begin{center}
\includegraphics{graphique.pdf}
\end{center}

Le but est de déterminer précisement la vitesse du faucon à t = 8,0 s.


1. Relier les 3 paires de points sur la courbe correspondant à 6,0 s et 10,0 s - 7,0 s et 9,0 s - 7,5 s et 8,5 s.
2. Déterminer la vitesse moyenne du faucon pour chacune des trois paires points.
3. Tracer la tangente à la courbe à t = 8,0 s. Prolonger cette droite le plus loin possible.
4. Déterminer le coefficient directeur de cette droite (choisir deux points de cette droite et calculer $\frac{\Delta y}{\Delta x}$).

## Analyse

1. Pourquoi a-t-on calculer les vitesses moyennes pour différentes paires de points ?
2. Quelle est la signification du coefficient directeur de la droite calculer à la queston 4 ?
3. Rédiger une méthode permettant de déterminer la vitesse instantanée à partir du graphique représentant la position au cours du temps du mobile.
4. Utiliser votre méthode pour calculer la vitesse du faucon à t = 3,0 s et t = 5,0 s.

\newpage

\fiche{Exploiter des équations horaires}{Cinématique}{Terminale}

## Description mathématique du mouvement

Soit un repère orthonormé ayant pour axes Ox et Oy. Un point M se déplace dans le plan. Soit $\overrightarrow{OM}$ le vecteur position ayant pour coordonnée x et y.
Les équations horaires sont :

$$\left \{ \begin{array}{ll}
x(t)=4t\\
y(t)=-2t^2+10t  \end{array}
\right. $$

x et y s'expriment en m. t est la date à laquelle le point occupe une position. t s'exprime en s.

## Trajectoire et vecteur vitesse

\begin{enumerate}
\item Donner les coordonnées du point M au dates suivantes : \\
$\rm t_0=\SI{0}{\second}$ ; $\rm t_1=\SI{1}{\second}$ ; $\rm t_2=\SI{2}{\second}$ ; $\rm t_3=\SI{2,5}{\second}$ ; $\rm t_4=\SI{3}{\second}$ ; $\rm t_5=\SI{4}{\second}$ ; $\rm t_6=\SI{5}{\second}$
\item Dans le repère Ox,Oy , positionner aux différents instants le point M. Echelle : $\SI{1}{\centi\meter}\leftrightarrow \SI{1}{\meter}$
\item Quelle est l'allure de la trajectoire du point M ?
\item Donner l'équation de la trajectoire. Cela correspond-il au résultat précédent ?
\item Soit $\overrightarrow{v}$ le vecteur vitesse du point M.
Donner les composantes $\rm v_x(t)$ et $\rm v_y(t)$ du vecteur $\overrightarrow{v}$
\item Calculer la valeur des composantes aux dates : \\
$\rm t_0=\SI{0}{\second}$ ; $\rm t_3=\SI{2,5}{\second}$ ; $\rm t_6=\SI{5}{\second}$
\item Représenter sur la trajectoire le vecteur vitesse aux instants :\\
$\rm t_0=\SI{0}{\second}$ ; $\rm t_3=\SI{2,5}{\second}$ ; $\rm t_6=\SI{5}{\second}$ (au préalable, représenter $\rm v_x(t)$ et $\rm v_y(t)$ en respectant l'échelle $\SI{1}{\centi\meter}\leftrightarrow \SI{4}{\meter\per\second}$
\end{enumerate}

## Vecteur accélération

\begin{enumerate}
\item
Donner les composantes $\rm a_x$ et $\rm a_y$. Dépendent-elles du temps ?
\item Représenter le vecteur accélération (origine : où vous le souhaitez). Echelle :  $\SI{1}{\centi\meter}\leftrightarrow \SI{1}{\meter\per\second\squared}$
\end{enumerate}


## Exercice 

Les équations horaires sont :

$$\left \{ \begin{array}{ll}
x(t)=2t\\
y(t)=-4t^2+4t  \end{array}
\right. $$
 t est compris entre 0 s et 3 s. 

1. Déterminer les coordonnées de M à t = 3,0 s.
2. Donner l'expression des coordonnées du vecteur vitesse à un instant t quelconque.
3. Calculer la valeur de la vitesse à t = 3,0 s.
4. Déterminer les coordonnées du vecteur accélération. Calculer sa valeur. 
5. Donner l'équation de la trajectoire.
6. Avec vos connaissances en mathématiques, déterminer les coordonnées du sommet de la trajectoire.
7. Que vaut la vitesse au sommet de la trajectoire ?



