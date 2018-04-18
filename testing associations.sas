/* bivarite analysis*/

/* chi square test*/

* plotting data to look at distribution of pesticides within each group;
proc sort data=data;
by coi_gender; 
run;
proc boxplot data=data24;
plot ln_mean_cat*gender ;
run;

proc freq data=data;
tables gender*ln_mean_cat/ measures chisq;
run;

/* weighted kappa statistic - used for ordered variables*/
proc sort data=data2;
by true_obs;
run;

proc freq data=data2;
table test_obs*true_obs / scores= rank agree(WT=FC)  nopercent nocol norow ;
run;

/* Spearman Correlation*/
proc corr data=data spearman;
var sample1 sample2;
run;

/* Kruskal-Wallis test*/
proc npar1way data = data;
  class raceethnicity ;
  var serum_gexpression;
run;
