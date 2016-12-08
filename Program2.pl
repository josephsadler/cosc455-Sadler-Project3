
not(0,1).
not(1,0).

and(0,0,0).
and(1,0,0).
and(0,1,0).
and(1,1,1).

nand(0,0,1).
nand(1,0,1).
nand(0,1,1).
nand(1,1,0).


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

two_input_mux(A,X0,X1,X):- not(A,NotA),and(A,X1,AndAX1),and(NotA,X0,AndNotAX0),or(AndAX1,AndNotAX0,X).

four_input_mux(B,A,X0,X1,X2,X3,X):- two_input_mux(A,X0,X1,Y0), two_input_mux(A,X2,X3,Y1), two_input_mux(B,Y0,Y1,X).

