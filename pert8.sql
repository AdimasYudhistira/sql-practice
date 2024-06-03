-- join
select *
from film
join film_actor on film_actor.film_id = film.film_id;

-- join 2
select	pay.payment_id , pay.customer_id , pay.amount ,
		cust.first_name , cust.last_name , cust.email 
from payment pay
join customer cust on cust.customer_id = pay.customer_id ;

-- join 3 or more
select	pay.payment_id , pay.customer_id , pay.amount ,
		cust.first_name , cust.last_name , cust.email,
		addr.address , addr.district 
from payment pay
join customer cust on cust.customer_id = pay.customer_id 
join address addr on addr.address_id = cust.address_id ;

-- inner join
select	str.store_id ,cust.first_name, addr.address  
from customer cust
inner join store str on str.store_id = cust.store_id
inner join address addr on addr.address_id = cust.address_id ;

-- left join
select	str.store_id ,cust.first_name, addr.address  
from customer cust
left join store str on str.store_id = cust.store_id 
left  join address addr on addr.address_id = cust.address_id ;

-- right join
select	str.store_id ,cust.first_name, addr.address  
from customer cust
right join store str on str.store_id = cust.store_id 
right join address addr on addr.address_id = cust.address_id ;

-- cross join
select cust.first_name , addr.address 
from customer cust
cross join address addr on addr.address_id = cust.address_id ;

select cust.first_name , addr.address 
from customer cust
cross join address addr;
