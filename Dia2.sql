/*Today's Question:

Santa wants to know which gifts weigh more than 1 kg. Can you list them?

Table name: gifts

gift_name	recipient	weight_kg
Toy Train	John	2.5
Chocolate Box	Alice	0.8
Teddy Bear	Sophia	1.2
Board Game	Liam	0.9*/

select gift_name from gifts
where weight_kg > 1