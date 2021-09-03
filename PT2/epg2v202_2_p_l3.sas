proc sort data=pg2.np_acres out=np_acres_sorted(keep=Region ParkName State GrossAcres);
by Region ParkName;
run;

data singlestate multistate;
set np_acres_sorted;
by Region ParkName;
if first.ParkName and last.ParkName then output singlestate;
else output multistate;
format GrossAcres comma12.;
run;

