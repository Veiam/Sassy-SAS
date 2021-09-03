proc sort data = pg1.np_largeparks out=park_clean dupout=park_dups nodupkey;
by _ALL_;
run;
