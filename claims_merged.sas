
/*Merge sorted datasets*/

/*data claims_merged;
merge claims_sorted(in=cso) transactions_sorted(in=tso rename=(cid=claimid));
if cso and tso;
run;*/

data claims_merged;
merge claims_sorted(in=cso) transactions_sorted(in=tso rename=(cid=claimid));
by claimid;
if cso=1;
run;

proc contents data=claims_merged;
run;

proc print data=claims_merged(obs=1000) label noobs;
id claimid;
run;

