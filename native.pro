% expert system for diagnosting eye diseases
% Arash Kayhani && Mohammad Reza Karimi dastjerdi.
:- op(900,xfy, :).
:- initialization(main).

main :-
	greeting,
	repeat,
	write('> '),
	read(X),
	do(X),
	X = quit.

greeting :-
	write('This is the native Prolog shell.'), nl,
	native_help.

do(help) :- native_help, !.
do(load) :- load_kb, !.
do(solve) :- solve, !.
do(how(Goal)) :- how(Goal), !.
do(whynot(Goal)) :- whynot(Goal), !.
do(quit).
do(X) :-
	write(X),
	write(' is not a legal command.'), nl,
	fail.

native_help :-
	write('Type help. load.(for load your knowledge base solve. how(Goal). whynot(Goal). or quit.'),nl,
	write('at the prompt.'), nl.

load_kb :-
	write('Enter file name in single quotes (ex. ''problems.pro''.): '),
	read(F),
	reconsult(F).
solve :-
retractall(known(_, _, _)),

	prove(top_goal(X),[]),
	write('The answer is '),write(X),nl.
solve :-
	write('No answer found.'),nl.



ask(A,_):-
knownn(yes, A,yes), % succeed if true
!. % stop looking

ask(A,_):-
knownn(_, A,yes), % fail if false
!, fail.


ask(A,Hist) :-
	write(A ),                     % if we get here, we need to ask.
	write('? (yes or no) '),
	get_user(Y,Hist),                      % get the answer
	asserta(knownn(Y,A,yes)),          % remember it so we dont ask again.
	Y = yes.                        % succeed or fail based on answer.


ask(Attribute,Value,_) :-
	knownn(yes,Attribute,Value),     % succeed if we known its true
	!.                              % and dont look any further
ask(Attribute,Value,_) :-
	knownn(_,Attribute,Value),       % fail if we known its false
	!, fail.

ask(Attribute,_,_) :-
	\+ multivalued(Attribute),
	knownn(yes,Attribute,_),         % fail if its some other value.
	!, fail.                        % the cut in clause #1 ensures
					% this is the wrong value
ask(A,V,Hist) :-
	write(A :V),                     % if we get here, we need to ask.
	write('? (yes or no) '),
	get_user(Y,Hist),                      % get the answer
	asserta(knownn(Y,A,V)),          % remember it so we dont ask again.
	Y = yes.                        % succeed or fail based on answer.



menuask(Attribute,Value,_,_) :-
	knownn(yes,Attribute,Value),     % succeed if we known
	!.
menuask(Attribute,_,_,_) :-
	knownn(yes,Attribute,_),         % fail if its some other value
	!, fail.

menuask(Attribute,AskValue,Menu,Hist) :-
	nl,write('What is the value for '),write(Attribute),write('?'),nl,
	display_menu(Menu),
	write('Enter the number of choice> '),
	get_user(Num,Hist),nl,
	pick_menu(Num,AnswerValue,Menu),
	asserta(knownn(yes,Attribute,AnswerValue)),
	AskValue = AnswerValue.         % succeed or fail based on answer

display_menu(Menu) :-
	disp_menu(1,Menu), !.             % make sure we fail on backtracking

disp_menu(_,[]).
disp_menu(N,[Item | Rest]) :-            % recursively write the head of
	write(N),write('  : '),write(Item),nl, % the list and disp_menu the tail
	NN is N + 1,
	disp_menu(NN,Rest).

pick_menu(N,Val,Menu) :-
	integer(N),                     % make sure they gave a number
	pic_menu(1,N,Val,Menu), !.      % start at one
pick_menu(Val,Val,_).             % if they didn't enter a number, use
	                                % what they entered as the value

pic_menu(_,_,none_of_the_above,[]).  % if we've exhausted the list
pic_menu(N,N, Item, [Item|_]).       % the counter matches the number
pic_menu(Ctr,N, Val, [_|Rest]) :-
	NextCtr is Ctr + 1,                % try the next one
	pic_menu(NextCtr, N, Val, Rest).

get_user(X,Hist) :-  %get user prompt
	repeat,
	write('> '),
	read(X),
	process_ans(X,Hist), !.

process_ans(why,Hist) :-  %check if user asks for why, show it!
	write_list(4,Hist), !, fail.
process_ans(_,_).


prove(true,_) :- !.
prove((Goal,Rest),Hist) :-
    prov(Goal,[Goal|Hist]),
    prove(Rest,Hist).
prove(Goal,Hist) :-
    prov(Goal,[Goal|Hist]).
prov((_,_),_) :- !, fail.
prov(true,_) :- !.
prov(menuask(X,Y,Z),Hist) :- menuask(X,Y,Z,Hist), !.
prov(ask(X,Y),Hist) :- ask(X,Y,Hist), !.
prov(ask(X),Hist) :- ask(X,Hist), !.
prov(Goal,Hist) :-
	clause(Goal,Body),
	prove(Body,Hist).


how(Goal) :-
	clause(Goal,Body),
	prove(Body,[]),
	write_body(4,Body).

whynot(Goal) :-
	clause(Goal,Body),
	write_line([Goal,' fails because: ']),
	explain(Body).
whynot(_).

explain(true).
explain((Head,Body)) :-
	check(Head),
	explain(Body).

check(H) :- prove(H,[]), write_line([H,succeeds]), !.
check(H) :- write_line([H,fails]), fail.

write_list(_,[]).
write_list(N,[H|T]) :-
	tab(N),write(H),nl,
	write_list(N,T).

write_body(N,(First,Rest)) :-
	tab(N),write(First),nl,
	write_body(N,Rest).
write_body(N,Last) :-
	tab(N),write(Last),nl.

write_line(L) :-
	flatten(L,LF),
	write_lin(LF).

write_lin([]) :- nl.
write_lin([H|T]) :-
	write(H), tab(1),
	write_lin(T).

flatten([],[]) :- !.
flatten([[]|T],T2) :-
	flatten(T,T2), !.
flatten([[X|Y]|T], L) :-
	flatten([X|[Y|T]],L), !.
flatten([H|T],[H|T2]) :-
	flatten(T,T2).
