%%%%%%%%%%%% util.pl %%%%%%%%%%%%
% Différents prédicats d'utilité publique.

:- module(util, [
	nbLignes/1,
	nbColonnes/1,
	infinitePos/1,
	infiniteNeg/1,
	infinitePos/2,
	infiniteNeg/2,
	ennemi/2,
	incr/2,
	decr/2,
	sum/2,
	caseVide/2
]).

%%%%%%%%%%%%%%%%
%% Constantes %%
%%%%%%%%%%%%%%%%

nbLignes(6).
nbColonnes(7).

infinitePos(10005).
infiniteNeg(-10005).

infinitePos(X,Rep):- Rep is X+10000.
infiniteNeg(X,Rep):- Rep is -10000-X.

%%%%%%%%%%%%%%%%%%%%%%%
%% Prédicats publics %%
%%%%%%%%%%%%%%%%%%%%%%%

ennemi(jaune,rouge).
ennemi(rouge,jaune).

% incr/2(+X, -X1)
% Unifie X1 = X+1.
% Vrai pour X1 = X+1.
incr(X,X1):-
	X1 is X+1.

% decr/2(+X, -X1)
% Unifie X1 = X-1.
% Vrai pour X1 = X-1.
decr(X,X1):-
	X1 is X-1.

% sum/2(+Liste, -Somme)
% Somme les termes de la liste.
% Somme s'unifie é la somme des termes de la liste.
sum([],0).
sum([X|Xs],N) :-
	sum(Xs,N1),
	N is N1+X.

% caseVide/2(+X, +Y)
% Vérifie si la case est vide.
% Vrai si la case n'a pas été remplie.
caseVide(X,Y) :-
	nonvar(X),
	nonvar(Y),
	not(case(X,Y,_)).

assert(valeurCase(1,1,3)).
assert(valeurCase(1,2,4)).
assert(valeurCase(1,3,5)).
assert(valeurCase(1,4,5)).
assert(valeurCase(1,5,4)).
assert(valeurCase(1,6,3)).
assert(valeurCase(2,1,4)).
assert(valeurCase(2,2,6)).
assert(valeurCase(2,3,8)).
assert(valeurCase(2,4,8)).
assert(valeurCase(2,5,6)).
assert(valeurCase(2,6,4)).
assert(valeurCase(3,1,5)).
assert(valeurCase(3,2,8)).
assert(valeurCase(3,3,11)).
assert(valeurCase(3,4,11)).
assert(valeurCase(3,5,8)).
assert(valeurCase(3,6,5)).
assert(valeurCase(4,1,7)).
assert(valeurCase(4,2,10)).
assert(valeurCase(4,3,13)).
assert(valeurCase(4,4,13)).
assert(valeurCase(4,5,10)).
assert(valeurCase(4,6,7)).
assert(valeurCase(5,1,5)).
assert(valeurCase(5,2,8)).
assert(valeurCase(5,3,11)).
assert(valeurCase(5,4,11)).
assert(valeurCase(5,5,8)).
assert(valeurCase(5,6,5)).
assert(valeurCase(6,1,4)).
assert(valeurCase(6,2,6)).
assert(valeurCase(6,3,8)).
assert(valeurCase(6,4,8)).
assert(valeurCase(6,5,6)).
assert(valeurCase(6,6,4)).
assert(valeurCase(7,1,3)).
assert(valeurCase(7,2,4)).
assert(valeurCase(7,3,5)).
assert(valeurCase(7,4,5)).
assert(valeurCase(7,5,4)).
assert(valeurCase(7,6,3)).