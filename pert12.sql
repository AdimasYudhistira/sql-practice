-- query untuk membuat subquey
-- pertama buat query untuk tabel utama
select actor_id, first_name, last_name 
from actor a 
where actor_id < 10 and first_name like ('P%');

-- masukan tabel utama ke dalam subquery (from)
select sub_tab.*
from (
	select actor_id, first_name, last_name 
	from actor a 
	where actor_id < 10
)sub_tab
where sub_tab.first_name like ('P%');

-- subquery join
-- tabel utama
select stf.first_name , sum(pay.amount) as total_income
from store sto
join staff stf on stf.store_id = sto.store_id 
join payment pay on pay.staff_id = stf.staff_id 
group by 1

-- subquery tabel utama
select sub_tab.* 
from (
	select stf.first_name , sum(pay.amount) as total_income
from store sto
join staff stf on stf.store_id = sto.store_id 
join payment pay on pay.staff_id = stf.staff_id 
group by 1
)sub_tab;

-- variasi join pada tabel di database
SELECT sub_tab.first_name, SUM(pay.amount) AS total_income 
FROM (
    SELECT stf.first_name, stf.staff_id
    FROM store sto
    JOIN staff stf ON stf.store_id = sto.store_id 
) sub_tab
JOIN payment pay ON pay.staff_id = sub_tab.staff_id 
GROUP BY 1;

-- variasi join subquery lain
select sub_store.first_name, sum(sub_pay.amount) as total_income 
from (
	select stf.first_name , sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id
	join payment pay on stf.staff_id = pay.staff_id
)sub_store
join (
	select pay.staff_id, pay.amount
	from payment pay
	)sub_pay on sub_pay.staff_id = sub_store.staff_id 
group by 1;


-- query membuat subquery where
-- kondisi
select film_id 
from film f 
where rating in ('PG','G');

-- masukan kondisi ke subquery
select film_id ,title ,release_year ,rating  
from film f 
where film_id not in (
	select film_id 
	from film f 
	where rating in ('PG','G')
);

-- query untuk membuat subquery where
select sum(amount) as total_amount
from payment
group by customer_id ;

select avg(sub_tab.total_amount) as avg_total_amount
from (
	select sum(amount) as total_amount
	from payment
	group by customer_id
)sub_tab;

-- subquery having
select cust.customer_id ,cust.first_name ,cust.last_name ,sum(pay.amount) as total_payment 
from payment pay
left join customer cust on cust.customer_id = pay.customer_id 
group by 1,2,3
having total_payment > (
	select avg(sub_tab.total_amount) as avg_total_amount
	from (
	select sum(amount) as total_amount
	from payment
	group by customer_id
	)sub_tab
);












