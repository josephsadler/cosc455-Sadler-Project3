
:- consult('Program4CourseFunctions.pl'),tell('Program4CourseFunctions.pl.bak'),told.
:- consult('fall16sched.pl'),tell('fall16sched.pl.bak'),listing(course),told.

%course(Name, location(Building, Room),time(Days, StartTime),instructor(LastName).

is_teaching(LastName,Period):- course(_,_,Period,instructor(LastName)).

is_instructor(LastName,Course):- course(Course,_,_,instructor(LastName)).

is_busy(LastName,Days,Hour,Location):- course(_,Location,time(Days,Hour),instructor(LastName)).

cannot_meet(Time,Instructor1,Instructor2):- course(_,_,Time,instructor(Instructor1)),course(_,_,Time,instructor(Instructor2)).

schedule_conflict(Course1,Course2):- course(Course1,_,Time,_),course(Course2,_,Time,_).
