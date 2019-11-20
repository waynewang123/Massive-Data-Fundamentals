create external table a03 (
bigrams string, 
year int,
occurrence int, 
book int
) 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t' 
LOCATION  '/user/hadoop/bigrams/';
INSERT OVERWRITE DIRECTORY 'result1'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t' 
select *
from
(select bigrams, SUM(a03.occurrence) AS occur, SUM(a03.book) AS books, 1.0*SUM(a03.occurrence)/SUM(a03.book) AS avg, MIN(a03.year) AS first, MAX(a03.year) AS last, COUNT(a03.year) as times;
from a03
group by bigrams
) as a
where first = 1950
and last = 2009
and times = 60
order by avg desc
limit 10
;