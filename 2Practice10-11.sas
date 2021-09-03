proc format;
value BMIRANGE low-<18.5 = "Underweight"
				18.5-24.9 = "Normal"
				25 - 29.9 = "Overweight"
				30 - High = "Obese"
				;
run;

proc freq data =sashelp.bmimen;
where Age ge 21;
tables BMI;
format BMI BMIRANGE.;
run;

data contfmt;
set cr.continent_codes;
FMTNAME = "contfmt";
START = Code;
LABEL = Continent;
run;

proc format cntlin = contfmt;
run;

proc means data=sashelp.demographics sum;
var Pop;
Class Cont;
format Cont contfmt.;
run;
