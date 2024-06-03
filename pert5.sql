-- query between untuk mencari nilai antara kondisi 1 dan 2
select film_id , title ,rental_rate ,replacement_cost 
from film 
where 	replacement_cost between 10 and 20
		and rental_rate between 2 and 5;
		
-- query in untuk mencari nilai mutiple string
select film_id ,title ,rental_rate , replacement_cost , rating 
from film f
where rating  in ('PG','G');

-- mencari nilai uniq
select distinct (rental_rate)
from film f 
where rating in('PG','G');

-- alias memberi nama semsntara
-- kolom
select 	film_id as id ,
		title as judul ,
		description as desk ,
		rating as rate
from film f ;

-- table
select f.film_id ,f.title ,f.description ,f.rating 
from film as f;

-- tanpa as
select f.film_id ,f.title ,f.description ,f.rating 
from film  f;

-- query untuk numeric function
-- aritmatik
select 10+10 as hasil;

-- pada tabel
SELECT 
    f.film_id,
    f.title AS film_name,
    f.replacement_cost,
    f.replacement_cost * 2 AS double_replacement_cost
from film f;
 

-- math func
select 
	f.film_id, 
	f.title as film_name,
	abs( f.replacement_cost-1000) as abs_replcae,
	pow( f.replacement_cost,2) as double_replacement_cost
from film f 

-- aggregate function
select 	sum(f.replacement_cost) as total_replacement,
		min(f.replacement_cost) as minimum_replacement,
		max(f.replacement_cost) as maximum_replacement,
		avg(f.replacement_cost) as rata_rata_replacement
from film f 






