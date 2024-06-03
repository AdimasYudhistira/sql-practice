update barang 
set  deksripsi ='Indomie goreng'
where id =2

update barang 
set  deksripsi ='Mie Sedap Betul',
		harga = 4000
where id =4;

-- jika delet nya double pake end
delete 
from barang 
where id =7;

select * from barang b ;

select deksripsi, harga from barang b ;

-- jika ingin tidak sama dengan !=
select nama_barang, deksripsi ,harga 
from barang b 
where nama_barang = 'indomie';

-- operator <,>,<=,>=

-- and or
select nama_barang , harga 
from barang b 
where nama_barang ='Indomie'
and  harga = 3000;

select nama_barang , harga 
from barang b 
where nama_barang ='Indomie'
or  harga = 3000;