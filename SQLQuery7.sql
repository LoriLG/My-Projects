/* DRILL 1 */

USE db_zoo
GO

SELECT * FROM tbl_habitat;

/* END DRILL 1*/


/* DRILL 2 */

USE db_zoo
GO

SELECT 
	species_name
FROM tbl_species 
WHERE species_order = 3

/* END DRILL 2 */



/* DRILL 3 */

USE db_zoo
GO

SELECT
	nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600
	
/* END DRILL 3 */


/* DRILL 4 */

USE db_zoo
GO

SELECT
 species_name, nutrition_id
 FROM tbl_species, tbl_nutrition
 WHERE nutrition_id > = 2202 AND nutrition_id < = 2206

/* END DRILL 4 */


 /* DRILL 5 */

USE db_zoo
GO

SELECT
	species_name AS [Species Name], nutrition_type AS [Nutrition Type]
FROM tbl_species, tbl_nutrition

/* END DRILL 5 */



/* DRILL 6 */

USE db_zoo
GO

	SELECT
		 tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact, tbl_species.species_name
	FROM tbl_specialist
		INNER JOIN tbl_care ON tbl_specialist.specialist_id = tbl_care.care_specialist
		INNER JOIN tbl_species ON tbl_species.species_care = tbl_care.care_id
	WHERE tbl_species.species_name = 'penguin'
;

/* END DRILL 6 */	


	 
/* DRILL 7 */

CREATE DATABASE db_restaurant; 

USE db_restaurant

CREATE TABLE tbl_customer (
	customer_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	customer_firstname VARCHAR(50) NOT NULL,
	customer_lastname VARCHAR(50) NOT NULL
);

INSERT INTO tbl_customer
	(customer_firstname, customer_lastname)
	VALUES
	('Tom', 'Sawyer'),
	('Mary', 'Poppins'),
	('Yogi','Bear'),
	('Pickachu', 'Electric'),
	('Taylor', 'Swift'),
	('Ray', 'Charles'),
	('Stevie', 'Wonder'),
	('Will', 'Smith'),
	('Sandra', 'Bullock'),
	('Elizabeth','Shakespeare')
;

SELECT * FROM tbl_customer;


CREATE TABLE tbl_favorite (
       favorite_id INT NOT NULL IDENTITY (20,1),
	   favorite_dish VARCHAR(50) NOT NULL,
	   favorite_beverage VARCHAR(50) NOT NULL,
	   customer_id INT NOT NULL
	   PRIMARY KEY (favorite_id)
	   FOREIGN KEY(customer_id) REFERENCES tbl_customer(customer_id)
);

INSERT INTO tbl_favorite
	(favorite_dish, favorite_beverage, customer_id)
	VALUES
	('spaghetti', 'milk', 1),
	('pheasant', 'tea', 2),
	('picnic baskets', 'honey-flavored beer', 3),
	('eel', 'coca-cola', 4),
	('salad', 'wine', 5),
	('steak', 'coffee', 6),
	('chicken', 'coffee', 7),
	('veal', 'wine', 8),
	('chicken', 'wine', 9),
	('roast beef', 'tea', 10)
;

SELECT * FROM tbl_favorite;


SELECT 
		tbl_customer.customer_firstname, tbl_customer.customer_lastname, tbl_favorite.favorite_beverage
	FROM tbl_customer
	INNER JOIN tbl_favorite ON tbl_favorite.customer_id = tbl_customer.customer_id
	WHERE tbl_favorite.favorite_beverage = 'wine'
;

/* END DRILL 7 */


	