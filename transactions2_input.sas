/*INPUT Transactions Part2
*********************************************************/
data work.transactions2(drop=Pdate Fdate Tdate);
infile '/folders/myfolders/ecprg193/Transactions_part2.csv' dsd missover;
length Pdate Fdate Tdate $10 paycat $30;
input CID Pdate IsSub IsLiti PayType $ PayCat TID Amount Fdate Tdate ;

if length(Pdate) = 8 then Paydate=input(Pdate,mmddyy8.);
else if length(Pdate) = 9 then Paydate=input(Pdate,mmddyy9.); 
else if length(Pdate) =10 then Paydate=input(Pdate,mmddyy10.);     

if length(Fdate) = 8 then Fromdate=input(Fdate,mmddyy8.);
else if length(Fdate) = 9 then Fromdate=input(Fdate,mmddyy9.); 
else if length(Fdate) =10 then Fromdate=input(Fdate,mmddyy10.); 

if length(Tdate) = 8 then Todate=input(Tdate,mmddyy8.);
else if length(Tdate) = 9 then Todate=input(Tdate,mmddyy9.); 
else if length(Tdate) =10 then Todate=input(Tdate,mmddyy10.); 

label CID='Claim ID' Paydate='Payment Date' IsSub='Is Subrogation' IsLiti='IsLitigation' Paytype='Payment Type' PayCat='Payment Category'
TID='Transaction ID' Amount='Amount paid per transaction' Fromdate='Service From Date' Todate='Service To Date';
run;

proc contents data=work.transactions2;
run;

proc print data=work.transactions2(obs=1000) label;
run;

***********************************************************/