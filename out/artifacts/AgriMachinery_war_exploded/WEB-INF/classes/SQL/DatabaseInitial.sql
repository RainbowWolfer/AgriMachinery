CREATE DATABASE agrimachinary;

DROP TABLE IF EXISTS tractors;
CREATE TABLE IF NOT EXISTS tractors(
	t_id INT PRIMARY KEY AUTO_INCREMENT,
	t_name VARCHAR(20) NOT NULL,
	t_description TEXT,
	t_power INT NOT NULL,
	t_price DECIMAL(8, 2) NOT NULL
);

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
	u_id INT PRIMARY KEY AUTO_INCREMENT,
	u_username VARCHAR(20) NOT NULL,
	u_password CHAR(20) NOT NULL,
	u_phone CHAR(11) NOT NULL,
	u_place VARCHAR(20) NOT NULL,
	u_isAdmin BOOL DEFAULT FALSE
);

DROP TABLE IF EXISTS user_owned;

CREATE TABLE IF NOT EXISTS user_owned(
	o_id INT PRIMARY KEY AUTO_INCREMENT,
	o_user_id INT NOT NULL,
	o_tractor_id INT NOT NULL,
	CONSTRAINT fk_r_user FOREIGN KEY(o_user_id) REFERENCES users(u_id),
	CONSTRAINT fk_r_tractor FOREIGN KEY(o_tractor_id) REFERENCES tractors(t_id),
	UNIQUE KEY uk_r_owned(o_tractor_id)
);

INSERT INTO
	tractors(t_name, t_description, t_power, t_price)
VALUES
	('大葱种植培土机', '适用性强：适用各种山地（坡地除外），丘陵、平原、旱田、水田、大棚、果园、及狭窄地作业，省心。
1.标准功能：开沟、培土、起垄。
2.选配功能：打药、播种、施肥、旋耕、松土、除草等多种功能（一般需定做）。
3.适合土质：适用于平原沙土地、粘性较小的粘土地。
4.手把是挂档杆设计：优点，操作更加灵活。
5.开沟效果好：深度可达30-40厘米，宽度在11厘米至40厘米之间（需更换刀具），深度、宽度灵活调整，操作方便，简单实用。
6.多功能：多种功能集一身，一机多用，不用重复购买，省钱。
7 机身加厚，链条和齿轮传动，刀具都是65锰钢锻造，非常，省钱。
8.省油：每亩地费用在5-7元钱，真正省钱。', 20, 1.23),
	('农田土壤捡石机', '农田里的石块会极大地影响种植收益，同时对播种机械，田间管理机械和收获机械也有明显破坏。在我国西部，西北部，西南部，北部等地区大量土地中都有数量不等的石块。捡石机为您解决农田石块问题，真正做到戈壁变良田。捡石机是一种新型石头捡拾收集设备，一种将地里工作深度之上的所有土壤和石块都吃进去，全部筛分后土壤还田，石头被传送进料斗，待料斗装满后倒掉或装车运走的设备。', 10, 23.3),
	('农机厂家柴油手扶拖拉机', '果园全新手扶拖拉机 多功能旋耕手扶拖拉机 履带式手扶拖拉机

　　手扶拖拉机是一种小型拖拉机。欧美称作园圃拖拉机。由发动机，底盘、电气等系统组成的主要用于牵引和运输的多用途行走机械。手扶拖拉机能行驶是靠内燃机的动力经传动系统，获得驱动扭矩的驱动轮再通过轮胎花纹和轮胎表面给地面小、向后的水平作用力（切线力），这个反作用力就是推动拖拉机向前行驶的驱动力（也称喂推进力）。结构简单，功率较小，适于小块耕地。由驾驶员扶着扶手架控制操纵机构、牵引或驱动配套农具进行作业。', 2200, 982),
	('小微耕机','盛捷果园管理机开沟、施肥、覆土一体联合作业，一次性把肥料埋在地里。施肥量有电动可调（需搭配电动肥料箱），手动可调两种调节方式，施肥深度液压可调，满足不同作物的施肥要求，特别适用于颗粒状或粉末状肥料或农家肥料的施肥作业',120,124.2),
	('农用履带旋耕机','履带式小型微耕机可以实现大型机械无法进入的小块土地、大棚、茶园、丘陵、山地等不同的地形和土质进行作业。本机为链条传动，是集众家之长，开发研制的新型农机产品。该产品性能 质量精良、操作简单、配套农机具齐全，适用范围广，成其在果园、大棚、梯田、坡地等地域作业以及在棉花、玉米 甘蔗、大葱、葡萄、苗木等经济作物的中耕。种姜、出姜、土豆挖掘，更能发挥，独到之处，其体积小、力量大、用途广泛，具有其它类似产品无可替代的优越性。',214,1245.7),
	('多功能田园管理机','多功能履带式开沟施肥机具有对土壤的单位面积压力小和对土壤的附着性能好（不易打滑）等优点，在土壤潮湿及松软地带有较好的通过性能。',321,2314.2),
	('自走式果园除草机','农用新款微耕机 农机厂家直销手扶式田园管理机 自走式果园除草机',512,552.1);

INSERT INTO
	users(u_username,u_password,u_phone,u_place,u_isAdmin)
VALUES
	('RainbowWolfer',' 123456 ','18919626820','SA',TRUE),
	('ForcingSmile',' 321654 ','1234567','LA',FALSE);
	
INSERT INTO
	user_owned(o_user_id, o_tractor_id)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,6),
	(2,7);
