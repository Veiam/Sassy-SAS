proc import datafile="&path/np_traffic.dat" dbms = dlm out = traffic2 replace;
guessingrows = max;
delimiter = "|";
run;
