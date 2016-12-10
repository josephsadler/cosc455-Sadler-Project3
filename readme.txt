Program 1:
	To translate a single character, translation(Chinese,English).
	translation(Chinese,zero).
		Chinese = ling
	translation(ling,English).
		English = zero

	To translate a list, translate(Chinese,English).
	translate([qi,ling,si,si,wu,san,liu],English).
		English = [seven,zero,four,four,five,three,six]

	translate(Chinese,[four,five,five]). 
		Chinese = [si,wu,wu]

Program 2:
	Half Subtractor truth table = half_table.
	Half Subtractor = half(A,B,Diff,Borr). 
		half(1,0,Diff,Borr).
			Diff = 1
			Borr = 0

	1->2 Decoder truth table = one_to_two_decoder_table.
     	1->2 Decoder = one_to_two_decoder(A,In,Out1,Out2). 
		one_to_two_decoder(1,0,Out1,Out2).
			Out1 = Out2 = 0
     	
	2->4 Decoder truth table = two_to_four_decoder_table. 
	2->4 Decoder = two_to_four_decoder(A,B,In,Out1,Out2,Out3,Out4). 
		two_to_four_decoder(0,1,1,Out1,Out2,Out3,Out4).
			Out1 = Out3 = Out4 = 0
			Out2 = 1

     	
	2 Input Mux truth table = two_input_mux_table.
	2 Input Mux = two_input_mux(A,X1,X0,X). 
		two_input_mux(0,0,1,X).
			X = 1
     	
	4 Input Mux truth table = four_input_mux_table.
	4 Input Mux = four_input_mux(B,A,X0,X1,X2,X3,X). 	
		four_input_mux(0,0,1,0,0,0,0,X).
			X = 1

Program 3:
	To see if there is a path from one city to another, flight(From,To).
	flight(fresno,omaha).
		true
	flight(omaha,fresno).
		false

Program 4:
	is_teaching(LastName, Period)
		is_teaching(dehlinger, Period).
			Period = time(t, 1100)
			Period = time(w, 1900)
			Period = time(r, 1100)

	is_instructor(LastName, Course)
		is_instructor(Who, cosc455).
			Who = dehlinger

		is_instructor(dehlinger, Class).
			Class = cosc455 
			Class = cosc612 

	is_busy(LastName, Days, Hour, Location)
		is_busy(dehlinger, w, 1900, Where).
			Where = location(yr7800, 125)

		is_busy(Who, t, 1100, location(yr7800, 205)).
			Who = taylor

	cannot_meet(Time, Instructor1, Instructor2)
		cannot_meet(time(t,1100),dehlinger, taylor). 
			true

	schedule_conflict(Course1, Course2) 
		schedule_conflict(cosc612, cosc455). 
			false
		schedule_conflict(cosc439,cosc578).
			true

	To load the database, load_courses.

	To save changes made to the database, save_courses.
	
	To list the courses in the database, list_courses.

	To add a class, add_course(Name,Location,Time,Instructor).
		add_course(cosc123,location(yr7800,123),time(m,1000),instructor(name)).

	To delete a class, delete_course(Name,Location,Time,Instructor).
		delete_course(cosc465,location(yr7800, 202),time(r, 1230),instructor(davani)).

Program 6:
	To find the household income of a family, family_income(FamilyName,Income).
		family_income(simpson,Income).
			Income = 50500	
	