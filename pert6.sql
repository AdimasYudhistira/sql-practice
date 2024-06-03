-- query group by
select f.rating ,count(*) as row_count, avg(f.rental_rate) as avg_rate  
from film f 
group by f.rating ;

select f.rating ,count(*) as row_count, avg(f.rental_rate) as avg_rate  
from film f 
group by 1 ;

select 	f.rating ,
		f.special_features ,
		count(*) as row_count, 
		avg(f.rental_rate) as avg_rate  
from film f 
group by f.rating, f.special_features ;

-- having melakukan filter data
select f.rating ,count(*) as row_count  
from film f 
group by f.rating
having row_count >100 ;

-- having vs where
select f.rating ,count(*) as row_count  
from film f 
where f.replacement_cost > 20
group by f.rating
having row_count >100;

select f.rating ,count(*) as row_count  
from film f 
group by f.rating
having f.rating in ('PG','G') ;

-- query string function
-- menggabungkan 2 string atau lebih
select 	a.first_name , 
		a.last_name,
		lower(a.first_name) as lower_firstname,
		reverse(a.first_name) as reverse_name,
		concat(a.first_name,' ', a.last_name) as full_name 
from actor a ;

-- datetime function
select 	extract(year from p.payment_date) as payment_year,
		extract(month from p.payment_date) as payment_month,
		count(*) as row_count,
		avg(p.amount) as avg_amount
from payment p 
group by payment_year, payment_month
order by payment_year, payment_month asc;

-- query flow control
-- case
select 	f.rental_rate 
		case 
		when f.rental_rate < 1 then 'murah'
		when f.rental_rate between 1 and 3 then 'normal'
		else 'mahal'
		end as harga_kategori
from film f 

-- if
select	f.rental_rate, 
		if(
			f.rental_rate < 1 , 'murah',
			if (
				f.rental_rate between 1 and 3, 'normal', 'mahal'
				)
			) as harga_kategori
from film f;

-- ifnull
select address2 , ifnull(a.address2, 'ini null') 
from address a 












