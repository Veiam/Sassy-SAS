proc sort data=sashelp.fish out=fish_sort;
by Species;
run;

data fish_sort;
set sashelp.fish;
Length = round(mean(of Length1--Length3),.01);
run;

proc print data =fish_sort;
run;

proc means data=fish_sort mean maxdec=2;
var Length;
class Species;
format Length 12.2;
run;

data outfield;
    set sashelp.baseball;
    where substr(Position, 2, 1)="F";
    Player=catx(" ", scan(Name, 2), scan(Name, 1));
    BatAvg=round(nHits/nAtBat, .001);
    keep Player BatAvg Position;
run;

proc sort data=outfield;
    by descending BatAvg;
run;
