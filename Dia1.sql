select customer_name, Count (Distinct activity) as equipament
 from rentals
 group by customer_name
 having Count (Distinct activity) > 1
 order by equipament desc

 /*DAY 1 

A ski resort company want to know which customers rented ski equipment for more than one type of activity (e.g., skiing and snowboarding). List the customer names and the number of distinct activities they rented equipment for.

Table name: rentals

rental_id	customer_name	activity	rental_date
1	Emily	Skiing	2024-01-01
2	Michael	Snowboarding	2024-01-02
3	Emily	Snowboarding	2024-01-03
4	Sarah	Skiing	2024-01-01
5	Michael	Skiing	2024-01-02
6	Michael	Snowtubing	2024-01-02*/ 
