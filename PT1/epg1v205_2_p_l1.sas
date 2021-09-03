title "Categories of Reported Species";

ods graphics on;
ods noproctitle;
title2 "in the Everglades";
proc freq data = pg1.np_species order=freq;
tables Category / plots=freqplot nocum;
where upcase(Species_ID) like '%EVER%' and Category ne 'Vascular Plant';
run;
