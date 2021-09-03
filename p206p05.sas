**************************************************;
*  LESSON 6, PRACTICE 5                          *;
**************************************************;

data IncrExports;
    set pg2.eu_sports;
    where Year=2015 and Country='Belgium' 
          and Sport_Product in ('GOLF','RACKET');
	do year = 2016 to 2025 while (Amt_Export<=Amt_Import);
    Amt_Export=Amt_Export*1.07;
	if(year=2025) or AMt_Export>Amt_Import then output;
	end;

    format Amt_Import Amt_Export comma12.;
run; 

title 'Belgium Golf and Racket Products - 7% Increase in Exports'; 
proc print data=IncrExports;
    var Sport_Product Year Amt_Import Amt_Export;
run;
title;
