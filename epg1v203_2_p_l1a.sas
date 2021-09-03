proc print data = pg1.eu_occ;
where hotel is missing and shortstay is missing and camp is missing;
run;

proc print data = pg1.eu_occ;
where hotel gt 40000000;
run;
