data sales;
set cr.employee;
length SalesLevel $ 6;
where Department = "Sales" and TermDate is missing;
select(JobTitle);
when("Sales Rep. I") SalesLevel = "Entry";
when("Sales Rep. II", "Sales Rep. III") SalesLevel = "Middle";
when("Sales Rep. IV") SalesLevel = "Senior";
otherwise SalesLevel = "";
end;
run;

proc freq data = sales;
tables SalesLevel;
run;

data bonus;
set cr.employee;
YearsEmp = yrdif(HireDate, "01JAN2019"d, "AGE");

if(YearsEmp >10) then do;
Bonus = Salary*0.03;
Vacation = 20;
end;
else do;
Bonus = Salary*0.02;
Vacation = 15;
end;

keep Bonus Vacation YearsEmp;

run;

proc sort data = bonus;
by descending YearsEmp ;
run;

proc print data=bonus;
run;

proc freq data=bonus;
tables Vacation;
run;
