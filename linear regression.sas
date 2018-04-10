/* linear regression*/

proc glm data=pyrdata;
class PrePregBMIcat(ref=0);
model tot_specimens=PrePregBMIcat/ solution;
run;quit;


/* robust linear regression - used for analysis due to extreme observations*/
proc robustreg data=ELEAT method=m  ORDER=data;
class ELEAT_Preg ;
   model Ln_mean= ELEAT_Preg; 
run;
