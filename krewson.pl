%
% Project 1 - Tanner Krewson
%

%
% Phrases
%

n(X, Z) :- n(X, Y), n(Y, Z).
n(X, Z) :- nsn(X, Y), n(Y, Z).

nsn(X, Z) :- nsn(X, Y), nsn(Y, Z).
nsn(X, Z) :- adj(X, Y), nsn(Y, Z).

adj(X, Z) :- qual(X, Y), adj(Y, Z).

np(X, Z) :- det(X, Y), n(Y, Z).
np(X) :- pro(X).
np(X) :- nsn(X).
np(X, Z) :- np(X, Y), pp(Y, Z).
np(X, Z) :- det(X, Y), nsn(Y, Z).
np(X, Z) :- det(X, Y), n(Y, Z).
% np(X, Y, Z) :- np(X, Y), conj(Y, Z), np(Z).

vp(X, Z) :- v(X, Y), np(Y, Z).
vp(X, Z) :- vp(X, Y), pp(Y, Z).
vp(X) :- v(X, Y).
vp(X, Z) :- adv(X, Y), vp(Y, Z).
vp(X, Z) :- aux(X, Y), vp(Y, Z).
% vp(X, Y, Z) :- vp(X, Y), conj(Y, Z), vp(Z).
vp(X, Z) :- vp(X, Y), adj(Y, Z).

pp(X, Z) :- p(X, Y), np(Y, Z).

subc(X, Z) :- sub(X, Y), s(Y, Z).

s(X, Z) :- np(X, Y), vp(Y, Z).
s(X, Z) :- subc(X, Y), s(Y, Z).
% s(X, Y, Z) :- s(X, Y), conj(Y, Z), s(Z).

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

n([anything|X], X).
aux([could|X], X).
v([be|X], X).
p([behind|X], X).
n([those|X], X).
nsn([doors|X], X).

pro([we|X], X).
aux([could|X], X).
aux([have|X], X).
v([been|X], X).
adv([more|X], X).
adj([relaxed|X], X).
conj([but|X], X).
pro([we|X], X).
verb([were|X], X).
adv([already|X], X).
n([running|X], X).
adj([late|X], X).


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

