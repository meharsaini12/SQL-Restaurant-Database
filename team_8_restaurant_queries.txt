/*Query 1*/
USE group8restaurants;
CREATE OR REPLACE VIEW item_prices_avg_sum AS
		SELECT meal_name AS item_name, CONCAT('$', price) AS price, item_id
		FROM meals JOIN menu USING(item_id)
	UNION
		SELECT drink_name AS item_name, CONCAT('$', price) AS price, item_id
		FROM drinks JOIN menu USING(item_id)
	UNION 
		SELECT 'Total', CONCAT('$', ROUND(SUM(price), 2)), NULL
		FROM menu
	UNION
		SELECT 'Average', CONCAT('$', ROUND(AVG(price), 2)), NULL
		FROM menu;

/*Query 2*/
USE group8restaurants;
CREATE OR REPLACE VIEW affordability_of_minority_owned AS
	SELECT restaurant_name, cuisine, affordability
	FROM restaurants
	WHERE restaurant_id in
		(SELECT restaurant_id FROM restaurants
		WHERE minority_owned = 1);

/*Query 3*/
USE group8restaurants;
CREATE OR REPLACE VIEW vegan_restaurants AS
	SELECT restaurant_name, dietary_restriction
	FROM restaurants JOIN has_dietary_restrictions USING(restaurant_id)
	JOIN dietary_restrictions USING(dietary_id)
	WHERE dietary_restriction = 'Vegan'
	ORDER BY restaurant_name;

/*Query 4*/
USE group8restaurants;
CREATE OR REPLACE VIEW alcoholic_drinks AS
	SELECT restaurant_name, drink_name
    FROM restaurants
    JOIN menu USING (restaurant_id)
    JOIN drinks USING (item_id)
    WHERE alcoholic = 1;

/*Query 5*/
USE group8restaurants;
CREATE OR REPLACE VIEW restaurant_total_rating AS
	SELECT restaurant_name, CONCAT(SUM(rating)) as `Total Rating Out of 25`
	FROM restaurants 
	JOIN reviews USING(restaurant_id)
	GROUP BY restaurant_id
	HAVING `Total Rating Out of 25` >= 17;
