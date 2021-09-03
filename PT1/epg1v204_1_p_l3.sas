%let species = Bird;

data mammal;
set pg1.np_species;
where Category eq "&species";
drop Abundance Seasonality Conservation_Status;
run;

Proc freq data = mammal;
table Record_Status;
run;

proc print data = mammal;
run;
