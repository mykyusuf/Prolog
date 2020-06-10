/******************************************intersect***************************************/

intersect([], _, []).

intersect([H1|T1], L2, [H1|Res]) :-
member(H1, L2),
intersect(T1, L2, Res).

intersect([_|T1], L2, Res) :-
intersect(T1, L2, Res).


/****************************************** Union ***************************************/

union([],[],[]).

union(List1,[],List1).

union(List1, [Head2|Tail2], [Head2|Output]):-
\+(member(Head2,List1)), union(List1,Tail2,Output).
union(List1, [Head2|Tail2], Output):-
member(Head2,List1), union(List1,Tail2,Output).


/***************************************** Element *********************************/

element(X, [Y|T]) :- X = Y; element(X, T)->true.




/*************************************** equivalent ***************************************/

isSubset([],_).

isSubset([H|T],Y):-
member(H,Y),
select(H,Y,Z),
isSubset(T,Z).

equivalent(X,Y):-
isSubset(X,Y),
isSubset(Y,X)->true.



testMember():-
element(a, [1, 2, 3, a, 5, 6, a]).

testUnion(X):-
union([3,4,c,5], [7,f,c,3], X), !.

testIntersect(X):-
intersect([1,3,5,2,4], [6,1,2,3], X), !.

testEquivalent():-
equivalent([a,b,c],[a,c,b]).
