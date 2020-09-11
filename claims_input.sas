/*INPUT Claims dataset
*********************************************************/
data work.claims(drop=IDate rdate odate cdate ndate redate);
infile '/folders/myfolders/ecprg193/ClaimsDataFall2017.csv' dsd missover encoding="wlatin1";
length IDate rdate odate cdate ndate redate $10 IncidentDesc bodypartregion bodypart injury $200 type $20; 
input ClaimID Paid Reserves Recovery Indemnity Other Status $ IDate IncidentDesc Rdate Wage Odate Cdate ndate redate
isdenied isfatality age gender $ type injury bodypartregion bodypart;

if length(idate) = 8 then Incidentdate=input(idate,mmddyy8.);
else if length(idate) = 9 then incidentdate=input(idate,mmddyy9.); 
else if length(idate) =10 then incidentdate=input(idate,mmddyy10.);     

if length(rdate) = 8 then returndate=input(rdate,mmddyy8.);
else if length(rdate) = 9 then returndate=input(rdate,mmddyy9.); 
else if length(rdate) =10 then returndate=input(rdate,mmddyy10.); 

if length(odate) = 8 then opendate=input(odate,mmddyy8.);
else if length(odate) = 9 then opendate=input(odate,mmddyy9.); 
else if length(odate) =10 then opendate=input(odate,mmddyy10.); 

if length(cdate) = 8 then closedate=input(cdate,mmddyy8.);
else if length(cdate) = 9 then closedate=input(cdate,mmddyy9.); 
else if length(cdate) =10 then closedate=input(cdate,mmddyy10.); 

if length(ndate) = 8 then notifydate=input(ndate,mmddyy8.);
else if length(ndate) = 9 then notifydate=input(ndate,mmddyy9.); 
else if length(ndate) =10 then notifydate=input(ndate,mmddyy10.); 

if length(redate) = 8 then receivedate=input(redate,mmddyy8.);
else if length(redate) = 9 then receivedate=input(redate,mmddyy9.); 
else if length(redate) =10 then receivedate=input(redate,mmddyy10.); 


label ClaimID='Unique Claim ID' Paid='Total Amount Paid' Reserves='Reserves for open claims' Recovery='Recovery from liable party'
Indemnity='Indemnity paid' other='Other paid' status='Claim Status' Incidentdate='Incident Date' IncidentDesc='Incident description'
Returndate='Return Date' Wage='Average Weekly Wage' Opendate='Claim open date' Closedate='Claim closed date' notifydate='Employer notified date' 
receivedate='Claim received date' isdenied='Is denied' isfatality='Is fatal' age='Age' gender='Gender' type='Type of claim' 
injury='Type of Injury' 
bodypartregion='Body part region' bodypart='Body Part';

run;



proc sort data=claims out=claims_sorted;
by claimid;
run;

proc contents data=work.claims_sorted;
run;

proc print data=work.claims_sorted(OBS=1000) label noobs;
id claimid;
run;

***********************************************************/