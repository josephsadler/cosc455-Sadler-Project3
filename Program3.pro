
path(fresno,omaha).
path(omaha,albany).
path(omaha,atlanta).
path(atlanta,boston).
path(fresno,seattle).
path(seattle,omaha).
path(seattle,dallas).
path(dallas,albany).
path(fresno,boston).
path(atlanta,dallas).
path(dallas,seattle).
path(atlanta,albany).

flight(From,To):- path(From,To).
flight(From,To):- path(From,Stop),flight(Stop,To).


