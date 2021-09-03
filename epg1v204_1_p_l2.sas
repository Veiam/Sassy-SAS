data fox;
set pg1.np_species;
where Category eq "Mammal" and upcase(Common_names) like "%FOX%" and upcase(Common_names) not like "%SQUIRREL%";
drop Category Record_Status Occurence Nativeness;
by Common_names;
run;

proc print data = fox;
run;

proc sort data = fox;
by Common_Names;
run;
