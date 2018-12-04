%
% Project 1 - Tanner Krewson
%

%
% Phrases
%

n(X, Y) :- n(X), n(Y).
n(X, Y) :- nsn(X), n(Y).

nsn(X, Y) :- nsn(X), nsn(Y).
nsn(X, Y) :- adj(X), nsn(Y).

adj(X, Y) :- qual(X), adj(Y).

np(X, Y) :- det(X), n(Y).
np(X) :- pro(X).
np(X) :- nsn(X).
np(X, Y) :- np(X), pp(Y).
np(X, Y) :- det(X), nsn(Y).
np(X, Y) :- det(X), n(Y).
np(X, Y, Z) :- np(X), conj(Y), np(Z).

vp(X, Y) :- v(X), np(Y).
vp(X, Y) :- vp(X), pp(Y).
vp(X) :- v(X).
vp(X, Y) :- adv(X), vp(Y).
vp(X, Y) :- aux(X), vp(Y).
vp(X, Y, Z) :- vp(X), conj(Y), vp(Z).
vp(X, Y) :- vp(X), adj(Y).

pp(X, Y) :- p(X), np(Y).

subc(X, Y) :- sub(X), s(Y).

s(X, Y) :- np(X), vp(Y).
s(X, Y) :- subc(X), s(Y).
s(X, Y, Z) :- s(X), conj(Y), s(Z).

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
verb(were).
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
(really).
(good).
(potatoes).

(sweet).
(potato).
(casserole).
(is).
(my).
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

(after).
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

