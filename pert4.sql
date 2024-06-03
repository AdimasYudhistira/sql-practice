select address_id, address, address2 
from address
where address2 is null 

-- order by untuk mengurutkan data berdasarkan kolom tertentu
-- asc naik, desc turun
select film_id ,title ,release_year ,rental_rate 
from  film f 
order by rental_rate ;

select film_id ,title ,release_year ,rental_rate 
from  film f 
order by rental_rate asc ;

-- 4 disini artinya berdasarkan kolom ke 4
select film_id ,title ,release_year ,rental_rate 
from  film f 
order by 4 ;

-- 3 sebelum asc artinya berdasarkan kolom ke 3 asc nya
select film_id ,title ,release_year ,rental_rate 
from  film f 
order by 1 desc,  3 asc ;

-- query limit
select actor_id ,first_name ,last_name 
from actor a 
where actor_id >10
limit 10;

select actor_id ,first_name ,last_name 
from actor a 
where actor_id >10
order by first_name desc 
limit 10;

-- query like untuk mencari string
-- awalan huruf
select actor_id, first_name 
from actor a
where first_name like ('P%');

-- akhiran huruf
select actor_id, first_name 
from actor a
where first_name like ('%A');

-- kata atau huruf tertentu
select actor_id, first_name 
from actor a
where first_name like ('%DAN%');

-- bukan kata atau huruf tertentu
select actor_id, first_name 
from actor a
where first_name not like ('%DAN%');











