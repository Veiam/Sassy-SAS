data camping_wide ;
set pg2.np_2016camping;
by ParkName;
retain ParkName Tent RV Backcountry;
format Tent RV Backcountry comma12.;
if CampType ='Tent' then do;
Tent = CampCount;
end;
else if CampType ='RV' then do;
RV = CampCount;
end;
else do;
Backcountry = CampCount;
end;

if last.ParkName = 1;
Keep ParkName Tent RV Backcountry;
run;

proc print data = camping_wide;
run;
