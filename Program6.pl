
:- style_check(-singleton).

salary([jacqueline, bouvier], 23000).
salary([patty, bouvier], 23000).
salary([selma, bouvier], 23000).
salary([montgomery, burns], 1000000).
salary([larry, burns], 50000).
salary([ned, flanders], 40000).
salary([maude, flanders], 42000).
salary([rod, flanders], 0).
salary([barney, gumble], 40000).
salary([edna, krabappel], 30000).
salary([herschel, krustofski], 300000).
salary([helen, lovejoy], 30000).
salary([jessica, lovejoy], 0).
salary([timothy, lovejoy], 150000).
salary([apu, nahasapeemapetilon], 150000).
salary([jamshed, nahasapeemapetilon], 0).
salary([manjula, nahasapeemapetilon], 120000).
salary([pahusacheta, nahasapeemapetilon], 0).
salary([sanjay, nahasapeemapetilon], 0).
salary([bartholomew, simpson], 0).
salary([homer, simpson], 40000).
salary([lisa, simpson], 500).
salary([maggie, simpson], 0).
salary([marge, simpson], 10000).


family_income(Family,Income):- collect_income(Family,Salary_List),add_incomes(Salary_List,Income).

add_incomes([],0).
add_incomes([Shead|Stail],Income):- add_incomes(Stail,Rest),Income is Shead+Rest.

collect_income(Family,Salary_List):- findall(Income,salary([_|[Family|_]],Income),Salary_List).
