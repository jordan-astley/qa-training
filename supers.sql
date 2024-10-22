
CREATE DATABASE supersdb;
USE supersdb;

DROP TABLE IF EXISTS teams, super_heroes;

CREATE TABLE teams (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
team_name VARCHAR(255) NOT NULL,
main_objective VARCHAR(255)
);

CREATE TABLE super_heroes (
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
real_name VARCHAR(255),
alias varchar(255) NOT NULL,
power_or_ability VARCHAR(255) NOT NULL,
team_id INT NOT NULL,
FOREIGN KEY (team_id) REFERENCES teams(id)
);

INSERT INTO teams (team_name, main_objective) VALUES
("Guardians of the globe", "defend earth"),
("Justice League", "defend earth"),
("x-men", "prevent human-mutant conflict");

INSERT INTO super_heroes (
real_name, alias, power_or_ability, team_id
) VALUES 
("Mark", "Invincible", "invincible, strength", 1),
("Nolan", "Omni-Man", "invincible, strength", 1),
("Bruce", "Batman", "detective, the dark knight", 2),
("Clarke", "Superman", "krypton", 2),
("Logan", "Wolverine", "healing, strength, claws", 3),
("Scott", "Cyclops", "laser eyes", 3);

SELECT real_name, alias, power_or_ability AS "powers", team_name, main_objective
 FROM super_heroes 
 JOIN teams ON super_heroes.team_id = teams.id;
 
 
 CREATE TABLE product (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(255) NOT NULL,
    stand_cost INT NOT NULL,
    list_price DECIMAL(6,2) NOT NULL,
    available_date DATE NOT NULL
);

INSERT INTO product (product_name, stand_cost, list_price, available_date) VALUES
("air jordan's", 500, 999.99, "1991-03-24"),
("2002r", 50, 140, "2002-07-15"),
("574", 10, 75.99, "1996-10-01"),
("992", 100, 240, "2000-01-01"),
("samba", 10, 100, "1985-06-06");

ALTER TABLE super_heroes ADD fav_product_id INT,
ADD FOREIGN KEY (fav_product_id) REFERENCES product(id);

UPDATE super_heroes
SET fav_product_id = 1 WHERE real_name = "Logan",
SET fav_product_id = 1 WHERE real_name = "Bruce",
SET fav_product_id = 4 WHERE real_name = "Nolan",
SET fav_product_id = 6 WHERE real_name = "Scott",
SET fav_product_id = 2 WHERE real_name = "Clarke",

 SELECT * FROM super_heroes INNER JOIN 