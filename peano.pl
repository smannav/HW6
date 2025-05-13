%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Peano arithmetic formalism
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

is_number(0).
is_number(s(X)) :- is_number(X).

add(0, N, N) :- is_number(N).
add(s(N), M, s(Y)) :- add(N, M, Y).

mul(0, N, 0) :- is_number(N).
mul(s(N), M, Y) :-
  mul(N, M, YY),
  add(M, YY, Y).

% Anything to the 0th power is 1 (which is s(0) in Peano)
exp(_, 0, s(0)).

% X^(s(Y)) = X * (X^Y)
exp(X, s(Y), Z) :-
    exp(X, Y, Z1),
    mul(X, Z1, Z).

% Example execution:
% swipl peano.pl
% ?- exp(s(s(0)), s(s(0)), Z).
% Z = s(s(s(s(0)))).
% ?- exp(s(s(0)), s(s(s(0))), Z).
% Z = s(s(s(s(s(s(s(s(0)))))))).