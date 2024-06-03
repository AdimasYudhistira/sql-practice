
-- TUGAS - PERTEMUAN 10

-- Database yang digunakan adalah Sakila Database.

-- SOAL

-- 1) Tampilkan 10 aktor yang paling banyak memerankan film dengan durasi lebih dari 60 menit, dan memiliki 'Behind The Scenes' special feature.
-- 	  Tampilkan juga actor id, genre film, dan jumlah film yang sudah ia perankan.

-- 2) Tampilkan 5 film yang paling laris dipinjam pada database ini, jika dilihat dari jumlah total salesnya. 
-- 	  Tampilkan juga jumlah total salesnya, jumlah order nya, dan berapa customer yang sudah order film tersebut.

-- 3) Tampilkan seluruh customer yang sudah meminjam lebih dari 2 kali film-film dengan kategori: 'Drama', 'Comedy', 'Horror'. 
-- 	  Tampilkan juga email, alamat, genre, dan jumlah order nya.

-- 4) Tampilkan 5 kota yang menghasilkan sales tertinggi pada database ini. 
-- 	  Tampilkan juga nama negara, jumlah customer, berapa kali jumlah pinjaman nya, dan total sales yang dihasilkan.

-- 5) Tampilkan 10 customer yang menghasilkan sales tertinggi dan sales terdendah pada database ini. 
-- 	  Tampilkan juga email, alamat, kota, negara, berapa kali jumlah order nya, total sales yang dihasilkan, dan keterangan.
-- 	  Beri nama keterangan 'TOP' untuk customer yang memiliki sales tertinggi, dan 'LOW' untuk customer yang memiliki sales rendah.

-- no.1
SELECT 
	a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    c.name AS genre_film,
    COUNT(distinct fa.film_id) AS jumlah_film
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
where	f.`length` > 60
		AND f.special_features LIKE '%Behind the Scenes%'
GROUP BY a.actor_id, c.name  
ORDER BY jumlah_film desc
limit 10;

/*SELECT 
	a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    c.name AS genre_film,
    COUNT(distinct fa.film_id) AS jumlah_film
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
where	f.`length` > 60
		AND f.special_features ='Behind the Scenes'
GROUP BY a.actor_id, c.name  
ORDER BY jumlah_film desc
limit 10;
*/

-- no 2
SELECT 
    f.title AS judul_film,
    COUNT(p.payment_id) AS jumlah_pesanan,
    COUNT(DISTINCT c.customer_id) AS jumlah_pelanggan,
    SUM(p.amount) AS total_penjualan
from film f
join inventory i ON f.film_id = i.film_id
join rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
JOIN customer c ON p.customer_id = c.customer_id
GROUP by f.title
ORDER by total_penjualan DESC
LIMIT 5;

-- no 3
-- cara 1
SELECT
    c.customer_id,
    c.email,
    a.address,
    GROUP_CONCAT(DISTINCT cat.name) AS genre,
    COUNT(DISTINCT r.rental_id) AS jumlah_order
from customer c
join address a on c.address_id = a.address_id 
join rental r ON c.customer_id = r.customer_id
join inventory i ON r.inventory_id = i.inventory_id
join film f ON i.film_id = f.film_id
join film_category fc ON f.film_id = fc.film_id
join category cat ON fc.category_id = cat.category_id
where cat.name IN ('Drama', 'Comedy', 'Horror')
GROUP by c.customer_id
having jumlah_order > 2
ORDER by jumlah_order DESC;

-- cara 2
/*SELECT
    c.customer_id,
    c.email,
    a.address,
    group_concat(distinct cat.name) AS genre,
    COUNT(DISTINCT r.rental_id) AS jumlah_order
from customer c
join address a on c.address_id = a.address_id 
join rental r ON c.customer_id = r.customer_id
join inventory i ON r.inventory_id = i.inventory_id
join film f ON i.film_id = f.film_id
join film_category fc ON f.film_id = fc.film_id
join category cat ON fc.category_id = cat.category_id
where cat.name IN ('Drama', 'Comedy', 'Horror')
GROUP by c.customer_id, cat.name 
having jumlah_order > 2
ORDER by jumlah_order DESC;
*/
-- no.4
select
	co.country AS nama_negara,
    ci.city AS nama_kota,
    COUNT(distinct cus.customer_id) AS jumlah_customer,
    COUNT(re.rental_id) AS jumlah_peminjaman,
    SUM(pay.amount) AS total_sales
from city ci
join country co ON ci.country_id = co.country_id
join address addr ON ci.city_id = addr.city_id
join customer cus ON addr.address_id = cus.address_id
join rental re ON cus.customer_id = re.customer_id
join payment pay ON re.rental_id = pay.rental_id
GROUP by ci.city, co.country
ORDER by total_sales DESC
LIMIT 5;

-- no.5
-- cara 1 union
(
    SELECT
        c.customer_id,
        c.email,
        a.address ,
        ci.city,
        co.country,
        COUNT(r.rental_id) AS jumlah_order,
        SUM(p.amount) AS total_sales,
        'TOP' AS keterangan
    from customer c
    join address a ON c.address_id = a.address_id
    join city ci ON a.city_id = ci.city_id
    join country co ON ci.country_id = co.country_id
    join rental r ON c.customer_id = r.customer_id
    join payment p ON r.rental_id = p.rental_id
    GROUP by c.customer_id,c.email, a.address, ci.city,co.country
    ORDER by total_sales desc
    limit 10
)
UNION ALL
(
    SELECT
        c.customer_id,
        c.email,
        a.address ,
        ci.city,
        co.country,
        COUNT(r.rental_id) AS jumlah_order,
        SUM(p.amount) AS total_sales,
        'LOW' AS keterangan
    from customer c
    join address a ON c.address_id = a.address_id
    join city ci ON a.city_id = ci.city_id
    join country co ON ci.country_id = co.country_id
    join rental r ON c.customer_id = r.customer_id
    join payment p ON r.rental_id = p.rental_id
    GROUP by c.customer_id,c.email, a.address, ci.city,co.country
    ORDER by total_sales asc 
    LIMIT 10
)
ORDER BY
    total_sales desc, keterangan desc;

-- cara 2 sub querry
SELECT
    c.customer_id,
    c.email,
    a.address,
    ct.city,
    co.country,
    COUNT(p.payment_id) AS jumlah_order,
    SUM(p.amount) AS total_sales,
    CASE
        WHEN top_ranks.customer_rank <= 10 THEN 'TOP'
        WHEN low_ranks.customer_rank <= 10 THEN 'LOW'
    END AS keterangan
from customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country co ON ct.country_id = co.country_id
JOIN payment p ON c.customer_id = p.customer_id
JOIN (
    select 	customer_id,
        	RANK() OVER (ORDER BY SUM(amount) DESC) AS customer_rank
    from payment
    GROUP by customer_id
) AS top_ranks ON c.customer_id = top_ranks.customer_id
JOIN (
    select 	customer_id,
        	RANK() OVER (ORDER BY SUM(amount) ASC) AS customer_rank
    from payment
    GROUP by customer_id
) AS low_ranks ON c.customer_id = low_ranks.customer_id
GROUP by c.customer_id, c.email, a.address, ct.city, co.country, keterangan
having keterangan IS NOT NULL
ORDER by keterangan desc , total_sales desc;