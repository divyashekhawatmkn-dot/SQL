use sakila;
select * from film;

-- String function -->

select title ,description from film;
select title,upper(title) as uppercase from film;
select title,lower(title) as lowercase from film;
select title, length(title)  from film;
select film_id, title , length(title)from film where length(title) > 10;
select title ,substr(title,1,5) from film;
select title , left(title,3) from film;
select title, right(title,4)from film;
select title, instr(title,'a') from film;

-- Like ----->
-- es mai ACADEMY  k aage piche jitne word honge vo show honge --
select title FROM film where title like '%ACADEMY%'; 

-- ess mai ACADEMY k aage 7 char ka word aayaega or piche jo bhi hoga vo ---
select title from film where title like '________ACADEMY%';
select title from film where title like 'A%';
select title from film where title like '%A%';
select title from film where title like '%A';
select title from film where title like 'A_%';
select title from film where title like '_A____';
select * from film;



-- TASK -->

select title ,left(title,3),right(title,3) from film;
select description ,instr(description,'Drama') from film;
select description,length(description) from film where length(description) > 200;
select extract(year from last_update) as year from film;
select extract(month from last_update) as month from film;
select extract(day from last_update) as day from film;
select extract(hour from last_update) as hour from film;
select extract(minute from last_update) as minute from film;
select date_format(last_update,'%M') from film;
select date_format(last_update,'%D') from film;
select title,length(title) from film where length(title) = 16;



select max(rental_duration),min(rental_duration),sum(rental_duration) from film;


select * from customer;

select first_name from customer;