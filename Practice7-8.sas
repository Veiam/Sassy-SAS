proc print data = cr.employee_raw;
where Country not in ("US", "AU");
run;

proc freq data = cr.employee_raw order=freq nlevels;
	tables EmpID Country Department;
run;

proc print data = cr.employee_raw;
var TermDate HireDate;
where HireDate gt TermDate and TermDate ne .;
run;

proc sort data = cr.employee_raw noduprecs out=emp_sort;
by _all_;
run;

proc print data=emp_sort;
var HireDate;
where JobTitle like "%Logistics%";
format HireDate date9.;
run;

proc means data=emp_sort;
var Salary;
format HireDate date10.;
where HireDate GE "01/JAN/2010"d and TermDate eq .;
run;

proc univariate data=emp_sort;
var Salary;
run;
