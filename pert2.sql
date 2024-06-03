create  table barang (
id INT auto_increment primary key,
nama_barang varchar(100),
deksripsi text,
harga int,
jumlah int
);

insert into barang (nama_barang, deksripsi, harga, jumlah)
values	('Indomie', 'indomie soto kari', 3000, 1),
		('Sarimi', 'sarimi soto koya', 3000, 2),
		('Mie sedap', 'mie sedap goreng', 3000, 1),
		('Indomie','Soto Padang',4000,2);
		
create table admin
(
	id int auto_increment,
	first_name text,
	last_name text,
	primary key (id)
);

insert into admin (first_name,last_name)
values ('Prabowo','Subianto'),
		('Ganjar','Pranowo'),
		('Anies','Baswedan');

drop table barang;
		
alter table barang 
add primary key (id);

alter table barang 
drop column id;

alter table barang 
add column id int;

alter table barang 
modify column id int auto_increment;

insert into barang (nama_barang,deksripsi,harga,jumlah)
values('Indomie','Soto Padang',4000,2);