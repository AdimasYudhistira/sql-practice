-- query dengan CTE
with cte_actor as ( #nama table CTE nya
	select actor_id, first_name ,last_name #tabel utamanya
	from actor a 
)
select * from cte_actor;

-- subquery vs CTE
-- subquery
select sub_tab.* 
from (
	select stf.first_name , sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id 
	join payment pay on pay.staff_id = stf.staff_id 
	group by 1
)sub_tab;

-- CTE
with cte_store as (
	select stf.first_name , sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id 
	join payment pay on pay.staff_id = stf.staff_id 
	group by 1
)
select * from cte_store;

-- CTE >1
with cte_film as (
	select film_id ,title ,rating ,rental_rate 
	from film 
), cte_film_actor as (
	select actor_id,film_id 
	from film_actor 
), cte_actor as (
	select actor_id, first_name, last_name
	from actor
)
select 	fil.film_id, fil.title, fil.rating,
		act.first_name, act.last_name
from cte_film fil
left join cte_film_actor fa on fa.film_id = fil.film_id
left join cte_actor act on act.actor_id = fa.actor_id;

-- query CTE join
with cte_film as (
	select	f.film_id ,f.title ,f.rating ,
			f.rental_rate , fa.actor_id
	from film f 
	left join film_actor fa on fa.film_id = f.film_id 
), cte_actor as(123
	select	act.first_name , act.last_name ,
			cf.title, cf.rating, cf.rental_rate
	from actor act
	left join cte_film cf on cf.actor_id = act.actor_id 
)
select * from cte_actor;