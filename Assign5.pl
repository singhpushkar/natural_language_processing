:-op(300,xfy,and).
:-op(400,xfy,=>).

sentence(FinalR,sent(Act1,VP1)) --> np(X, FromV, FinalR,Act1), vp(X, FromV,VP1),{!}.
np(X, FromV, FinalR,np(Det1,Adj1,Act1)) --> det(X, A, FromV, FinalR,Det1), adj(X,B,A,Adj1),noun(X, B,Act1).
np(X, FromV, FinalR,np(Det1,Act1)) --> det(X, B, FromV, FinalR,Det1), noun(X, B,Act1).
vp(X, FromV, vp(H1,VP1)) --> trans_verb(X, Y, LFV,H1), np(Y, LFV, FromV,VP1).
vp(X, LFV, vp(H1,VP1)) --> trans_verb(X, Y, LFV,H1), noun_phrase2(Y,VP1).
det(X, Res, Scope, Y,determiner(every)) --> [every],{Y = all(X, Res => Scope)}.
det(X, Res, Scope, Y,determiner(a)) --> [a],{Y = exist(X, Res and Scope)}.
det(X, Res, Scope, Y,determiner(an)) --> [an],{Y = exist(X, Res and Scope)}.
det(X, Res, Scope, Y,determiner(the)) --> [the],{Y = exist(X, Res and Scope)}.
noun(X, Y, Act1) --> proper_noun(N,Act1), {Y=..[N, X]}.
adj(X, A,Z,N1) --> adjective(N,N1), {Y=..[N, X],Z=Y and A}.

sentence(VP,sent(Act1,VP1)) --> noun_phrase1(Act,Act1), verb_phrase(Act,VP,VP1).
noun_phrase2(Act,np(Det1,Act1)) --> determiner(Det,Det1),proper_noun(Act,Act1),{!}.
noun_phrase2(Act,np(Act1)) --> proper_noun(Act,Act1).
noun_phrase1(Act,np(Act1)) --> proper_noun(Act,Act1).
verb_phrase(Act,VP,vp(H1,VP1)) --> is_helpingverb(H,H1),object_without_verb(Act,VP,VP1),{!}.
verb_phrase(Act,VP,vp(H1,T1,VP1)) --> is_helpingverb(H,H1),determiner(T,T1),object_without_verb(Act,VP,VP1).
verb_phrase(Act,VP,vp(VP)) -->intrans_verb(Act,VP).
verb_phrase(Act,VP,vp(VP1,Y1)) --> trans_verb(Act,Y,VP,VP1),noun_phrase2(Y,Y1).

object_without_verb(Act, man(Act),noun(man)) --> [man].
intrans_verb(Act, goes(Act)) --> [goes].

trans_verb(X,Y, eats(X,Y),verb(eats)) --> [eats].
trans_verb(X,Y, loves(X,Y),verb(loves)) --> [loves].
trans_verb(X,Y, drinks(X,Y),verb(drinks)) --> [drinks].
trans_verb(X,Y, hates(X,Y),verb(hates)) --> [hates].
trans_verb(X,Y, teaches(X,Y),verb(teaches)) --> [teaches].
proper_noun(ram,noun(ram)) --> [ram].
proper_noun(man,noun(man)) --> [man].
proper_noun(god,noun(god)) --> [god].
proper_noun(apple,noun(apple)) --> [apple].
proper_noun(sita,noun(sita)) --> [sita].
proper_noun(water,noun(water)) --> [water].
proper_noun(teacher,noun(teacher)) --> [teacher].
proper_noun(course,noun(course)) --> [course].
proper_noun(cat,noun(cat)) --> [cat].
proper_noun(rat,noun(rat)) --> [rat].
determiner(a,article(a)) --> [a].
determiner(an,article(an)) --> [an].
determiner(the,article(the)) --> [the].
is_helpingverb(is,helping_verb(is)) --> [is].
is_helpingverb(are,helping_verb(are)) --> [are].
is_helpingverb(am,helping_verb(am)) --> [am].
adjective(fat,adjective(fat)) --> [fat].