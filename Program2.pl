
:-nl,write('Instructions'),nl,nl,write('Half Subtractor = half(A,B,Diff,Borr).'),nl,write('Half Subtractor truth table = half_table.'),nl,nl,
     write('1->2 Decoder = one_to_two_decoder(A,In,Out1,Out2).'),nl,write('1->2 Decoder truth table = one_to_two_decoder_table.'),nl,nl,
     write('2->4 Decoder = two_to_four_decoder(A,B,In,Out1,Out2).'),nl,write('2->4 Decoder truth table = two_to_four_decoder_table.'),nl,nl,
     write('2 Input Mux = two_input_mux(A,X1,X0,X).'),nl,write('2 Input Mux truth table = two_input_mux_table.'),nl,nl,
     write('4 Input Mux = four_input_mux(B,A,X0,X1,X2,X3,X).'),nl,write('4 Input Mux truth table = four_input_mux_table.'),nl,nl.


not(0,1).
not(1,0).

and(0,0,0).
and(1,0,0).
and(0,1,0).
and(1,1,1).

or(0,0,0).
or(1,0,1).
or(0,1,1).
or(1,1,1).

xor(0,0,0).
xor(1,0,1).
xor(0,1,1).
xor(1,1,0).

half(A,B,Diff,Borr):- xor(A,B,Diff),not(A,NotA),and(NotA,B,Borr).


one_to_two_decoder(A,In,Out1,Out2):- not(A,NotA),and(A,In,Out1),and(NotA,In,Out2).

two_to_four_decoder(A,B,In,Out0,Out1,Out2,Out3):- one_to_two_decoder(A,In,O0,O1),one_to_two_decoder(B,In,O2,O3), and(O0,O2,Out3), and(O0,O3,Out2), and(O1,O2,Out1), and(O1,O3,Out0).

two_input_mux(A,X1,X0,X):- not(A,NotA),and(A,X1,AndAX1),and(NotA,X0,AndNotAX0),or(AndAX1,AndNotAX0,X).

four_input_mux(B,A,X0,X1,X2,X3,X):- two_input_mux(A,X1,X0,Y0), two_input_mux(A,X3,X2,Y1), two_input_mux(B,Y1,Y0,X).


one_to_two_decoder_table :- write('A '),write('In '),write(' Out1 '),write('Out2'),nl,
	                    one_to_two_decoder(0,0,Out1,Out2), write('0 '),write(' 0   '),write(Out1),write('    '),write(Out2),write(' '),nl,
	                    one_to_two_decoder(0,1,Out3,Out4), write('0 '),write(' 1   '),write(Out3),write('    '),write(Out4),write(' '),nl,
			    one_to_two_decoder(1,0,Out5,Out6), write('1 '),write(' 0   '),write(Out5),write('    '),write(Out6),write(' '),nl,
			    one_to_two_decoder(1,1,Out7,Out8), write('1 '),write(' 1   '),write(Out7),write('    '),write(Out8),write(' '),nl.

half_table:- write('A '),write('B '),write(' Diff '),write('Borrow'),nl,
	     half(0,0,Diff1,Borr1),write('0 '),write('0    '),write(Diff1),write('    '),write(Borr1),write(' '),nl,
             half(0,1,Diff2,Borr2),write('0 '),write('1    '),write(Diff2),write('    '),write(Borr2),write(' '),nl,
	     half(1,0,Diff3,Borr3),write('1 '),write('0    '),write(Diff3),write('    '),write(Borr3),write(' '),nl,
	     half(1,1,Diff4,Borr4),write('1 '),write('1    '),write(Diff4),write('    '),write(Borr4),write(' '),nl.

two_to_four_decoder_table:- write('B '),write('A '),write('In  '),write('Out0 '),write('Out1 '),write('Out2 '),write('Out3'),nl,
			    two_to_four_decoder(0,0,0,Out01,Out11,Out21,Out31),write('0 '),write('0  '),write('0   '),write(Out01),write('    '),write(Out11),write('    '),write(Out21),write('    '),write(Out31),nl,
			    two_to_four_decoder(0,0,1,Out02,Out12,Out22,Out32),write('0 '),write('0  '),write('1   '),write(Out02),write('    '),write(Out12),write('    '),write(Out22),write('    '),write(Out32),nl,
			    two_to_four_decoder(0,1,0,Out03,Out13,Out23,Out33),write('0 '),write('1  '),write('0   '),write(Out03),write('    '),write(Out13),write('    '),write(Out23),write('    '),write(Out33),nl,
			    two_to_four_decoder(0,1,1,Out04,Out14,Out24,Out34),write('0 '),write('1  '),write('1   '),write(Out04),write('    '),write(Out14),write('    '),write(Out24),write('    '),write(Out34),nl,
			    two_to_four_decoder(1,0,0,Out05,Out15,Out25,Out35),write('1 '),write('0  '),write('0   '),write(Out05),write('    '),write(Out15),write('    '),write(Out25),write('    '),write(Out35),nl,
			    two_to_four_decoder(1,0,1,Out06,Out16,Out26,Out36),write('1 '),write('0  '),write('1   '),write(Out06),write('    '),write(Out16),write('    '),write(Out26),write('    '),write(Out36),nl,
			    two_to_four_decoder(1,1,0,Out07,Out17,Out27,Out37),write('1 '),write('1  '),write('0   '),write(Out07),write('    '),write(Out17),write('    '),write(Out27),write('    '),write(Out37),nl,
			    two_to_four_decoder(1,1,1,Out08,Out18,Out28,Out38),write('1 '),write('1  '),write('1   '),write(Out08),write('    '),write(Out18),write('    '),write(Out28),write('    '),write(Out38),nl.

two_input_mux_table:- write('A '),write('X1 '),write('X0 '),write('X'),nl,
	              two_input_mux(0,0,0,X1),write('0 '),write('0  '),write('0  '),write(X1),nl,
		      two_input_mux(0,0,1,X2),write('0 '),write('0  '),write('1  '),write(X2),nl,
		      two_input_mux(0,1,0,X3),write('0 '),write('1  '),write('0  '),write(X3),nl,
		      two_input_mux(0,1,1,X4),write('0 '),write('1  '),write('1  '),write(X4),nl,
		      two_input_mux(1,0,0,X5),write('1 '),write('0  '),write('0  '),write(X5),nl,
		      two_input_mux(1,0,1,X6),write('1 '),write('0  '),write('1  '),write(X6),nl,
		      two_input_mux(1,1,0,X7),write('1 '),write('1  '),write('0  '),write(X7),nl,
		      two_input_mux(1,1,1,X8),write('1 '),write('1  '),write('1  '),write(X8),nl.

four_input_mux_table:- write('B '),write('A '),write('X0 '),write('X1 '),write('X2 '),write('X3 '),write('X'),nl,
		       four_input_mux(0,0,0,0,0,0,X1),write('0 '),write('0 '),write('0  '),write('0  '),write('0  '),write('0  '),write(X1),nl,
		       four_input_mux(0,0,0,0,0,1,X2),write('0 '),write('0 '),write('0  '),write('0  '),write('0  '),write('1  '),write(X2),nl,
		       four_input_mux(0,0,0,0,1,0,X3),write('0 '),write('0 '),write('0  '),write('0  '),write('1  '),write('0  '),write(X3),nl,
		       four_input_mux(0,0,0,0,1,1,X4),write('0 '),write('0 '),write('0  '),write('0  '),write('1  '),write('1  '),write(X4),nl,
		       four_input_mux(0,0,0,1,0,0,X5),write('0 '),write('0 '),write('0  '),write('1  '),write('0  '),write('0  '),write(X5),nl,
		       four_input_mux(0,0,0,1,0,1,X6),write('0 '),write('0 '),write('0  '),write('1  '),write('0  '),write('1  '),write(X6),nl,
		       four_input_mux(0,0,0,1,1,0,X7),write('0 '),write('0 '),write('0  '),write('1  '),write('1  '),write('0  ') ,write(X7),nl,
		       four_input_mux(0,0,0,1,1,1,X8),write('0 '),write('0 '),write('0  '),write('1  '),write('1  '),write('1  '),write(X8),nl,
		       four_input_mux(0,0,1,0,0,0,X9),write('0 '),write('0 '),write('1  '),write('0  '),write('0  '),write('0  '),write(X9),nl,
		       four_input_mux(0,0,1,0,0,1,X10),write('0 '),write('0 '),write('1  '),write('0  '),write('0  '),write('1  '),write(X10),nl,
		       four_input_mux(0,0,1,0,1,0,X11),write('0 '),write('0 '),write('1  '),write('0  '),write('1  '),write('0  '),write(X11),nl,
		       four_input_mux(0,0,1,0,1,1,X12),write('0 '),write('0 '),write('1  '),write('0  '),write('1  '),write('1  '),write(X12),nl,
		       four_input_mux(0,0,1,1,0,0,X13),write('0 '),write('0 '),write('1  '),write('1  '),write('0  '),write('0  '),write(X13),nl,
		       four_input_mux(0,0,1,1,0,1,X14),write('0 '),write('0 '),write('1  '),write('1  '),write('0  '),write('1  '),write(X14),nl,
		       four_input_mux(0,0,1,1,1,0,X15),write('0 '),write('0 '),write('1  '),write('1  '),write('1  '),write('0  '),write(X15),nl,
		       four_input_mux(0,0,1,1,1,1,X16),write('0 '),write('0 '),write('1  '),write('1  '),write('1  '),write('1  '),write(X16),nl,
		       four_input_mux(0,1,0,0,0,0,X17),write('0 '),write('1 '),write('0  '),write('0  '),write('0  '),write('0  '),write(X17),nl,
		       four_input_mux(0,1,0,0,0,1,X18),write('0 '),write('1 '),write('0  '),write('0  '),write('0  '),write('1  '),write(X18),nl,
		       four_input_mux(0,1,0,0,1,0,X19),write('0 '),write('1 '),write('0  '),write('0  '),write('1  '),write('0  '),write(X19),nl,
		       four_input_mux(0,1,0,0,1,1,X20),write('0 '),write('1 '),write('0  '),write('0  '),write('1  '),write('1  '),write(X20),nl,
		       four_input_mux(0,1,0,1,0,0,X21),write('0 '),write('1 '),write('0  '),write('1  '),write('0  '),write('0  '),write(X21),nl,
		       four_input_mux(0,1,0,1,0,1,X22),write('0 '),write('1 '),write('0  '),write('1  '),write('0  '),write('1  '),write(X22),nl,
		       four_input_mux(0,1,0,1,1,0,X23),write('0 '),write('1 '),write('0  '),write('1  '),write('1  '),write('0  '),write(X23),nl,
		       four_input_mux(0,1,0,1,1,1,X24),write('0 '),write('1 '),write('0  '),write('1  '),write('1  '),write('1  '),write(X24),nl,
		       four_input_mux(0,1,1,0,0,0,X25),write('0 '),write('1 '),write('1  '),write('0  '),write('0  '),write('0  '),write(X25),nl,
		       four_input_mux(0,1,1,0,0,1,X26),write('0 '),write('1 '),write('1  '),write('0  '),write('0  '),write('1  '),write(X26),nl,
		       four_input_mux(0,1,1,0,1,0,X27),write('0 '),write('1 '),write('1  '),write('0  '),write('1  '),write('0  '),write(X27),nl,
		       four_input_mux(0,1,1,0,1,1,X28),write('0 '),write('1 '),write('1  '),write('0  '),write('1  '),write('1  '),write(X28),nl,
		       four_input_mux(0,1,1,1,0,0,X29),write('0 '),write('1 '),write('1  '),write('1  '),write('0  '),write('0  '),write(X29),nl,
		       four_input_mux(0,1,1,1,0,1,X30),write('0 '),write('1 '),write('1  '),write('1  '),write('0  '),write('1  '),write(X30),nl,
		       four_input_mux(0,1,1,1,1,0,X31),write('0 '),write('1 '),write('1  '),write('1  '),write('1  '),write('0  '),write(X31),nl,
		       four_input_mux(0,1,1,1,1,1,X32),write('0 '),write('1 '),write('1  '),write('1  '),write('1  '),write('1  '),write(X32),nl,
		       four_input_mux(1,0,0,0,0,0,X33),write('1 '),write('0 '),write('0  '),write('0  '),write('0  '),write('0  '),write(X33),nl,
		       four_input_mux(1,0,0,0,0,1,X34),write('1 '),write('0 '),write('0  '),write('0  '),write('0  '),write('1  '),write(X34),nl,
		       four_input_mux(1,0,0,0,1,0,X35),write('1 '),write('0 '),write('0  '),write('0  '),write('1  '),write('0  '),write(X35),nl,
		       four_input_mux(1,0,0,0,1,1,X36),write('1 '),write('0 '),write('0  '),write('0  '),write('1  '),write('1  '),write(X36),nl,
		       four_input_mux(1,0,0,1,0,0,X37),write('1 '),write('0 '),write('0  '),write('1  '),write('0  '),write('0  '),write(X37),nl,
		       four_input_mux(1,0,0,1,0,1,X38),write('1 '),write('0 '),write('0  '),write('1  '),write('0  '),write('1  '),write(X38),nl,
		       four_input_mux(1,0,0,1,1,0,X39),write('1 '),write('0 '),write('0  '),write('1  '),write('1  '),write('0  '),write(X39),nl,
		       four_input_mux(1,0,0,1,1,1,X40),write('1 '),write('0 '),write('0  '),write('1  '),write('1  '),write('1  '),write(X40),nl,
		       four_input_mux(1,0,1,0,0,0,X41),write('1 '),write('0 '),write('1  '),write('0  '),write('0  '),write('0  '),write(X41),nl,
		       four_input_mux(1,0,1,0,0,1,X42),write('1 '),write('0 '),write('1  '),write('0  '),write('0  '),write('1	'),write(X42),nl,
		       four_input_mux(1,0,1,0,1,0,X43),write('1 '),write('0 '),write('1  '),write('0  '),write('1  '),write('0  '),write(X43),nl,
		       four_input_mux(1,0,1,0,1,1,X44),write('1 '),write('0 '),write('1  '),write('0  '),write('1  '),write('1  '),write(X44),nl,
		       four_input_mux(1,0,1,1,0,0,X45),write('1 '),write('0 '),write('1  '),write('1  '),write('0  '),write('0  '),write(X45),nl,
		       four_input_mux(1,0,1,1,0,1,X46),write('1 '),write('0 '),write('1  '),write('1  '),write('0  '),write('1  '),write(X46),nl,
		       four_input_mux(1,0,1,1,1,0,X47),write('1 '),write('0 '),write('1  '),write('1  '),write('1  '),write('0  '),write(X47),nl,
		       four_input_mux(1,0,1,1,1,1,X48),write('1 '),write('0 '),write('1  '),write('1  '),write('1  '),write('1  '),write(X48),nl,
		       four_input_mux(1,1,0,0,0,0,X49),write('1 '),write('1 '),write('0  '),write('0  '),write('0  '),write('0  '),write(X49),nl,
		       four_input_mux(1,1,0,0,0,1,X50),write('1 '),write('1 '),write('0  '),write('0  '),write('0  '),write('1  '),write(X50),nl,
		       four_input_mux(1,1,0,0,1,0,X51),write('1 '),write('1 '),write('0  '),write('0  '),write('1  '),write('0  '),write(X51),nl,
		       four_input_mux(1,1,0,0,1,1,X52),write('1 '),write('1 '),write('0  '),write('0  '),write('1  '),write('1  '),write(X52),nl,
		       four_input_mux(1,1,0,1,0,0,X53),write('1 '),write('1 '),write('0  '),write('1  '),write('0  '),write('0  '),write(X53),nl,
		       four_input_mux(1,1,0,1,0,1,X54),write('1 '),write('1 '),write('0  '),write('1  '),write('0  '),write('1  '),write(X54),nl,
		       four_input_mux(1,1,0,1,1,0,X55),write('1 '),write('1 '),write('0  '),write('1  '),write('1  '),write('0  '),write(X55),nl,
		       four_input_mux(1,1,0,1,1,1,X56),write('1 '),write('1 '),write('0  '),write('1  '),write('1  '),write('1  '),write(X56),nl,
		       four_input_mux(1,1,1,0,0,0,X57),write('1 '),write('1 '),write('1  '),write('0  '),write('0  '),write('0  '),write(X57),nl,
		       four_input_mux(1,1,1,0,0,1,X58),write('1 '),write('1 '),write('1  '),write('0  '),write('0  '),write('1  '),write(X58),nl,
		       four_input_mux(1,1,1,0,1,0,X59),write('1 '),write('1 '),write('1  '),write('0  '),write('1  '),write('0  '),write(X59),nl,
		       four_input_mux(1,1,1,0,1,1,X60),write('1 '),write('1 '),write('1  '),write('0  '),write('1  '),write('1  '),write(X60),nl,
		       four_input_mux(1,1,1,1,0,0,X61),write('1 '),write('1 '),write('1  '),write('1  '),write('0  '),write('0  '),write(X61),nl,
		       four_input_mux(1,1,1,1,0,1,X62),write('1 '),write('1 '),write('1  '),write('1  '),write('0  '),write('1  '),write(X62),nl,
		       four_input_mux(1,1,1,1,1,0,X63),write('1 '),write('1 '),write('1  '),write('1  '),write('1  '),write('0  '),write(X63),nl,
		       four_input_mux(1,1,1,1,1,1,X64),write('1 '),write('1 '),write('1  '),write('1  '),write('1  '),write('1  '),write(X64),nl.










