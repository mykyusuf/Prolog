enrollment(a,102).
enrollment(a,108).
enrollment(b,102).
enrollment(c,108).
enrollment(d,341).
enrollment(e,455).


when(102,10).
when(108,12).
when(341,14).
when(455,16).
when(452,17).


where(102,z23).
where(108,z11).
where(341,z06).
where(455,207).
where(452,207).

schedule(A,P,T):-
enrollment(A,P),
when(P,T).

usage(R,T):-
where(X,R),
when(X,T).

conflict(X1,X2):-
when(X1,T1),
when(X2,T2),
where(X1,C1),
where(X2,C2),
T1 \= T2 , C1 \= C2 ->  false ; true.

meet(E1,E2):-
enrollment(E1,S1),
when(S1,T1),
where(S1,C1),
enrollment(E2,S2),
when(S2,T2),
where(S2,C2),
E1 \= E2 , T1 == T2 , C1 == C2 ->  true ; false.


