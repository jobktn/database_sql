-- Create table --
CREATE TABLE interRestuarant (
  	id INT PRIMARY KEY,
  	name TEXT,
  	cuisines TEXT,
 	type TEXT
);

-- Create more table -- 
CREATE TABLE restuarantRating (
  id INT,
  price REAL,
  no_sales INT,
  vote INT,
  rating INT
); 

-- insert data in table -- 
INSERT INTo interRestuarant VALUES
	(1, "Steak", "Italian", "Main"),
    (2, "Pizza", "Italian", "Main"),
    (3, "Sushi", "Japanese", "Main"),
    (4, "Hamburger", "American", "Main"),
    (5, "Fish and chip", "British", "Main"),
    (6, "Peking duck", "Chinese", "Main"),
    (7, "Ice Cream", "Italian", "Dessert"),
    (8, "Tom yum goong", "Thai", "Main"),
    (9, "Croissant", "French", "Dessert"),
    (10, "Samosa", "Indian", "Main"),
    (11, "Tacos", "Mexican", "Main"),
    (12, "Ramen", "Japanese", "Main"),
    (13, "Pasta", "Italian", "Main"),
    (14, "Mac and Cheese", "American", "Main"),
    (15, "Noodles", "Chinese", "Main");

-- insert data in table -- 
INSERT INTo restuarantRating VALUES
	(1, 6.99, 163, 107, 9.8),
    (2, 5.29, 95, 77, 8.5),
    (3, 8.49, 213, 101, 8.0),
    (4, 2.99, 298, 285, 9.6),
    (5, 3.99, 97, 26, 7.1),
    (6, 4.99, 197, 155, 7.6),
    (7, 4.49, 87, 39, 9.7),
    (8, 2.49, 229, 223, 8.5),
    (9, 3.49, 250, 139, 7.9),
    (10, 2.49, 133, 101, 9.2),
    (11, 2.49, 133, 128, 6.8),
    (12, 4.49, 124, 67, 7.1),
    (13, 7.49, 116, 39, 8.9),
    (14, 3.49, 219, 157, 9.0),
    (15, 4.49, 158, 108, 6.4);

-- Joining table and selecting some feature -- 
SELECT 
	interRestuarant.name As menu_names,
    interRestuarant.cuisines AS menu_cuisines,
    restuarantRating.price AS menu_prices,
    restuarantRating.rating AS menu_rating
FROM interRestuarant 
JOIN restuarantRating on interRestuarant.id = restuarantRating.id;
    
-- Let's do some queries :) --
-- what are the top 3 Italian menu ? -- >> The anwsers are Steak, Ice Cream, and Pasta. <<
SELECT 
	interRestuarant.name As menu_names,
    interRestuarant.cuisines AS menu_cuisines,
    restuarantRating.price AS menu_prices,
    restuarantRating.rating AS menu_rating
FROM interRestuarant 
JOIN restuarantRating on interRestuarant.id = restuarantRating.id
WHERE menu_cuisines IN ('Italian')
GROUP by menu_names
ORDER BY menu_rating DESC
LIMIT 3 ;

-- what is the most popular menu with price less than $5.49 ? -- >> The anwser is Hamburger. <<
SELECT 
	name,
    cuisines,
    price,
    no_sales
FROM interRestuarant 
LEFT JOIN restuarantRating on interRestuarant.id = restuarantRating.id
GROUP by name
HAVING price < 5.49
ORDER BY no_sales DESC
LIMIT 5 ;

-- what are MIN, MAX, AVG, price and SUM of no_sales ? -- >> The answers are 2.49, 8.49, 4.54, and 2512 <<
SELECT 
	MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS mean_price,
    SUM(no_sales) AS sum_sales
FROM interRestuarant 
LEFT JOIN restuarantRating on interRestuarant.id = restuarantRating.id;

--Menu ranking by rating -- 
SELECT 
	name,
    rating,
    RANK() OVER(ORDER BY rating DESC) AS Rank
FROM interRestuarant 
LEFT JOIN restuarantRating on interRestuarant.id = restuarantRating.id;
