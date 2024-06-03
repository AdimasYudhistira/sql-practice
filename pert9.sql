-- union
select first_name ,last_name 
from actor a 
union
select first_name ,last_name 
from customer c;

(select first_name as fristnam ,last_name as lastname 
from actor a limit 10)
union
(select first_name ,last_name 
from customer c limit 10);

-- union all
select first_name ,last_name 
from actor a 
union all
select first_name ,last_name 
from customer c;

-- query intersect dengan bantuan inner join
select distinct(addr.district)
from address addr
inner join staff on staff.address_id = addr.address_id ;

-- query index
create table seller(
	id int not null auto_increment primary key,
	name varchar(100),
	email varchar(100),
	unique key email_unique (email),
	index name_index (name)
);

alter table seller
add index email_index (email);

alter table seller 
drop index email_index;