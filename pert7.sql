create table product(
	id varchar(100) not null,
	nama varchar(100) not null,
	description text,
	price int not null,
	quantity int not null,
	created_at timestamp not null default current_timestamp,
	primary key(id)
);

alter table product 
add primary key (id);

-- membuat tabel foreign key
create table wishlist(
	id int not null auto_increment,
	id_product varchar(100) not null,
	description text,
	primary key(id),
	constraint fk_wishlist_product
		foreign key (id_product) references product (id)
);

-- menghapus constraint
alter table wishlist
drop constraint fk_wishlist_product;

-- menambah constraint
alter table wishlist
add constraint fk_wishlist_product
	foreign key (id_product) references product (id);

-- unique key
create  table customers(
	id int not null auto_increment,
	email varchar(100),
	first_name varchar(100),
	last_name varchar(100),
	primary key(id),
	unique key email_unique (email)
);

alter table customers
drop constraint email_unique;

alter table customers 
add constraint email_unique unique(email);

-- constraint check
create table product2(
	id varchar(100) not null,
	nama varchar(100) not null,
	description text,
	price int not null,
	primary key(id),
	constraint price_check check (price > 10000)
);

insert into product2 (id,nama,price)
values (1, 'indomie', 12000);

-- tidak bisa insert karna tidak memenuhi check
insert into product2 (id,nama,price)
values (2, 'sarimi', 9000);

alter table
drop constraint price_check;

alter table
add constraint price_check check (price > 1000);








