*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0 eth  
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;


%macro model3(NMR,follow,factor);
proc sort data=work.&NMR._0_0;
by fib_fib4;
run;
proc phreg data= work.&nmr._0_0;
class   alcohol activity n_20116_0_0 n_738_0_0;
model &follow*&factor(0)= &nmr._sd  &adjust   /RISKLIMITS ;
by fib_fib4;
	title "&factor  fib_fib4" ;
	ods select parameterestimates;
		ODS OUTPUT parameterestimates=work.SUBGROUP&factor.&nmr;
run;
%mend model3;
%MODEL3(n_23451,follow_hcc,ep_hcc)
%MODEL3(n_23452,follow_hcc,ep_hcc)
%MODEL3(n_23454,follow_hcc,ep_hcc)
%MODEL3(n_23455,follow_hcc,ep_hcc)

%MODEL3(n_23451,survivaltime,ep_cld_death)
%MODEL3(n_23452,survivaltime,ep_cld_death)
%MODEL3(n_23454,survivaltime,ep_cld_death)
%MODEL3(n_23455,survivaltime,ep_cld_death)


*model3;
*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0   
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;

%macro model3(NMR,follow,factor);
proc sort data=work.&NMR._0_0;
by SCORE1_prs5;
run;
proc phreg data= work.&nmr._0_0;
class   alcohol activity n_20116_0_0 n_738_0_0;
model &follow*&factor(0)= &nmr._sd  &adjust   /RISKLIMITS ;
by grs_prs5;
	title "&factor  grs_prs5 四等分" ;
	ods select parameterestimates;
		ODS OUTPUT parameterestimates=work.SUBGROUP&factor.&nmr;
run;
%mend model3;
%MODEL3(n_23451,follow_hcc,ep_hcc)
%MODEL3(n_23452,follow_hcc,ep_hcc)
%MODEL3(n_23454,follow_hcc,ep_hcc)
%MODEL3(n_23455,follow_hcc,ep_hcc)

%MODEL3(n_23451,survivaltime,ep_cld_death)
%MODEL3(n_23452,survivaltime,ep_cld_death)
%MODEL3(n_23454,survivaltime,ep_cld_death)
%MODEL3(n_23455,survivaltime,ep_cld_death)


%macro model3(NMR,follow,factor);
proc sort data=work.&NMR._0_0;
by rs174547;
run;
proc phreg data= work.&nmr._0_0;
class   alcohol activity n_20116_0_0 n_738_0_0;
model &follow*&factor(0)= &nmr._sd  &adjust   /RISKLIMITS ;
by rs174547;
	title "&factor  rs174547" ;
	ods select parameterestimates;
		ODS OUTPUT parameterestimates=work.SUBGROUP&factor.&nmr;
run;
%mend model3;
%MODEL3(n_23451,follow_hcc,ep_hcc)
%MODEL3(n_23452,follow_hcc,ep_hcc)


%MODEL3(n_23451,survivaltime,ep_cld_death)
%MODEL3(n_23452,survivaltime,ep_cld_death)




%macro model3(NMR,follow,factor);
proc sort data=work.&NMR._0_0;
by rs102275;
run;
proc phreg data= work.&nmr._0_0;
class   alcohol activity n_20116_0_0 n_738_0_0;
model &follow*&factor(0)= &nmr._sd  &adjust   /RISKLIMITS ;
by rs102275;
	title "&factor rs102275" ;
	ods select parameterestimates;
		ODS OUTPUT parameterestimates=work.SUBGROUP&factor.&nmr;
run;
%mend model3;

%MODEL3(n_23454,follow_hcc,ep_hcc)
%MODEL3(n_23455,follow_hcc,ep_hcc)


%MODEL3(n_23454,survivaltime,ep_cld_death)
%MODEL3(n_23455,survivaltime,ep_cld_death)









%macro additive2dum_LOGISTIC(dat,a,b,statues);
data P1;
set &dat;xx=&a*&b;
run;
PROC phreg OUTEST=EST DATA=P1 COVOUT;
class alcohol n_738_0_0 activity n_20116_0_0  /param=ref;
MODEL follow_&statues*ep_&statues(0)= &a &b xx 
&adjust / risklimits  ;
title "&b 的交互作用 &a hcc";
ods select parameterestimates;
ods OUTPUT parameterestimates=WORK.INESLD&a.&b;
RUN;
%mend additive2dum_LOGISTIC;


*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0   
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;

%additive2dum_LOGISTIC(n_23451_0_0,score1_prs5_sd,n_23451_sd,HCC);
%additive2dum_LOGISTIC(n_23452_0_0,score1_prs5_sd,n_23452_sd,HCC);
%additive2dum_LOGISTIC(n_23454_0_0,score1_prs5_sd,n_23454_sd,HCC);
%additive2dum_LOGISTIC(n_23455_0_0,score1_prs5_sd,n_23455_sd,HCC);


%additive2dum_LOGISTIC(n_23451_0_0,RS174547,n_23451_sd,HCC);
%additive2dum_LOGISTIC(n_23452_0_0,RS174547,n_23452_sd,HCC);
%additive2dum_LOGISTIC(n_23454_0_0,RS102275,n_23454_sd,HCC);
%additive2dum_LOGISTIC(n_23455_0_0,RS102275,n_23455_sd,HCC);



*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0  eth1 
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;
%additive2dum_LOGISTIC(n_23451_0_0,fib_fib4,n_23451_sd,hcc);
%additive2dum_LOGISTIC(n_23452_0_0,fib_fib4,n_23452_sd,hcc);
%additive2dum_LOGISTIC(n_23454_0_0,fib_fib4,n_23454_sd,hcc);
%additive2dum_LOGISTIC(n_23455_0_0,fib_fib4,n_23455_sd,hcc);


%macro additive3dum_LOGISTIC(dat,a,b,statues);
data P1;
set &dat;xx=&a*&b;
run;
PROC phreg OUTEST=EST DATA=P1 COVOUT;
class alcohol n_738_0_0 activity n_20116_0_0  /param=ref;
MODEL survivaltime*ep_cld_death(0)= &a &b xx 
&adjust / risklimits  ;
title "&&b 的交互作用 &a cldcause";
ods select parameterestimates;
ods OUTPUT parameterestimates=WORK.INdeath&a.&b;
RUN;
%mend additive3dum_LOGISTIC;


*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0   
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;
%additive3dum_LOGISTIC(n_23451_0_0,score1_prs5_sd,n_23451_sd);
%additive3dum_LOGISTIC(n_23452_0_0,score1_prs5_sd,n_23452_sd);
%additive3dum_LOGISTIC(n_23454_0_0,score1_prs5_sd,n_23454_sd);
%additive3dum_LOGISTIC(n_23455_0_0,score1_prs5_sd,n_23455_sd);


%additive3dum_LOGISTIC(n_23451_0_0,RS174547,n_23451_sd);
%additive3dum_LOGISTIC(n_23452_0_0,RS174547,n_23452_sd);
%additive3dum_LOGISTIC(n_23454_0_0,RS102275,n_23454_sd);
%additive3dum_LOGISTIC(n_23455_0_0,RS102275,n_23455_sd);

*model3;
%LET ADJUST =  n_31_0_0 n_21022_0_0  eth1 
               n_21001_0_0 n_48_0_0 town n_738_0_0  edu n_20116_0_0 alcohol ACTIVITY dietscore hypertension dm lipid  
               n_30620_0_0 n_30650_0_0 n_30080_0_0 n_23400_0_0 n_23407_0_0  n_23442_0_0 ;
%additive3dum_LOGISTIC(n_23451_0_0,fib4_sd,n_23451_sd);
%additive3dum_LOGISTIC(n_23452_0_0,fib4_sd,n_23452_sd);
%additive3dum_LOGISTIC(n_23454_0_0,fib4_sd,n_23454_SD);
%additive3dum_LOGISTIC(n_23455_0_0,fib4_sd,n_23455_sd);
















