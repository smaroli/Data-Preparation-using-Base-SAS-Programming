/*store the sas dataset*/
libname sasbase "/folders/myfolders/ecprg193";

proc format;
value answer 1='yes'
             0='no';
run;

proc format;
value $status 'C' = 'Closed' 'O'='Open' 'R'='Reopen';
run;

data sasbase.claims_final;
set claims_merged;
by claimid;
cost = sum(reserves,indemnity,other,-recovery);
if status='C' then time=sum(closedate,-opendate);
else time=sum(today(),-opendate);

if age<0 then age=.;

label cost='Total Cost Per Claim' time='Time to process claims';
run;

title 'Contents of the final data set Claims';

proc contents data=sasbase.claims_final;
run;

title;

title 'First 100 observations displayed from the claims dataset';

proc print data=sasbase.claims_final(obs=25) label noobs;
id claimid;
format isdenied isfatality issub isliti answer. status $status. opendate closedate incidentdate todate returndate
fromdate notifydate receivedate date9.;
run;

title;

title 'Procedure Report for claims';

proc report data=sasbase.claims_final(obs=1000);
column claimid paid reserves recovery indemnity other status type opendate closedate wage age gender isdenied isfatality
injury bodypart cost time TID amount paydate paytype;
define claimid/order;
define paid/order;
define reserves/order;
define recovery/order;
define indemnity/order;
define other/order;
define status/order format=$status.;
define type/order;
define opendate/order format=date9.;
define closedate/order format=date9.; 
define wage/order;
define age/order;
define gender/order;
define isdenied/order format=answer.;
define isfatality/order format=answer.;
define injury/order;
define bodypart/order;
define cost/order;
define time/order;
run;

title;

