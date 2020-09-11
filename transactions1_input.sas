/*INPUT Transactions Part1
*********************************************************/

/*Identify datatypes and input*/
data work.transactions1(drop=Pdate Fdate Tdate);
infile '/folders/myfolders/ecprg193/Transactions_part1.csv' dsd missover;
length Pdate Fdate Tdate $10 PayCat $30;
input CID Pdate IsSub IsLiti PayType $ PayCat TID Amount Fdate Tdate ;

/*Date variable input. Handle the lengths*/
if length(Pdate) = 8 then Paydate=input(Pdate,mmddyy8.);
else if length(Pdate) = 9 then Paydate=input(Pdate,mmddyy9.); 
else if length(Pdate) =10 then Paydate=input(Pdate,mmddyy10.);     

if length(Fdate) = 8 then Fromdate=input(Fdate,mmddyy8.);
else if length(Fdate) = 9 then Fromdate=input(Fdate,mmddyy9.); 
else if length(Fdate) =10 then Fromdate=input(Fdate,mmddyy10.); 

if length(Tdate) = 8 then Todate=input(Tdate,mmddyy8.);
else if length(Tdate) = 9 then Todate=input(Tdate,mmddyy9.); 
else if length(Tdate) =10 then Todate=input(Tdate,mmddyy10.); 

/*create labels for understanding better*/
label CID='Claim ID' Paydate='Payment Date' IsSub='Is Subrogation' IsLiti='IsLitigation' Paytype='Payment Type' PayCat='Payment Category'
TID='Transaction ID' Amount='Amount paid per transaction' Fromdate='Service From Date' Todate='Service To Date';
run;


/*verify the contents*/
proc contents data=work.transactions1;
run;

/*print the data*/
proc print data=work.transactions1(obs=1000) label noobs;
id cid;
run;

***********************************************************/
