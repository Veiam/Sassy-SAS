data cuyahoga_maxtraffic;
set pg2.np_monthlytraffic;
where ParkName eq "Cuyahoga Valley NP";
retain TrafficMax 0;
if(Count > TrafficMax)
then do;
	TrafficMax = Count;
	MonthMax = Month;
	LocationMax = Location;
end;

format Count TrafficMax comma12.;

keep Location Month Count TrafficMax MonthMax LocationMax;
run;
