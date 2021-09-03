data camping(keep=ParkName Month DayVisits CampTotal) lodging(keep=ParkName Month DayVisits LodgingOther);
set pg2.np_2017;
CampTotal = sum(of Camping:);
if(CampTotal gt 0) then output camping;
if(LodgingOther gt 0) then output lodging;

run;
