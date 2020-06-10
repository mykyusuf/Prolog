flight(istanbul,rize).
flight(rize,istanbul).
flight(istanbul,van).
flight(van,istanbul).
flight(istanbul,ankara).
flight(ankara,istanbul).
flight(istanbul,gaziantep).
flight(gaziantep,istanbul).
flight(istanbul,antalya).
flight(antalya,istanbul).
flight(istanbul,izmir).
flight(izmir,istanbul).
flight(izmir,isparta).
flight(isparta,izmir).
flight(isparta,burdur).
flight(burdur,isparta).
flight(rize,van).
flight(van,rize).
flight(van,ankara).
flight(ankara,van).
flight(ankara,konya).
flight(konya,ankara).
flight(konya,antalya).
flight(antalya,konya).
flight(antalya,gaziantep).
flight(gaziantep,antalya).
flight(erzincan,edremit).
flight(edremit,erzincan).
flight(edremit,edirne).
flight(edirne,edremit).

route(X,Y) :-
helper(X,Y,[X],Q),
reverse(Q,Path),
X \== Y,
write(Path).

helper(A,B,P,[B|P]) :-
flight(A,B).

helper(A,B,P,V) :-
flight(A,C),
C \== B,
\+member(C,P),helper(C,B,[C|P],V).


