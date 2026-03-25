select * from film --ejercicio2--
where rating = 'R'
order by film.title ;

select * from actor--ejercicio3--
where actor_id between 30 and 40;

select * from film --ejercicio4--
where original_language_id is not null
order by film.title ;

select * from film --ejercicio5--
order by rental_duration asc;

select first_name, last_name from actor a --ejercicio6--
where last_name like '%Allen%';

select f.rating ,count (*)--ejercicio7-
from film f 
group by f.rating;

select * from film f --ejercicio8-
where f.rating = 'PG-13' or f.rental_duration >3;

SELECT VARIANCE(replacement_cost) AS variabilidad --ejercicio9-
FROM film;

select Max (f.rental_duration ), Min (f.rental_duration ) --ejercicio10--
from film f;

select p.amount, p.payment_date  from payment p
order by payment_date desc
limit 1 offset 2;--ejercicio11--

select title  from film
where rating not in ('NC-17', 'G');--ejercicio12--

select AVG(length ), rating as duracion_media from film
group by rating;--ejercicio13--

select title l, length  from film
where length > 180;--ejercicio14--

select sum(p.amount)  from payment p;
--ejercicio15--

select * from customer c
order by c.customer_id  desc
limit 10;--ejercicio16--

SELECT a.first_name, a.last_name
FROM actor a
inner join film_actor fa on a.actor_id = fa.actor_id 
inner join film f on f.film_id = fa.film_id 
where f.title = 'EGG IGBY';--ejercicio17--

select distinct (Title) from film f;--ejercicio18--

select title l, length  from film
where length > 180;--ejercicio18--


SELECT f.title
FROM film f
inner JOIN film_category fc ON f.film_id = fc.film_id
inner JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy'
AND f.length > 180;--ejercicio19--

select fc.category_id, c."name", round (AVG(length)) as duracion_media from film
inner join film_category fc on fc.film_id = film.film_id
inner join category c ON fc.category_id = c.category_id
group by fc.category_id, c."name"
having AVG(length)> 110
order by 1; --ejercicio20--

SELECT AVG(rental_duration) AS media_duracion_alquiler
FROM film; --ejercicio21-

SELECT first_name ||' '|| last_name AS nombre_completo
FROM actor;--ejercicio22-

SELECT rental_date, COUNT(*) AS cantidad_alquileres
FROM rental
GROUP BY rental_date
ORDER BY 2 DESC;--ejercicio23-


SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);--ejercicio24-

SELECT EXTRACT(MONTH FROM rental_date) AS mes,
       COUNT(*) AS cantidad_alquileres
FROM rental
GROUP BY EXTRACT(MONTH FROM rental_date)
ORDER BY mes;--ejercicio25-

select avg(amount) as media, sum(amount) as total,  STDDEV (amount) as desviacion 
from payment p;--ejercicio26-

SELECT title, rental_rate
FROM film
where rental_rate > (select avg(rental_rate) from film);--ejercicio27-

SELECT actor_id, COUNT(film_id) AS cantidad_peliculas
FROM film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 40;--ejercicio28-

SELECT f.title,
       COUNT(i.inventory_id) AS cantidad_disponible
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY f.title;--ejercicio29-

SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) AS nombre_completo,
       COUNT(fa.film_id) AS cantidad_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY cantidad_peliculas DESC;--ejercicio30-

SELECT f.title,
       a.first_name||' '|| a.last_name AS nombre_actor
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.title, nombre_actor;-ejercicio31-

SELECT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor,
       f.title AS pelicula
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY nombre_actor, pelicula;-ejercicio32-

SELECT f.title,
       r.rental_id,
       r.rental_date,
       r.return_date,
       r.customer_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY f.title, r.rental_date;-ejercicio33-

select customer_id, sum(amount) as total
from payment p
group by p.customer_id 
order by 2 desc
limit 5;-ejercicio34-

select actor_id, a.first_name 
from actor a 
where a.first_name = 'JOHNNY';-ejercicio35-

select a.first_name as NOMBRE, a.last_name as APELLIDOS
from actor a;-ejercicio36-

select MAX(a.actor_id ), min(a.actor_id ) 
from actor a;-ejercicio37-

select count(actor_id) as total
from actor a;-ejercicio38-

select a.first_name ||' '||a.last_name  from actor a
order by 1 asc;-ejercicio39-

select title from film f
limit 5;-ejercicio40-

select first_name, count(a.first_name ) from actor a
group by first_name
order by count desc;-ejercicio41-

select r.rental_id, r.customer_id, c.first_name   from rental r 
left join customer c on c.customer_id = r.customer_id;-ejercicio42-

select c.first_name, r.rental_id, r.rental_date from rental r 
right join customer c on r.customer_id = c.customer_id
order  by 3 desc;-ejercicio43-

select * from film f cross join category c;-ejercicio44-
--muestra todas las combinaciones posibles--

SELECT DISTINCT a.first_name, a.last_name, c.name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';--ejercicio45--

SELECT a.first_name, a.last_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;--ejercicio46-

SELECT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor,
       COUNT(fa.film_id) AS cantidad_peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY cantidad_peliculas DESC;--ejercicio47-

CREATE VIEW actor_num_peliculas AS
SELECT CONCAT(a.first_name, ' ', a.last_name) AS nombre_actor,
       COUNT(fa.film_id) AS numero_peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;--ejercicio48-

SELECT customer_id,
       COUNT(*) AS total_alquileres
FROM rental
GROUP BY customer_id
ORDER BY total_alquileres DESC;--ejercicio49--

SELECT SUM(f.length) AS duracion_total
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';--ejercicio50--

CREATE TEMPORARY TABLE cliente_rentas_temporal AS
SELECT customer_id,
       COUNT(*) AS total_alquileres
FROM rental
GROUP BY customer_id;-ejercicio51-

SELECT * FROM cliente_rentas_temporal;--ejercicio51--

CREATE TEMPORARY TABLE peliculas_alquiladas AS
SELECT f.film_id,
       f.title,
       COUNT(r.rental_id) AS total_alquileres
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(r.rental_id) >= 10;--ejercicio52--

SELECT f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE c.first_name = 'TAMMY'
  AND c.last_name = 'SANDERS'
  AND r.return_date IS NULL
ORDER BY f.title;--ejercicio53--

SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi'
ORDER BY a.last_name, a.first_name;--ejercicio54--

SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date > (
    SELECT MIN(r2.rental_date)
    FROM film f2
    JOIN inventory i2 ON f2.film_id = i2.film_id
    JOIN rental r2 ON i2.inventory_id = r2.inventory_id
    WHERE f2.title = 'SPARTACUS CHEAPER'
)
ORDER BY a.last_name, a.first_name;--ejercicio55--

SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (
    SELECT 1
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE fa.actor_id = a.actor_id
      AND c.name = 'Music'
)
ORDER BY a.last_name, a.first_name;--ejercicio56--

SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE (r.return_date - r.rental_date) > INTERVAL '8 days';--ejercicio57--

SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
WHERE fc.category_id = (
    SELECT fc2.category_id
    FROM film f2
    JOIN film_category fc2 ON f2.film_id = fc2.film_id
    WHERE f2.title = 'ANIMATION'
)
ORDER BY f.title;--ejercicio58--

SELECT title, Length
FROM film
WHERE length = (
    SELECT length
    FROM film
    WHERE title = 'DANCING FEVER'
)
ORDER BY title;--ejercicio59--

SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.film_id) >= 7
ORDER BY c.last_name, c.first_name;--ejercicio60--

SELECT c.name AS categoria,
       COUNT(r.rental_id) AS total_alquileres
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_alquileres DESC;--ejercicio61--

SELECT c.name AS categoria,
       COUNT(f.film_id) AS numero_peliculas
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE f.release_year = 2006
GROUP BY c.name
ORDER BY numero_peliculas DESC;--ejercicio62-

select * from staff s cross join store s2;--ejercicio63-

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(r.rental_id) AS total_peliculas_alquiladas
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_peliculas_alquiladas DESC;--ejercicio64-

select * from staff s cross join store s2;--ejercicio63-


