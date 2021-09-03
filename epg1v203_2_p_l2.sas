

proc freq data = pg1.np_species;
where Species_ID like 'YOSE%' and Category EQ 'Mammal';
tables Abundance Conservation_Status;
run;

%let ParkCode = YOSE;
%let SpeciesCat = Mammal;


proc print data = pg1.np_species;
where Species_ID like "&ParkCode%" and Category EQ "&SpeciesCat";
var SPECIES_ID CATEGORY SCIENTIFIC_NAME COMMON_NAMES;
run;

%let ParkCode = ZION;
%let SpeciesCat = Bird;


proc print data = pg1.np_species;
where Species_ID like "&ParkCode%" and Category EQ "&SpeciesCat";
var SPECIES_ID CATEGORY SCIENTIFIC_NAME COMMON_NAMES;
run;

