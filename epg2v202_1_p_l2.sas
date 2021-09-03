data parkTypeTraffic;
set pg2.np_yearlytraffic;
where ParkType in ('National Monument', 'National Park');
if(ParkType eq 'National Monument')
	then MonumentTraffic + Count;
else if(ParkType eq 'National Park')
	then ParkTraffic + Count;
	format MonumentTraffic ParkTraffic comma15.;
run;

title "Accumulating Traffic Totals for Park Types";
proc print data=parkTypeTraffic;
var ParkType ParkName Location Count MonumentTraffic ParkTraffic;
run;
