📀 Music Store Data Analysis (SQL Project)

This project explores a complete digital music store database using SQL Server to answer business-driven questions about customers, sales, employees, genres, and purchasing behavior.
The goal is to practice advanced SQL queries and derive meaningful insights from a real-world relational dataset.

🚀 Project Overview

The Music Store contains multiple tables such as customers, invoices, tracks, artists, albums, employees, and genres.
Using SQL, I performed data exploration, aggregations, and analytical queries to answer key questions related to:

Customer spending habits

Most popular genres and artists

Revenue distribution across countries and cities

Employee hierarchy

High-value invoices

Track length and music preferences

This project improves skills in joins, CTEs, window functions, grouping, filtering, and subqueries.

🛠 Tools & Technologies Used

SQL Server (T-SQL)

Aggregate Functions

CTEs

Window Functions

INNER JOIN / LEFT JOIN

Grouping & Ordering

Subqueries

📁 Dataset Structure

The project uses the standard Music Store schema with the following tables:

album.csv
artist.csv
customer.csv
employee.csv
genre.csv
invoice.csv
invoice_line.csv
track.csv


These datasets collectively form a relational database suitable for SQL analysis.

🔍 Key Analysis & Questions Solved
1. Senior-most employee by job title

Identified which employee has the highest job level.

2. Countries with the most invoices

Analyzed total invoices grouped by billing country.

3. Highest invoice amounts

Listed top 3 invoices with the largest total.

4. City with highest revenue

Found the city generating the most sales to support marketing decisions.

5. Best customer

Identified the customer who spent the most money overall.

6. Rock music listeners

Retrieved customer emails and names of all users who purchased Rock genre tracks.

7. Most successful rock artists

Ranked the top 10 artists based on rock track count.

8. Tracks longer than average

Found tracks exceeding the average song length.

9. Amount spent by each customer on each artist

Calculated total spending per customer-artist combination.

10. Most popular genres by country

Used window functions to identify the #1 genre in each country.

11. Top-spending customers per country

Used ranking functions to find which customer spent the most in each country.

📈 Key Insights

Rock music is one of the most frequently purchased genres.

Certain customers consistently spend more, indicating high-value segments.

Revenue varies heavily by country and city, useful for targeted promotions.

Some artists significantly dominate specific genres (especially Rock).

Average track length helps identify longer, premium compositions.

📂 Recommended Folder Structure

Your GitHub repo can be organized like this:

README.md
sql/
   └── Music_Store_Project.sql
data/
   ├── album.csv
   ├── artist.csv
   ├── customer.csv
   ├── employee.csv
   ├── genre.csv
   ├── invoice.csv
   ├── invoice_line.csv
   └── track.csv
docs/
   └── Project_Notes.md (optional)

📌 How to Use

Import all CSV files into SQL Server using Flat File Import.

Run the Music_Store_Project.sql script inside the sql/ folder.

Explore or modify queries to deepen your analysis.