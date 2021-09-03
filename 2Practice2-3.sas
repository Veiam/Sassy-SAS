data dead alive(drop=DeathCause AgeAtDeath);
set sashelp.heart;
if Status = "Dead" then output dead;
else if Status = "Alive" then output alive;
drop Status;
run;

data salary;
set cr.employee_current;


proc sort data = cr.employee_current out=employeeCur;
by Department;
run;

proc means data=cr.employee_current noprint;
	var Salary;
	class Department;
	output out=salary sum=TotalSalary;
	ways 1;
	run;



data salary;
set employeeCur(keep=Department Salary);
by Department;
retain TotalSalary;
TotalSalary + Salary;
if last.Department then do;
output;
TotalSalary =0;
end;
drop Salary;
run;

data salaryforecast;
set salary;
Year = 1;
TotalSalary + (TotalSalary*0.03);
output;
Year = 2;
TotalSalary + (TotalSalary*0.03);
output;
Year = 3;
TotalSalary + (TotalSalary*0.03);
output;
format TotalSalary dollar15.;
run;

proc print data=salaryforecast;
run;
