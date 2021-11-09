CREATE DATABASE agrimachinary;

CREATE TABLE IF NOT EXISTS tractors(
	t_id INT PRIMARY KEY AUTO_INCREMENT,
	t_name VARCHAR(20) NOT NULL,
	t_description TEXT,
	t_power INT NOT NULL,
	t_price DECIMAL(8,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS users(
	u_id INT PRIMARY KEY AUTO_INCREMENT,
	u_username VARCHAR(20) NOT NULL,
	u_password CHAR(20) NOT NULL,
	u_phone CHAR(11) NOT NULL,
	u_place VARCHAR(20) NOT NULL,
	u_isAdmin BOOL DEFAULT FALSE
);

INSERT INTO 
	tractors(t_name, t_description, t_power, t_price)
VALUES
	('ewqds','12e3rethy',20,1.23),
	('21wsa','iugiwehqdsa',10,23.3),
	('ojcx','ewqds',2200,982);
	
INSERT INTO
	users(u_username, u_password, u_phone, u_place, u_isAdmin)
VALUES
	('rainbowwolfer','123456','18919626820','SA',TRUE);
	
INSERT INTO tractors(t_name, t_description, t_power, t_price) VALUES ('iukjhg','2354trgf',123,231.21);

DELETE FROM tractors WHERE t_name = 'iukjhg';
	
UPDATE tractors SET t_name = '?', t_description = '?', t_power = '?', t_price = '?' WHERE id = '?';