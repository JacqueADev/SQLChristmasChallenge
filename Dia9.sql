/*Today's Question:

A community is hosting a series of festive feasts, and they want to ensure a balanced menu. Write a query to identify the top 3 most calorie-dense dishes (calories per gram) served for each event. Include the dish_name, event_name, and the calculated calorie density in your results.

Table name: events

event_id	event_name
1	Christmas Eve Dinner
2	New Years Feast
3	Winter Solstice Potluck
Table name: menu

dish_id	dish_name	event_id	calories	weight_g
1	Roast Turkey	1	3500	5000
2	Chocolate Yule Log	1	2200	1000
3	Cheese Fondue	2	1500	800
4	Holiday Fruitcake	3	4000	1200
5	Honey Glazed Ham	2	2800	3500
*/

WITH calorie_density AS (
    -- Calcular a densidade calórica de cada prato
    SELECT 
        m.dish_name,
        e.event_name,
        m.calories / CAST(m.weight_g AS FLOAT) AS calorie_density,
        m.event_id
    FROM 
        menu m
    JOIN 
        events e
    ON 
        m.event_id = e.event_id
),
ranked_dishes AS (
    -- Classifica os pratos dentro de cada evento por densidade calórica
    SELECT 
        dish_name,
        event_name,
        calorie_density,
        RANK() OVER (PARTITION BY event_id ORDER BY calorie_density DESC) AS rank
    FROM 
        calorie_density
)
-- Seleciona apenas os 3 pratos mais calóricos por evento
SELECT 
    dish_name,
    event_name,
    calorie_density
FROM 
    ranked_dishes
WHERE 
    rank <= 3
ORDER BY 
    event_name, rank;
