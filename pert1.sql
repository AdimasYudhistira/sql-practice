create database db_toko;
-- buat tabel
create  table barang (
kode INT,
nama varchar(100),
harga int,
jumlah int
);

-- delet tabel
drop table barang;

drop database db_toko;

alter table barang 
rename column kode to id;

alter table barang 
rename column nama to nama_barang;

alter table barang
add column deksripsi text;

alter table barang
add column deksripsi2 text;

alter table barang
drop column deksripsi;

alter table barang
modify deksripsi text after nama_barang;