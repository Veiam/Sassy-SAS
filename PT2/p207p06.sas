**************************************************;
*  LESSON 7, PRACTICE 6                          *;
**************************************************;

proc sort data=pg2.weather_highlow out=sort_highlow;
	by Location;
run;


proc print data =sort_highlow;
run;

proc transpose data =sort_highlow out=work.lows(drop=_name_) let;
	by Location;
	id Month;
	var Temp;
run;

proc transpose data=sort_highlow out=lows let;
    by location;
    id Month;
run;
proc print data=work.lows;
run;
