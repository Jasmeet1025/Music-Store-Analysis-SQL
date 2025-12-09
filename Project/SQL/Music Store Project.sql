-- CREATE A NEW DATABASE.
CREATE DATABASE MSTORE;


-- GET INTO THE DATABASE.
USE MSTORE;


-- IMPORT CSV USING THE TABLE IMPORT WIZARD / FLAT FILE IMPORT OPTION. 


-- 1. Who is the senior most employee based on job title?


select top(1)
	employee_id, 
	first_name,
	last_name,
	title,
	levels
from
employee
order by 5 desc;


-- 2. Which countries have the most Invoices?

select top (10)
	billing_country, count(billing_country) as 'No. of Invocies'
from invoice
group by billing_country
order by 2 desc;


-- 3. What are top 3 values of total invoice?

select top(3)
	invoice_id,
	billing_country,
	round(total,2) as Total
from
invoice
order by 3 desc;

/* 4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals. */

select top(10)
	billing_city ,
	round(sum(total),2) as Total_sum
from 
invoice
group by billing_city
order by 2 desc;




/* 5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money. */


select top(1)
	c.customer_id,
	c.first_name,
	c.last_name,
	round(sum(i.total),2) as 'Total Money Spent'
from
customer c
inner join invoice i
on c.customer_id = i.customer_id
group by c.customer_id , c.first_name, c.last_name
order by 4 desc;


/* 6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A. */

select 
distinct email,
first_name,
last_name,
g.name
from customer c
inner join invoice i
on c.customer_id = i.customer_id
inner join invoice_line il
on i.invoice_id = il.invoice_id
inner join track t
on il.track_id = t.track_id
inner join genre g
on t.genre_id = g.genre_id
where g.name = 'Rock'
order by 1 asc;

/* 7. Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands. */

select top(10)
	ar.artist_id,
	ar.name,
	count(*) as 'Number of Tracks'
from genre g
	inner join track t
	on g.genre_id = t.genre_id
	inner join album a
	on a.album_id = t.album_id
	inner join artist ar
	on ar.artist_id = a.artist_id
where g.name = 'rock'
group by ar.artist_id , ar.name
order by 3 desc;

/* 8. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first. */

select
	[name],
	(milliseconds / 60000) as Length_In_Mins
from track
where
	milliseconds > ( select avg(milliseconds) from track )
order by 2 desc;




/*9. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent. */

select
	c.first_name,
	c.last_name,
	a.[name],
	round(sum(il.unit_price * il.quantity),2) as Total_Spent
from customer c
inner join invoice i
on c.customer_id = i.customer_id
inner join invoice_line il
on i.invoice_id = il.invoice_id
inner join track t
on il.track_id = t.track_id
inner join album al
on al.album_id = t.album_id
inner join artist [a]
on al.artist_id = a.artist_id
group by c.first_name, c.last_name, a.[name]
order by 4 desc; 


/*10. We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres. */

with PopGenre as (
select 
	i.billing_country,
	g.[name],
	round(sum(i.total),2) as total ,
	row_number() over (partition by billing_country order by sum(i.total) desc) RN
from
customer c
	inner join invoice i
		on c.customer_id = i.customer_id
	inner join invoice_line il
		on i.invoice_id = il.invoice_id
	inner join track t
		on t.track_id = il.track_id
	inner join genre g
		on t.genre_id = g.genre_id
group by g.[name], i.billing_country) 
select * 
from
PopGenre
where RN = 1
order by total desc;


/*11. Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount. */

with customer_invoice as (
select
	first_name ,
	last_name ,
	billing_country , 
	sum(total) as Total_Spent ,
	rank() over (partition by billing_country order by sum(total) desc) as Spent_Ranking
from
customer c
inner join invoice i
on c.customer_id = i.customer_id
group by c.customer_id, first_name ,  last_name , billing_country )

select 
	first_name,
	last_name,
	billing_country,
	Total_Spent
from customer_invoice
where Spent_Ranking = 1
order by 4 desc;


