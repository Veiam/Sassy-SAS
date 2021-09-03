data np_summary2;
set pg1.np_summary;
parktype = scan(parkname, -1);
Keep reg type parkname parktype;
run;

proc print data = np_summary2;
run;
