proc freq data = pg1.np_summary;
tables Reg Type;
run;

proc univariate data = pg1.np_summary;
var Acres;
run;

proc contents data = pg1.np_summary;
run;

proc print data = pg1.np_summary;
run;
