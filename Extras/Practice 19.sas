proc export data = cr.employee_current outfile="&outpath/employee_current.csv" dbms=csv replace;
run;
