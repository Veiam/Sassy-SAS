title "Park Types by Region";
proc freq data = pg1.np_codelookup order=freq;
table Type * Region / plot=freqplot(groupby=row scale=grouppercent orient=horizontal) crosslist nocol;
where Type in ('National Historic Site', 'National Monument', 'Natinoal Park');
run;
title;
