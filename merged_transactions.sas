/*Combine the two transaction SAS datasets
*********************************************************/

/*Combine the two daatsets*/
data combined_transactions;
set transactions1 transactions2;
run;

/*Sort the dataset to be used for merging further*/
proc sort data=combined_transactions out=transactions_sorted;
by cid;
run;

/*Verify the contents and data types*/
proc contents data=transactions_sorted;
run;

/*Print data*/
proc print data=transactions_sorted(firstobs=1813558 obs=1813668) label noobs;
ID cid;
run;