proc transpose data=cr.employee_training out=training_narrow;


proc print data = cr.employee_training;
run;

 data training_narrow;
 set cr.employee_training;
 type = "Compliance_Training";
 date = Compliance_Training;
 output;
 type = "Corporate_Security";
 date = Corporate_Security;
 output; 
type = "On_the_Job_Safety";
 date = On_the_Job_Safety;
 output;
 format date MONNAME12.;
 run;

 proc freq data = training_narrow;
 tables date;
 run;
