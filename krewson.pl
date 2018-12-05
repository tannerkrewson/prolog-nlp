%
% Project 1 - Tanner Krewson
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
n([X | Y], E) :- n(X).

nsn([X, Y | E], E) :- nsn(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y).
nsn([X, Y | E], E) :- adj(X), nsn(Y, E).
nsn([X | Y], E) :- nsn(X).

adj([X, Y | E], E) :- qual(X), adj(Y).

np([X, Y | E], E) :- det(X), n(Y).
np([X | E], E) :- pro(X).
np([X | E], E) :- n(X).
np([X | E], E) :- nsn(X).
np([X | E], E) :- nsn(X, E).
% np(X, Z) :- np(X, Y), pp(Y, Z).
np([X, Y | E], E) :- det(X), nsn(Y).
np([X | Y], E) :- det(X), nsn(Y, E).
np([X, Y | E], E) :- det(X), n(Y).
np([X | Y], E) :- det(X), n(Y, E).
np([X, Y | E], E) :- adj(X), n(Y).
np([X | Y], E) :- adj(X), n(Y, E).
np(X, Y, Z) :- np(X, [ ]), conj(Y), np(Z, [ ]).

vp([X, Y | Z], E) :- v(X), np(Y, Z).
% vp(X, Z) :- vp(X, Y), pp(Y, Z).
vp([X | Y], E) :- v(X).
vp([X | Y], E) :- adv(X), vp(Y, E).
vp([X | Y], E) :- aux(X), vp(Y, E).
vp(X, Y, Z) :- vp(X, [ ]), conj(Y), vp(Z, [ ]).
vp([X, Y | Z], E) :- vp(X, [ ]), adj(Y).

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


pro(we).
v(had).
nsn(potatoes).
p(of).
adv(many).
nsn(kinds).

n(those).
v(were).
det(some).
qual(really).
adj(good).
nsn(potatoes).

adj(sweet).
n(potato).
n(casserole).
v(is).
det(my).
adj(favorite).
n(thanksgiving).
n(side).
n(dish).

pro(she).
v(knows).
det(the).
n(secret).
p(to).
pro(most).
p(of).
det(the).
n(family).
n(recipes).

pro(she).
v(is).
v(coming).
adv(here).
adv(soon).

sub(after).
pro(we).
aux(had).
v(finished).
nsn(everyone).
v(relaxed).
conj(and).
v(talked).
p(to).
n(family).
