***********************************************************;
*  LESSON 4, PRACTICE 7                                   *;
*    a) Submit the program and view the generated output. *;
*    b) In the DATA step, use IF-THEN/ELSE statements to  *;
*       create a new column, ParkType, based on the value *;
*       of Type.                                          *;
*       NM -> Monument                                    *;
*       NP -> Park                                        *;
*       NPRE, PRE, or PRESERVE -> Preserve                *;
*       NS -> Seashore                                    *;
*       RVR or RIVERWAYS -> River                         *;
*    c) Modify the PROC FREQ step to generate a frequency *;
*       report for ParkType.                              *;
***********************************************************;

data park_type;
	set pg1.np_summary;
	*Add IF-THEN-ELSE statements;
	select (Type);
	when('NM') ParkType = 'Monument';
	when('NP') ParkType = 'Park';
	when('NPRE', 'PRE', 'PRESERVE') ParkType = 'Preserve';
	when('NS') ParkType = 'Seashore';
	when('RVR','RIVERWAYS') ParkType = 'River';
	end;
run;

proc freq data=park_type;
	tables ParkType;
run;

proc print data = park_type;
run;

data park_type;
    set pg1.np_summary;
    length ParkType $ 8;
    if Type='NM' then ParkType='Monument';
    else if Type='NP' then ParkType='Park';
    else if Type in ('NPRE', 'PRE', 'PRESERVE') then
        ParkType='Preserve';
    else if Type in ('RVR', 'RIVERWAYS') then ParkType='River';
    else if Type='NS' then ParkType='Seashore';
run;

proc freq data=park_type;
    tables ParkType;
run;
