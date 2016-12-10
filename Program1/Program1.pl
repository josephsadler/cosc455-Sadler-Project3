

%Facts
translation(ling,zero).
translation(yi,one).
translation(er,two).
translation(san,three).
translation(si,four).
translation(wu,five).
translation(liu,six).
translation(qi,seven).
translation(ba,eight).
translation(jiu,nine).
translation(shi,ten).

%Base case
translate([],[]).

%Recursive case
translate([Chead|Ctail],[Ehead|Etail]):- translation(Chead,Ehead),translate(Ctail,Etail).
