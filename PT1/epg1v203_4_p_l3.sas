proc sort data = pg1.eu_occ (keep=GEO COUNTRY) out=countrylist nodupkey;
by Geo Country;
run;

proc print data = countrylist ;
run;
