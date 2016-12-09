
load_courses:- consult('fall16sched.pl'),tell('fall16sched.pl.bak'),listing(course),told.

list_courses:- listing(course).

add_course(Name,Location,Time,Instructor):- assert(course(Name,Location,Time,Instructor)),write('Course added.').

delete_course(Name,Location,Time,Instructor):- retract(course(Name,Location,Time,Instructor)),write('Course removed.').

save_courses:- tell('fall16sched.pl'),listing(course),told.
