use sakila;
select * from rental;

-- date and time function with task----->


select sysdate(),current_timestamp(),now();
-- above 3 function gives us current time and date of the system
-- select curdate(),curtime() from dual;
-- select now(),adddate(now(),2) from dual;
-- function name = datediff
-- select extract(year from now()) from dual;



select rental_id,rental_date from rental;
select rental_id,extract(year from rental_date)as year from rental;
select rental_id,extract(month from rental_date)as month from rental;
select rental_id,extract(day from rental_date)as day from rental;
select rental_id,extract(hour from rental_date)as hour from rental;
select rental_id,extract(minute from rental_date)as min from rental;

select rental_date,adddate(rental_date,30) from rental;

select rental_id,rental_date ,date_format(rental_date, '%d-%m-%y') from rental;
select rental_id,rental_date,extract(month from rental_date) from rental;
select rental_id,rental_date, dayname(rental_date) from rental;
select rental_id,rental_date,adddate(rental_date,7) from rental;
select rental_id,rental_date,adddate(rental_date,-3) from rental;

select rental_id, 
hour(rental_date) -  hour(return_date) as hour from rental;

select rental_id,
minute(rental_date) - minute(return_date) as min from rental;

select rental_id,rental_date ,date_format(rental_date, '%d-%M-%Y') as date from rental;
select rental_id,rental_date from rental
where date(rental_date) = '2005-08-20';
select rental_id,rental_date from rental
where year(rental_date) = 2005;
select rental_id,rental_date from rental
where month(rental_date) = 08;

select rental_id,rental_date from rental
where rental_date is null;

select rental_id,rental_date,datediff(return_date,rental_date) > 5 from rental;

select * from payment;

select Payment_id,Amount,extract(year from payment_date) as year from payment;

select year(payment_date) as year,sum(amount)as total
from payment
group by year(payment_date);

select month(payment_date) as year,sum(amount)as total
from payment
group by month(payment_date);

select * from payment
where payment_date = '2005-05-25 11:30:37';

select Payment_id,Payment_date,date_format(payment_date,'%M-%d-%Y') as New_date
from payment; 
