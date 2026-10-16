use hw_2;

# Task 1
# With date staying as string
SELECT id, 
date,
YEAR(date) as year, 
MONTH(date) as month, 
DAY(date) as day
FROM orders;

# With date converted to date format
WITH TemporalTable AS (
	SELECT id, 
		   STR_TO_DATE(date, '%Y-%m-%d') as converted_date
	FROM orders
)
SELECT id, 
converted_date as date,
YEAR(converted_date) as year, 
MONTH(converted_date) as month, 
DAY(converted_date) as day
FROM TemporalTable;

# Task 2
SELECT id, 
       date,
       DATE_ADD(STR_TO_DATE(date, '%Y-%m-%d'), INTERVAL 1 DAY) as next_day_date
FROM orders;

# Task 3
SELECT id,
       date,
       UNIX_TIMESTAMP(STR_TO_DATE(date, '%Y-%m-%d')) as timestamp
FROM orders;

# Task 4
SELECT COUNT(*) AS total_dates
FROM orders
WHERE date BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

# Task 5
SELECT id,
       date,
       JSON_OBJECT('id', id, 'date', date) as json_object
FROM orders;       



