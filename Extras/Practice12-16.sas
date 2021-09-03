proc freq data = cr.employee order=freq nlevels;
tables city department jobtitle / nocum;
run;

proc freq data = cr.profit;
tables Order_date * Order_source / nocol norow;
format Order_date Monname.;
run;

proc sort data = cr.employee out = se;
by JobTitle;
run;

proc means data = cr.employee sum mean min max maxdec=0;
var Salary;
class JobTitle;
where Department eq "Sales";
ways 0 1;
run;

title;
proc means data=cr.employee noprint;
var Salary;
class Department City;
output out = salary_summary sum=TotalSalary mean=AvgSalary;
ways 2;
run;

proc print data = salary_summary;
run;
