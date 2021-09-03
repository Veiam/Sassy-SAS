data q3_sales;
    set cr.m7_sales cr.m8_sales(rename=(Employee_ID=EmpID)) cr.m9_sales;
run;

proc freq data=q3_sales;
    table Order_Type;
run;

proc sort data=cr.employee_addresses(rename=(Employee_ID=EmpID)) out=address_sort;
    by EmpID;
run;

data emp_full;
    merge cr.employee(in=e) address_sort;
    by EmpID;
    if e;
run;
