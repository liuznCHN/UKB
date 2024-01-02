
%macro quantile(factor);
data &factor.inclusion;
set ukbb.base;
*纳入非关键缺失人群;
if   follow_cirrhosis>0
AND &factor NE  .     and n_21001_0_0 ne . and n_48_0_0 ne . AND FIB4 <100 AND FIB4 ne . 
and n_189_0_0 ne .  AND N_20116_0_0 NE  -3  and N_20116_0_0 NE  .    
and n_23400_0_0 ne . and n_23407_0_0  ne . and n_23442_0_0 ne .
THEN OUTPUT; 
RUN;
*看看脂肪肝患病;
proc freq;
table NAFLD;
ods select none;
run;

*分箱;
proc univariate data=&factor.inclusion;
var &factor ;
output out=Q4&factor pctlpre=&factor pctlpts=25 50 75;
ods select none;
RUN;

data &factor ;
set &factor.inclusion ; 
if _n_=1 then set Q4&factor;
  if &factor<=&factor.25 then C_&factor.Q="1";  
  else if &factor<=&factor.50 then C_&factor.Q="2";  
  else if &factor<=&factor.75 then C_&factor.Q="3";  
 * else if &factor<=&factor.80 then C_&factor.Q="4"; 
  else C_&factor.Q="5";
&factor.Q=input(C_&factor.Q,best8.);

if &factor.Q=1 or &factor.Q=2 then &factor.Qq=1;
else if &factor.Q=3 or &factor.Q=5 then &factor.Qq=2;



run;
proc freq data=&factor;
table &factor.q;
ods select all;
	title "&factor 的分箱";
run;
%mend quantile;
*调用宏;
%quantile(N_23451_0_0)
%quantile(N_23452_0_0)
%quantile(N_23454_0_0)
%quantile(N_23455_0_0)
%quantile(N_23456_0_0)
%quantile(N_23457_0_0)
%quantile(N_23459_0_0)
