%
% Project 1 NLP - Tanner Krewson
%

%
% Test Commands
%

/*

valid([anything, could, be, behind, those, doors]).
valid([we, could, have, been, more, relaxed, but, we, were, already, running, late]).
valid([we, had, potatoes, of, many, kinds]).
valid([those, were, some, really, good, potatoes]).
valid([sweet, potato, casserole, is, my, favorite, Thanksgiving, side, dish]).
valid([she, knows, the, secret, to, most, of, the, family, recipes]).
valid([she, is, coming, here, soon]).
valid([after, we, had, finished, everyone, relaxed, and, talked, to, family]).

*/

%
% Phrases
%

n([X, Y | E], E) :- n(X), n(Y).
n([X, Y | E], E) :- nsn(X), n(Y).
n([X | _Y], _E) :- n(X).

nsn([X, Y | E], E) :- nsn(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y, E).
nsn([X | _Y], _E) :- nsn(X).

adj([X, Y | E], E) :- qual(X), adj(Y).

np([X, Y | E], E) :- det(X), n(Y).
np([X | E], E) :- pro(X).
np([X | E], E) :- n(X).
np([X | E], E) :- nsn(X).
np([X | E], E) :- nsn(X, E).
np([X, Y | E], E) :- det(X), nsn(Y).
np([X | Y], E) :- det(X), nsn(Y, E).
np([X, Y | E], E) :- det(X), n(Y).
np([X | Y], E) :- det(X), n(Y, E).
np([X, Y | E], E) :- adj(X), n(Y).
np([X | Y], E) :- adj(X), n(Y, E).
np(X, Y, Z) :- np(X, [ ]), conj(Y), np(Z, [ ]).

vp([X, Y | Z], _E) :- v(X), np(Y, Z).
vp([X | _Y], _E) :- v(X).
vp([X | Y], E) :- adv(X), vp(Y, E).
vp([X | Y], E) :- aux(X), vp(Y, E).
vp([X, Y | _Z], _E) :- vp(X, [ ]), adj(Y).
vp(X, Y, Z) :- vp(X, [ ]), conj(Y), vp(Z, [ ]).

pp([X, Y | E], E) :- p(X), np(Y, E).

subc([X | Y], E) :- sub(X), s(Y, E).

s(X, Z) :- np(X, Y), vp(Y, Z).
s(X, Z) :- subc(X, Y), s(Y, Z).
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

adj(favorite).
adj(good).
adj(late).
adj(relaxed).
adj(sweet).

adv(already).
adv(here).
adv(many).
adv(more).
adv(soon).

aux(could).
aux(had).
aux(have).

conj(and).
conj(but).

det(my).
det(some).
det(the).

n(anything).
n(casserole).
n(dish).
n(family).
n(potato).
n(recipes).
n(running).
n(secret).
n(side).
n(thanksgiving).
n(those).

nsn(doors).
nsn(everyone).
nsn(kinds).
nsn(potatoes).

p(behind).
p(of).
p(to).

pro(most).
pro(she).
pro(we).

qual(really).

sub(after).

v(be).
v(been).
v(coming).
v(finished).
v(had).
v(is).
v(knows).
v(relaxed).
v(talked).
v(were).
