: #!/usr/bin/env bash

: # bq query 'select count(*),avg(length(regexp_replace(voterhistory,"[^;]",""))) elections_voted, year(timestamp(dob)) birthyear from [nys.all_voter_file] group by birthyear order by elections_voted desc limit 1000'
: bq query --format csv 'select *,year(timestamp(dob)) birthyear from [nys.all_voter_file] order by birthyear limit 1000'
: bq query "select count(*),sum(length(regexp_replace(voterhistory,'[^;]',''))) elections_voted, RZIP4 from [nys.all_voter_file] group by RZIP4 order by elections_voted desc limit 1000"
bq query --max_rows 20000 --format csv "select count(*),sum(length(regexp_replace(voterhistory,'[^;]',''))) elections_voted, RZIP5 from [nys.all_voter_file] group by RZIP5 order by elections_voted desc limit 20000"
