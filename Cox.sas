*model1;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth    ;
*model2;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  ;
*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;

*lipid;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 
lipidlower;

*grs;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 
grs_prs5;

*rs174547;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 
rs174547;

*rs102275;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 
rs102275;



%macro model(factor);
proc phreg data= work.&factor covout out=&factor.cov;
class &factor.q(param=ref ref="1") n_20116_0_0 town alcohol n_738_0_0 eth(param=ref ref="1");
model follow_hcc*ep_hcc(0)=n_31_0_0 &factor.q  &adjust  /RISKLIMITS ;
ods select parameterestimates;
	title "&factor.…˙¥Ê∑÷Œˆ hcc";
	ODS OUTPUT parameterestimates=hcc&factor;
run;
proc phreg data= work.&factor;
class &factor.q(param=ref ref="1") n_20116_0_0 town alcohol n_738_0_0 eth(param=ref ref="1");
model survivaltime*ep_cld_death(0)=n_31_0_0 &factor.q  &adjust /RISKLIMITS ;
ods select parameterestimates;
ODS OUTPUT parameterestimates=cld_DEATH&factor;
	title "&factor.∏Œ≤°À¿Õˆ";
run;

%mend model;

%model(n_23451_0_0)
%model(N_23452_0_0)
%model(N_23454_0_0)
%model(N_23455_0_0)
%model(N_23459_0_0)
%model(N_23456_0_0) /*—«”ÕÀ·¶ÿ6*/
%model(N_23457_0_0) /*DHA¶ÿ3*/




%macro model(factor);
proc phreg data= work.&factor covout out=&factor.cov;
class n_20116_0_0 town alcohol n_738_0_0 ;
model follow_hcc*ep_hcc(0)=n_31_0_0 &factor.q  &adjust  /RISKLIMITS ;
ods select parameterestimates;
	title "&factor.…˙¥Ê∑÷Œˆ hcc";
	ODS OUTPUT parameterestimates=hcc&factor;
run;
proc phreg data= work.&factor;
class  n_20116_0_0 town alcohol n_738_0_0  ;
model survivaltime*ep_cld_death(0)=n_31_0_0 &factor.q  &adjust /RISKLIMITS ;
ods select parameterestimates;
ODS OUTPUT parameterestimates=cld_DEATH&factor;
	title "&factor.cldÀ¿Õˆ";
run;

%mend model;

%model(n_23451_0_0)
%model(N_23452_0_0)
%model(N_23454_0_0)
%model(N_23455_0_0)
%model(N_23459_0_0)
/*“‘œ¬≤π≥‰≤ƒ¡œ*/
%model(N_23456_0_0) /*—«”ÕÀ·¶ÿ6*/
%model(N_23457_0_0) /*DHA¶ÿ3*/



























