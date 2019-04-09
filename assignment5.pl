sentence(VP) --> noun_phrase1(Actor), verb_phrase(Actor,VP).
noun_phrase2(Actor) --> determiner(Det),proper_noun(Actor),{!}.
noun_phrase2(Actor) --> proper_noun(Actor).
noun_phrase1(Actor) --> proper_noun(Actor).
verb_phrase(Actor,VP) --> intrans_verb(Actor,VP).
verb_phrase(Actor,VP) --> trans_verb(Actor,Y,VP),noun_phrase2(Y).

intrans_verb(Actor, man(Actor)) --> [man].

trans_verb(X,Y, eats(X,Y)) --> [eats].
trans_verb(X,Y, loves(X,Y)) --> [loves].
trans_verb(X,Y, drinks(X,Y)) --> [drinks].
trans_verb(X,Y, hates(X,Y)) --> [hates].
proper_noun(ram) --> [ram].
proper_noun(man) --> [man].
proper_noun(god) --> [god].
proper_noun(apple) --> [apple].
proper_noun(sita) --> [sita].
proper_noun(water) --> [water].
proper_noun(teacher) --> [teacher].
proper_noun(course) --> [course].
proper_noun(cat) --> [cat].
proper_noun(rat) --> [rat].
determiner(a) --> [a].
determiner(an) --> [an].
determiner(the) --> [the].