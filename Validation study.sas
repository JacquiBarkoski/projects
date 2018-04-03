/* Validation analysis*/

* 1. calculating sensitivity and specificty;
proc sort data=ME;
by descending E_pregfogIn descending FogPreg ;
run;

title 'sensitivity';
proc freq data=ME;
where FogPreg=1;
tables E_pregfogIn/ binomial (level='1');
exact binomial;
run;

title 'specificity';
proc freq data=ME;
where FogPreg=0;
tables E_pregfogIn/ binomial (level='0');
exact binomial;
run;

* 2.  weighted kappa statistic - used for ordered variables;

proc sort data=data2;
by true_obs;
run;

proc freq data=data2;
table test_obs*true_obs / scores= rank agree(WT=FC)  nopercent nocol norow ;
run;
