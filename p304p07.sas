**************************************************************;
*  LESSON 4, PRACTICE 7                                      *;
**************************************************************;

data work.LowAcres work.HighAcres; 
    if _N_=1 then do;  
       if 0 then set pg3.np_acres(keep=ParkName GrossAcres);
       declare hash Acres(dataset:'pg3.np_acres', 
                          ordered:'ascending', multidata:'yes');
       Acres.definekey('GrossAcres'); 
       Acres.definedata('ParkName','GrossAcres');
       Acres.definedone();
       /* declare a hash iterator */

    end;
    do i=1 to 10;
       /* retrieve parks with the lowest number of acres */



    end;
    do i=1 to 10;
       /* retrieve parks with the highest number of acres */
 


    end;
    drop i;
run;

title 'National Parks with Lowest Acreage';
proc print data=work.LowAcres;
run;
title;

title 'National Parks with Highest Acreage';
proc print data=work.HighAcres;
run;
title;

