#!/usr/bin/env bash

bq query 'select count(*),avg(length(regexp_replace(voterhistory,"[^;]",""))) elections_voted, year(timestamp(dob)) birthyear from [nys.all_voter_file] group by birthyear order by elections_voted desc limit 1000'
