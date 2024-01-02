
data ukbb.date;
merge 

ukbb.Labelled_kxpnts(
keep=n_eid  s_53_0_0  s_53_1_0 s_53_2_0 s_53_3_0               /*入组日期*/
)          

ukbb.Labelled_hbfbiy(/*肿瘤*/
keep=n_eid  s_40005_0_0 s_40005_1_0 s_40005_2_0 s_40005_3_0 s_40005_4_0 s_40005_5_0 s_40005_6_0 s_40005_7_0 s_40005_8_0 s_40005_9_0
s_40006_0_0 s_40006_1_0 s_40006_2_0 s_40006_3_0 s_40006_4_0 s_40006_5_0 s_40006_6_0 s_40006_7_0 s_40006_8_0 s_40006_9_0)              



ukbb.Labelled_hbfbiy(                                          /*住院日期2022.10*/    /*死亡日期2022.10*/
keep=n_eid 
s_41270_0_0-s_41270_0_225
s_41280_0_0-s_41280_0_225
s_40000_0_0 s_40001_0_0 s_40002_0_1-s_40002_0_14
)

ukbb.Labelled_zxbfts;                                          /*自我报告*/ 
by n_eid;
/*计算生存日期*/
survivaltime=YRDIF(s_53_0_0,s_40000_0_0,'ACTUAL');
IF  survivaltime>0 then  DEATH=1;
ELSE if  survivaltime=. then do death=0; survivaltime=YRDIF(s_53_0_0,'19DEC2022'D,'ACTUAL');end; /*终点仍活着*/ 




if  FIND (s_40001_0_0,'K70') or FIND (s_40001_0_0,'K73') or FIND (s_40001_0_0,'K74') or  s_40001_0_0='K758' or s_40001_0_0='K760' then do;EP_CLD_DEATH=1;end;



ARRAY s_41270(226) $ s_41270_0_0-s_41270_0_225;
ARRAY s_41280(226)   s_41280_0_0-s_41280_0_225;
do i=1 to 226; 
     if s_41270(i) = 'C220' then do; followK31=yrdif(s_53_0_0,s_41280(i),'ACTUAL') ;EP_Cirrhosis=1;EP_liver=1;EP_livercancer=1;EP_HCC=1;EP_K=1;end;*HCC;


if EP_HCC =. then EP_HCC=0;

if EP_CLD_DEATH =. then EP_CLD_DEATH=0;

end;

ARRAY s_40005(10)   s_40005_0_0 s_40005_1_0 s_40005_2_0 s_40005_3_0 s_40005_4_0 s_40005_5_0 s_40005_6_0 s_40005_7_0 s_40005_8_0 s_40005_9_0;
ARRAY s_40006(10)   s_40006_0_0 s_40006_1_0 s_40006_2_0 s_40006_3_0 s_40006_4_0 s_40006_5_0 s_40006_6_0 s_40006_7_0 s_40006_8_0 s_40006_9_0;
do i=1 to 10; 
 

if s_40006(i) = 'C220' then do; followK34=yrdif(s_53_0_0,s_40005(i),'ACTUAL') ;EP_liver=1;EP_LIVERCANCER=1;EP_HCC=1;EP_K=1;end;*HCC;



follow_HCC=min(survivaltime,followK31,followK34);
if follow_HCC=. then follow_HCC=0;


end;
run;

