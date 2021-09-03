data shoes_future;
set cr.shoes_summary;
do Year = 1 to 5;
ProfitPerStore+(ProfitPerStore*0.03);
output;
end;
drop TotalSTores TotalProfit;
run;

proc print data =shoes_future;
run;
