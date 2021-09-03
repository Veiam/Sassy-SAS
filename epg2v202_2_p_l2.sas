proc sort data=sashelp.shoes out=shooes_sorted;
by Region Product;
run;

data profitsummary;
set shooes_sorted;
by Region Product;
if first.Product = 1 then TotalProfit = 0;
Profit = Sales - Returns;
TotalProfit + Profit;
if last.product = 1;
format Profit TotalProfit dollar12.;
keep Region Product TotalProfit;
run;
