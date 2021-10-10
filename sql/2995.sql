--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2995

CREATE TABLE records (
id integer PRIMARY KEY,
temperature integer,
mark integer
);

GRANT SELECT ON records TO sql_user;

insert into records (id,temperature,mark) values
(1,30,1),
(2,30,1),
(3,30,1),
(4,32,2),
(5,32,2),
(6,32,2),
(7,32,2),
(8,30,3),
(9,30,3),
(10,30,3),
(11,31,4),
(12,31,4),
(13,33,5),
(14,33,5),
(15,33,5);

/*  Execute this query to drop the tables */
-- DROP TABLE records;

/*  Solution */
/*
SELECT t.temperature, t.number_of_records
FROM 
    (SELECT 
        r.temperature,
        ROW_NUMBER() OVER (PARTITION BY r.mark) AS row,
	    count(r.temperature) OVER (PARTITION BY r.mark) AS number_of_records
FROM records r) AS t
WHERE t.row = 1;

SELECT temperature, count(mark) as number_of_records
FROM records
GROUP BY mark, temperature
ORDER BY mark;
*/
