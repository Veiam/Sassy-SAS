proc print data = pg2.np_codelookup;
run;

proc print data = pg2.np_2016;
run;

proc sort data = pg2.np_2016 out=work.sortedCodes;
by ParkCode;
run;

proc sort data = pg2.np_codelookup out=work.Sorted_code_2016;
by ParkCode;
run;

data parkStats (keep=ParkCode ParkName Year Month DayVisits) parkOther(keep=ParkCode ParkName);
merge work.Sorted_code_2016(in=inCode) work.sortedCodes(in=in2016);
by ParkCode;
if in2016 = 1
then output parkStats;
else output parkOther;
run;
