/*ODS TRACE ON;*/
/*proc univariate data = pg1.eu_occ;*/
/*var camp;*/
/*run;*/
/*ODS TRACE OFF;*/

ODS SELECT ExtremeObs;
proc univariate data = pg1.eu_occ nextrobs=10 ;
var camp;
run;
