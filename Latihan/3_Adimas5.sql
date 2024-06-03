-- no.1 Tampilkan daftar semua film yang tersedia di toko.
select title , description 
from film f;

-- no.2 Siapa staff yang paling banyak melakukan transaksi
select s.first_name, s.last_name, count(r.rental_id) AS total_rentals
from staff s
join rental r ON s.staff_id = r.staff_id
group by s.first_name, s.last_name 
order by total_rentals DESC;

-- no.3 Tampilkan 10 aktor berdasarkan abjad
select a.first_name, a.last_name 
from actor a 
order by a.first_name , a.last_name  
limit 10;

-- no.4 Tampilkan 5 film dengan durasi paling lama
select title ,`length` 
from film f 
order by `length` desc  
limit 5;

-- no.5 Hitung jumlah pinjaman yang dilakukan setiap bulan dalam setiap tahun
select 	year(r.rental_date) as `year`, 
		month(r.rental_date) as `month`, 
		count(r.rental_id) as rental_count 
from rental r 
group by `year`,`month`; 

-- no.6 Tampilkan daftar film yang memiliki kata “drama” dalam deskripsi mereka
select title 
from film f 
where description like '%drama%';

-- no.7 Hitung total pendapatan dari peminjaman pada hari Jumat
/*
Kode hari dalam fungsi DAYOFWEEK adalah sebagai berikut:
1: Minggu
2: Senin
3: Selasa
4: Rabu
5: Kamis
6: Jumat
7: Sabtu
 */
-- cara 1
select sum(p.amount) AS total_pendapatan
from payment p
where dayofweek(p.payment_date) = 6;

-- cara 2
select sum(p.amount) AS total_pendapatan
from rental r
join payment p ON r.rental_id = p.rental_id
where dayofweek(r.rental_date) = 6;

-- no.8 Tampilkan 5 kota dengan total pendapatan peminjaman tertinggi
select ci.city_id, ci.city, SUM(pa.amount) AS total_revenue
from city ci
join address ad on ci.city_id = ad.city_id
join customer cu on ad.address_id = cu.address_id
join rental re on cu.customer_id = re.customer_id
join payment pa on re.rental_id = pa.rental_id
group by ci.city_id, ci.city
order by total_revenue desc 
limit 5;

-- no.9 Tampilkan 7 pelanggan yang paling sering terlambat mengembalikan film
select 	c.customer_id,
    	c.first_name,
    	c.last_name,
    	count(*) as late_return_count
from customer c
join rental r on c.customer_id = r.customer_id
where r.return_date > r.rental_date  
group by c.customer_id, c.first_name, c.last_name
order by late_return_count desc
limit 7;

-- no.10 Tampilkan daftar film film yang tidak pernah dipinjam
select 	f.film_id,
		f.title
from film f
left join inventory i on f.film_id = i.film_id
LEFT join rental r on i.inventory_id = r.inventory_id
where r.rental_id is null;












