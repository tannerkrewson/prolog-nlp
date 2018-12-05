%
% Project 1 - Tanner Krewson
%

%
% Phrases
%

n([X, Y | E], E) :- n(X), n(Y).
n([X, Y | E], E) :- nsn(X), n(Y).

nsn([X, Y | E], E) :- nsn(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y, E).

adj([X, Y | E], E) :- qual(X), adj(Y).

np([X, Y | E], E) :- det(X), n(Y).
np([X | E], E) :- pro(X).
np([X | E], E) :- n(X).
np([X | E], E) :- nsn(X).
np([X | E], E) :- nsn(X, E).
% np(X, Z) :- np(X, Y), pp(Y, Z).
np([X, Y | E], E) :- det(X), nsn(Y).
np([X, Y | E], E) :- det(X), nsn(Y, E).
np([X, Y | E], E) :- det(X), n(Y).
np([X, Y | E], E) :- det(X), n(Y, E).
np(X, Y, Z) :- np(X, [ ]), conj(Y), np(Z, [ ]).

vp([X, Y | E], E) :- v(X), np(Y, E).
% vp(X, Z) :- vp(X, Y), pp(Y, Z).
vp([X | E], E) :- v(X).
vp([X, Y | E], E) :- adv(X), vp(Y, E).
vp([X, Y | E], E) :- aux(X), vp(Y, E).
vp(X, Y, Z) :- vp(X, [ ]), conj(Y), vp(Z, [ ]).
vp([X, Y | E], E) :- vp(X, [ ]), adj(Y).

pp([X, Y | E], E) :- p(X), np(Y, E).

subc([X, Y | E], E) :- sub(X), s(Y, E).

s(X, Z) :- np(X, Y), vp(Y, Z).
s([X, Y | E], E) :- subc(X, [ ]), s(Y, E).
s([X, Y, Z | E], E) :- s(X, [ ]), conj(Y), s(Z, [ ]).

valid(X) :- s(X, [ ]).

%
% Words
%

% det - Determiner
% n - Noun
% nsn - Plural Noun
% pro - Pronoun
% adj - Adjective
% adv - Adverb
% qual - Qualifier
% v - Verb
% aux - Auxliary verb
% p - Preposition
% conj - Conjunction
% sub - Subordinating conjunction
% subc - clause with sub

n(anything).
aux(could).
v(be).
p(behind).
n(those).
nsn(doors).

pro(we).
aux(could).
aux(have).
v(been).
adv(more).
adj(relaxed).
conj(but).
pro(we).
v(were).
adv(already).
n(running).
adj(late).


/*
(we).
(had).
(potatoes).
(of).
(many).
(kinds).

(those).
(were).
(some).
*/
qual(really).
/*
(good).
(potatoes).

(sweet).
(potato).
(casserole).
(is).
*/
det(my).
/*
(favorite).
(thanksgiving).
(side).
(dish).

(she).
(knows).
(the).
(secret).
(to).
(most).
(of).
(the).
(family).
(recipes).

(she).
(is).
(coming).
(here).
(soon).

*/
sub(after).
/*
(we).
(had).
(finished).
(everyone).
(relaxed).
(and).
(talked).
(to).
(family).
*/

