
data ukbb.base;
merge ukbb.Labelled_euirls(
keep=n_eid 
n_31_0_0  n_22001_0_0 n_826_0_0
n_93_0_0 n_93_0_1 n_4079_0_0 n_4079_0_1    /*血压*/
n_94_0_0 n_94_0_1 n_4080_0_0 n_4080_0_1    /*血压*/
n_1558_0_0                                  /*Alcohol intake frequency.*/

n_2443_0_0 n_2644_0_0                       /*糖尿病*/
n_6138_0_0-n_6138_0_5                       /*学历*/
n_6150_0_0-n_6150_0_3                       /*心血管*/
n_6177_0_0-n_6177_0_2                          /*Medication for cholesterol, blood pressure or diabetes*/
n_20116_0_0 n_20117_0_0                     /*吸烟饮酒*/
n_21001_0_0                                   /*BMI*/
n_21022_0_0                                   /*AGE*/
n_22040_0_0                                  /*Met*/
n_22009_0_1-n_22009_0_10          /*Genetic principal components*/
n_22027_0_0 n_22001_0_0 n_22019_0_0 n_22021_0_0 n_22006_0_0
)

UKBB.Labelled_ophmhu(keep= n_eid N_30080_0_0)
ukbb.mri(keep= n_eid n_40060_2_0 n_40061_2_0 n_40062_2_0 follow_mri NAFLD_pdff NASH_CT1  nafld3/*MRI*/)
ukbb.Labelled_tuumyw(keep= n_eid n_23400_0_0 n_23407_0_0
n_23415_0_0  /*总酯化胆固醇*/
n_23419_0_0  /*总游离胆固醇*/
n_23434_0_0  /*磷酸甘油酯*/
n_23438_0_0  /*鞘磷脂*/
n_23442_0_0
n_23444_0_0  n_23445_0_0  n_23446_0_0  n_23447_0_0  n_23448_0_0  n_23449_0_0  n_23450_0_0 n_23480_0_0
n_23451_0_0             /*Omega-3 Fatty Acids to Total Fatty Acids percentage*/
n_23452_0_0             /*Omega-6 Fatty Acids to Total Fatty Acids percentage*/ 
n_23453_0_0             /*Polyunsaturated Fatty Acids to Total Fatty Acids percentage*/
n_23454_0_0             /*Monounsaturated Fatty Acids to Total Fatty Acids percentage*/
n_23455_0_0             /*Saturated Fatty Acids to Total Fatty Acids percentage*/
n_23456_0_0             /*Linoleic Acid to Total Fatty Acids percentage*/
n_23457_0_0             /*Docosahexaenoic Acid to Total Fatty Acids percentage*/
n_23458_0_0             /*Polyunsaturated Fatty Acids to Monounsaturated Fatty Acids ratio*/
n_23459_0_0             /*Omega-6 Fatty Acids to Omega-3 Fatty Acids ratio*/
n_23480_0_0 
n_23402_0_0 
n_23464_0_0 
n_23419_0_0 
n_23451_1_0             /*Omega-3 Fatty Acids to Total Fatty Acids percentage*/
n_23452_1_0             /*Omega-6 Fatty Acids to Total Fatty Acids percentage*/ 
n_23453_1_0             /*Polyunsaturated Fatty Acids to Total Fatty Acids percentage*/
n_23454_1_0             /*Monounsaturated Fatty Acids to Total Fatty Acids percentage*/
n_23455_1_0             /*Saturated Fatty Acids to Total Fatty Acids percentage*/
n_23459_1_0           
)
ukbb.diet(keep=n_eid dietscore  
score_fruit
score_vege
score_whole
score_fish
score_dairy
score_oils
score_refined
score_promeats
score_unpromeats
score_ssb)

/*健康方式*/
ukbb.lifestyle(keep=n_eid healthscore health health1 health2 health3 health4 health5 health6 health7 sedentary alcoholunits health11)/*health1 指饮酒*/
ukbb.Labelled_lmtqnt(keep=n_eid  n_26223_0_0 n_26227_0_0 n_26206_0_0  n_26212_0_0 n_26229_0_0 n_26287_0_0 n_26248_0_0 s_40005_0_0)
/*睡眠*/
ukbb.sleep(keep=n_eid sleep_score sleeppattern score1)
/*生化*/
ukbb.lab(keep=n_eid n_30600_0_0 n_30620_0_0 n_30650_0_0 n_30690_0_0 n_30700_0_0 n_30710_0_0 n_30730_0_0 n_30740_0_0 
n_30750_0_0 n_30760_0_0 n_30780_0_0 n_30870_0_0 n_30880_0_0 n_30880_1_0)
/*自报疾病*/
ukbb.Labelled_zxbfts(keep=n_eid  n_20002_0_0-n_20002_0_28)
/*最新添加的*/
ukbb.Labelled_kxpnts(     
keep=n_eid n_48_0_0 s_53_0_0 n_189_0_0 n_738_0_0 n_21000_0_0 s_40000_0_0)
/*中心*/
ukbb.Labelled_uxlyzt(keep=n_eid n_54_0_0)
ukbb.treatment(keep=n_eid n_20003_0_0 n_20003_0_1 n_20003_0_2 n_20003_0_3 n_20003_0_4 n_20003_0_5)


ukbb.date(keep=n_eid survivaltime follow_LIVER FOLLOW_NAFLD FOLLOW_Cirrhosis FOLLOW_HCC /*FOLLOW_livercancer*/ FOLLOW_K FOLLOW_ALD follow_heptitis death
EP_LIVER EP_NAFLD EP_Cirrhosis EP_HCC /*EP_LIVERCANCER*/ EP_K   EP_LIVER_death EP_NAFLD_death EP_HCC_death  EP_K_death  EP_fibrosis_death  EP_ALD  EP_ALD_DEATH EP_CLD_DEATH ep_heptitis
/*FOLLOW_CVD FOLLOW_IHD FOLLOW_AF FOLLOW_HF FOLLOW_STROKE 
EP_AF Ep_HF EP_IHD ep_STROKE ep_cvd ep_cvd_death ep_cancer_death*/
death 
)
UKBB.FADS( KEEP= n_eid RS102275 RS174547)

;
by n_eid;


/*挑出自我报告基线肝脏疾病*/
array n_20002(29) n_20002_0_0-n_20002_0_28;
if '1136' IN n_20002 or
'1141' IN n_20002 or
'1155' IN n_20002 or
'1156' IN n_20002 or
'1157' IN n_20002 or
'1158' IN n_20002 or
'1159' IN n_20002 or
'1408' IN n_20002 or
'1506' IN n_20002 or
'1507' IN n_20002 or
'1578' IN n_20002 or
'1579' IN n_20002 or
'1580' IN n_20002 or
'1581' IN n_20002 or
'1582' IN n_20002 or
'1604' IN n_20002 or follow_K<0  
then selfliver=1;




FIB4=(N_21022_0_0*N_30650_0_0)/(N_30080_0_0*N_30620_0_0**0.5);

if FIB4>2.67 then do FIB_FIB4=3;FIB_FIB44=2; end;
else if fib4<1.3 then do FIB_FIB4=1;FIB_FIB44=1; end;
else if 1.3=<fib4<=2.67 then do FIB_FIB4=2;FIB_FIB44=2;end;


FIB4_SD=(FIB4-1.315513)/3.75638;

if grs_prs2=1 then grs_prs22=1;
else if grs_prs2=2 or grs_prs2=3 then grs_prs22=2;

n_23451_sd=(n_23451_0_0-4.386739)/1.55097;
n_23452_sd=(n_23452_0_0-37.86351)/3.61860;
n_23453_sd=(n_23453_0_0-40.0364458)/3.6947002;
n_23454_sd=(n_23454_0_0-23.7338344)/2.66595001;
n_23455_sd=(n_23455_0_0-34.0159208)/1.95505498;
n_23456_sd=(n_23456_0_0-28.9134965)/3.42924453;
n_23457_sd=(n_23457_0_0-1.99722432)/0.67569127;
n_23459_sd=(n_23459_0_0-9.70825)/4.28988;


n_40062_2_0_sd=n_40062_2_0/100-5;

ARRAY n_20003(*)   n_20003_0_0-n_20003_0_5;
do i =1 to 6;
if n_20003(i)=1141146234  or n_20003(i)=1141192414 or n_20003(i)=1140910632 or n_20003(i)=1140888594 or 
n_20003(i)=1140864592  or n_20003(i)=1141146138 or n_20003(i)=1140861970 or n_20003(i)=1140888648 or 
n_20003(i)=1141192410  or n_20003(i)=1141188146 or n_20003(i)=1140861958 or n_20003(i)=1140881748 
then lipidlower=1;
end;
if lipidlower=. then lipidlower=0;



/*定义教育*/
if n_6138_0_0=1 or n_6138_0_1=1 or n_6138_0_2=1 or n_6138_0_3=1 or n_6138_0_4=1 or n_6138_0_5=1 then edu =1;
else edu=0; 
/*定义工作*/
if n_826_0_0 ne . then employment=1;
else employment=0;
/*定义收入*/
if n_738_0_0 =3 or n_738_0_0 =4 or n_738_0_0 =5  then income=1;
else if n_738_0_0 =1 or n_738_0_0 =2 then income=0;


/*定义种族*/
if n_21000_0_0 =1 or n_21000_0_0 =1001 or  n_21000_0_0 =1002  or  n_21000_0_0 =1003 then eth1=1;
else eth1=0;

if n_21000_0_0 =1 or n_21000_0_0 =1001 or  n_21000_0_0 =1002  or  n_21000_0_0 =1003 then eth=1;
else if n_21000_0_0 =3 or n_21000_0_0 =3001 or  n_21000_0_0 =3002  or  n_21000_0_0 =3003 or  n_21000_0_0 =3004 or n_21000_0_0 =5 then eth=3;
else if n_21000_0_0 =4 or n_21000_0_0 =4001 or  n_21000_0_0 =4002  or  n_21000_0_0 =4003 then eth=4;
else eth=0;

/*定义身体活动*/
if 0<= n_22040_0_0 <600 then activity=1;
if 600<=n_22040_0_0 <3000 then activity=2;
IF n_22040_0_0 >= 3000 THEN activity=3;
IF n_22040_0_0 = . THEN activity=5;

IF N_738_0_0= -3 OR N_738_0_0= -1 OR N_738_0_0= . THEN N_738_0_0=9;
/*定义饮酒*/
if n_1558_0_0=1 then alcohol=3;
else if n_1558_0_0=2 or n_1558_0_0=3 then alcohol=2;
else if n_1558_0_0=4 then alcohol=1;
else if n_1558_0_0=5 or n_1558_0_0=6 then alcohol=0;
IF ALCOHOL=0 OR ALCOHOL=1 THEN ALC=0;
IF ALCOHOL=2 OR ALCOHOL=3 THEN ALC=1;


/*定义BMI*/
IF n_21001_0_0 <=18.5 then BMIC=1;
ELSE IF 18.5< n_21001_0_0 <25 THEN BMIC=2;
ELSE IF 25<= n_21001_0_0 <30 THEN BMIC=3;
ELSE IF 30<= n_21001_0_0 THEN BMIC=4;

IF n_21001_0_0 <=25 then BMICC=0;
ELSE BMICC=1;

IF (N_31_0_0=1 AND n_48_0_0>102 ) OR (N_31_0_0=0 AND n_48_0_0>88) THEN OBESITY=1;
ELSE OBESITY=0;



/*定义高血压*/
mean_sbp = mean(n_93_0_0, n_93_0_1, n_4080_0_0, n_4080_0_1) ;
mean_dbp = mean(n_94_0_0, n_94_0_1, n_4079_0_0, n_4079_0_1);
if (mean_sbp >= 140 or mean_dbp >= 90 
or n_6177_0_0=2 or n_6177_0_1=2 or n_6177_0_2=2 
or n_6150_0_0=4 OR n_6150_0_1=4 OR n_6150_0_2=4 OR n_6150_0_3=4) 
or '1065' IN n_20002 or '1072' IN n_20002 
then Hypertension = 1;
else if (mean_sbp ne . and mean_dbp ne .) then Hypertension = 0;
/*定义高脂血*/
if n_30870_0_0>1.7   then lipid=1;
else lipid=0;

if n_20003_0_0 ne . then medication=1;
else medication=0;

/*定义糖尿病*/
if n_30740_0_0>=11.1 or n_30750_0_0>=48 or '1220' IN n_20002 or '1222' IN n_20002 or '1223' IN n_20002 
or n_2443_0_0=1 or n_6177_0_0=3 or n_6177_0_1=3 or n_6177_0_2=3 then DM=1;
else DM=0;


/*用于亚组分析*/


if n_21022_0_0 >=60 then age=1;
else  age=0;

if n_21022_0_0 >=65 then age1=1;
else if n_21022_0_0 <65 then age1=0;


if n_189_0_0>-2 then TOWNS=1;
else towns=0;

if n_189_0_0<-3.5 then TOWN=1;
else if n_189_0_0<-2.13 then TOWN=2;
else if n_189_0_0<1 then TOWN=3;
else town=4;


if n_22040_0_0>1800 then act=1;
else if n_22040_0_0<=1800 then act=0;
else if n_22040_0_0=. then act=.;


run;
