proc contents data = cr._all_ nods;
run;

proc import file = "&path/payroll.csv" out = payroll dbms=csv replace; guessingrows=max;
run;

proc contents data = payroll;
run;

proc prints data = payroll;
run;

option validvarname=v7;
libname employee xlsx "&path/employee.xlsx";

proc contents data = employee._all_;
run;
