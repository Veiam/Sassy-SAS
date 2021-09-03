proc sort data=sashelp.stocks out=stocks_sort;
    by Stock Date;
    where year(Date)=2005;
run;

data stocks_total;
    set stocks_sort;
    by Stock;
    if first.Stock then YTDVolume=0;
    YTDVolume+Volume;
    format YTDVolume comma15.;
run;

proc sort data=sashelp.shoes out=shoes_sort;
	by Product Sales;
run;

data highlow;
	set shoes_sort;
	by Product;
	if(first.Product) then do; HighLow = "Low"; output; end;
	if(last.Product) then do; HighLow = "High"; output; end;
run;

proc print data=highlow;
run;
