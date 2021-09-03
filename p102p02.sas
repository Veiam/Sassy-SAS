option validvarname=v7;
proc import datafile = "&path/np_traffic.csv"
	dbms = csv
	out = traffic
	replace;
	guessingrows=max;
run;

proc contents data=traffic;
run;
