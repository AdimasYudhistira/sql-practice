-- query membuat SP
create procedure get_actor()
	begin
		select actor_id , first_name , last_name 
		from actor
		order by 1 desc 
		limit 10;
	end

-- memanggil sp
call get_actor;

-- drop sp
drop procedure if exists get_actor;

-- memakai parameter in
create procedure get_actor_id(in get_act int)
begin
	select act.actor_id ,act.first_name ,act.last_name, fil.title , fil.rating 
	from actor act
	left join film_actor fa on fa.actor_id = act.actor_id
	left join film fil on fil.film_id = fa.film_id 
	where act.actor_id = get_act;
end

call get_actor_id(40);

-- memakai beberapa parameter in
create procedure get_actor_id_name(in get_act int, in nama_film varchar(100))
begin
	select act.actor_id ,act.first_name ,act.last_name, fil.title , fil.rating 
	from actor act
	left join film_actor fa on fa.actor_id = act.actor_id
	left join film fil on fil.film_id = fa.film_id 
	where act.actor_id = get_act
			and fil.title like (nama_film);
end

call get_actor_id_name(50, 'C%');

-- query sp in dan out
create procedure get_customer_id(in id_customer int, out cust_output varchar(100))
	begin
		select first_name 
		into cust_output
		from customer
		where customer_id = id_customer;
	end

-- cara call nya
call get_customer_id(70, @cust_output);

select @cust_output;

-- query sp in out > 1 (hasil out cuma bisa 1 row)
create procedure get_customer_name(	in cust_name int, in cust_address int, 
									out cust_firstname varchar(100), out cust_district varchar(100))
	begin
		select cust.first_name, addr.address  
		into cust_firstname, cust_district -- out
		from customer cust
		left join address addr on addr.address_id = cust.address_id 
		where 	cust.customer_id = cust_name      -- in
				or addr.address_id = cust_address;
	end

call get_customer_name(2,3, @cust_firstname, @cust_district); 

select @cust_firstname,@cust_district;






















	

