/*Today's Question:

The owner of a winter market wants to know which vendors have generated the highest revenue overall. For each vendor, calculate the total revenue for all their items and return a list of the top 2 vendors by total revenue. Include the vendor_name and total_revenue in your results.

Table name: vendors

vendor_id	vendor_name	market_location
1	Cozy Crafts	Downtown Square
2	Sweet Treats	Central Park
3	Winter Warmers	Downtown Square
Table name: sales

sale_id	vendor_id	item_name	quantity_sold	price_per_unit
1	1	Knitted Scarf	15	25
2	2	Hot Chocolate	50	3.5
3	3	Wool Hat	20	18
4	1	Handmade Ornament	10	15
5	2	Gingerbread Cookie	30	5
*/

SELECT 
    v.vendor_name, 
    SUM(s.quantity_sold * s.price_per_unit) AS total_revenue
FROM 
    vendors v
JOIN 
    sales s
ON 
    v.vendor_id = s.vendor_id
GROUP BY 
    v.vendor_name
ORDER BY 
    total_revenue DESC
LIMIT 2;