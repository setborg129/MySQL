
-- 1. Создадим таблицу с Пользователями
  
/* drop table if exists Users;
CREATE TABLE Users(
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'уникальный идентификатор пользователя' ,
  first_name VARCHAR(50) not null COMMENT 'имя пользователя',
  last_name VARCHAR(50) not null COMMENT 'фамилия пользователя',
  email VARCHAR(100) not null unique COMMENT 'электронная почта пользователя',
  passwrd CHAR(100) not null COMMENT 'зашифрованный пароль пользователя',
  creared_data DATETIME not null default CURRENT_TIMESTAMP COMMENT 'дата регистрации пользователя',
  index (email)
  );*/
 

-- Заполним таблицу Users

-- INSERT INTO users VALUES (DEFAULT, 'Petya', 'Petukhov', 'petya@mail.com', 'sdfs234', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Igor', 'Malinov', 'Igor@mail.com', 'sdfxcv8877', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Maks', 'Maslov', 'Maks@mail.com', '1sd###cv8877', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Ilya', 'Ilya', 'Ilya@mail.com', 'sdfxcv8877', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Mysa', 'Petrov', 'Mysa@mail.com', 'sdfxcv8877', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Sany', 'Ibragimov', 'Sany@mail.com', 'sdfxcv8877', DEFAULT);
-- INSERT INTO users VALUES (DEFAULT, 'Kirril', 'Maximov', 'Kirril@mail.com', 'sdfxcv8877', DEFAULT);

/*
 * 2. Создадим таблицу с продуктами
 * 
-- drop table if exists products ;
 create table products(
 id_product BIGINT unsigned not null primary key COMMENT 'уникальный идентификатор товара',
 name_product varchar(50) not null COMMENT 'название товара',
 brand varchar(50) not null COMMENT 'бренд товара',
 category varchar(50) not null COMMENT 'категория товара',
 price decimal(11,2) not null COMMENT 'цена товара',
 description varchar(100) not null COMMENT 'описание товара',
 foreign KEY(id_product) references users(id)
 );
 */


-- Добавление данных в таблицу продукты

-- insert into products values (DEFAULT, 'Note S22' 'Samsung', 'Phone', 120.2, 'Telefon', '1', '2');
-- INSERT INTO products (id_product, name_product, brand, category, price, description)
-- VALUES (6, 'Note S9', 'Samsung', 'Phone', 10.99, 'Description1'),
-- (7, 'S-3345', 'Iphone', 'Phone', 10.99, 'Description1');
-- (1, 'Product1', 'Brand1', 'Category1', 10.99, 'Description1'), 
-- (3, 'Product2', 'Brand2', 'Category2', 20.99, 'Description2'),
-- (4, 'Product3', 'Brand3', 'Category3', 30.99, 'Description3');



 -- 3 Создадим таблицу с корзиной.
/*
create table Basket(
id BIGINT unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор корзины',
id_user BIGINT unsigned not null COMMENT 'ссылка на пользователя, которому принадлежит корзина',
id_product BIGINT unsigned not null COMMENT 'ссылка на товар, добавленный в корзину',
count INT not null COMMENT 'количество товара в корзине',
foreign key(id_user) references users(id),
foreign key(id_product) references products(id_product) );
*/



-- Заполняем данные для корзины !
-- insert into Basket values(default, 6, 6);
-- insert into Basket values(default, 1, 1);



-- 4 Создаем таблицу Заказы
/*
create table Orders(
	id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор заказа',
	id_user bigint unsigned not null COMMENT 'ссылка на пользователя, совершившего заказ',
	data_order datetime not null default CURRENT_TIMESTAMP COMMENT 'дата оформления заказа',
	status varchar(30) not null COMMENT 'текущий статус заказа',
	foreign key(id_user) references users(id) );
*/

-- Заполняем таблицу Заказы
/*
insert into orders values(default, 1, default, 'Ожидание оплаты'),
						(default, 6, default, 'Оплачен'),
						(default, 3, default, 'Оплата не прошла'),
						(default, 5, default, 'Оплачен');
*/

-- 5. создаем таблицу Адрес доставки.
/*
create table Address_Delivery(
	id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор адреса',
	id_order bigint unsigned not null COMMENT 'ссылка на заказ, к которому относится адрес',
	country varchar(40) not null COMMENT 'страна доставки',
	city varchar(40) not null COMMENT 'город доставки',
	street varchar(40) not null COMMENT 'улица доставки',
	house varchar(40) not null COMMENT 'дом доставки',
	email_index bigint not null COMMENT 'почтовый индекс доставки',
	foreign key (id_order) references orders(id)  );
*/

-- Заполняем таблицу Адрес доставки.

/*
insert into Address_Delivery values(default, 2, 'Russia', 'Moscow', 'Lenina', '1', 23431 ),
									(default, 4, 'Russia', 'Tumen', 'Lermontova', '31', 654654),
									(default, 5, 'Russia', 'Санкт-Питербург', 'Остновского', '16', 23 ),
									(default, 6, 'Russia', 'Омск', 'Маяковского', '15', 233331 ), 
								    (default, 7, 'Russia', 'Томск', 'Пушкина', '14', 2234231 );

*/

-- 6. Создаем таблицу Отзывы
/*
create table Reviews(
		id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор отзыва'  ,
		id_order bigint unsigned not null COMMENT 'ссылка на товар, к которому оставлен отзыв',
		from_id_user bigint unsigned not null COMMENT 'ссылка на пользователя, оставившего отзыв',
		topic varchar(30) not null COMMENT 'тема отзыва',
		text_rev text not null COMMENT 'текст отзыва',
		rating double not null COMMENT 'рейтинг товара по шкале от 1 до 5',
		created_at DATETIME NOT NULL DEFAULT NOW() COMMENT '',
		index Reviews_from_id_user_idx (from_id_user),
		foreign key (id_order) references orders(id),
		foreign key (from_id_user) references users(id));
*/

-- Заполняем таблицу Отзывы
/*
insert into Reviews values(default, 2, 4, 'Телефоны', 'Мне очень понравился телефон', 5, default),
							(default, 5, 3, 'Телефоны', 'Отличный телефон', 5, default),
							(default, 7, 7, 'Телефоны', 'стоит текущих денег', 5, default);

*/

-- 7 Создаем таблицу Поставщики.

/*
 * create table Suppliers(
		id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор поставщика',
		name varchar(50) not null COMMENT 'название поставщика',
		country varchar(40) not null COMMENT 'страна, в которой расположен поставщик',
		contact_name varchar(40) not null COMMENT 'контактное лицо поставщика',
		email VARCHAR(100) not null unique COMMENT 'электронная почта поставщика',
		telefon VARCHAR(100) not null unique COMMENT 'контактный номер телефона поставщика',
		id_product BIGINT unsigned not null COMMENT 'уникальный идентификатор продукта, ссылка на таблицу продукты поле id_product',
		foreign key (id_product) references products(id_product)
		);*/


-- Заполняем таблицу Поставщики
/* insert into Suppliers values(default, 'Tele_Market', 'Россия', 'Петр Васильевич', 'Petro@inbox.ru', '+789458585566', 1),
 							 (default, 'ТелеАудио_ИП', 'Россия', 'Иван Васильевич', 'ivan@inbox.ru', '+789362185566', 3),
 							 (default, 'ГалаМаркет', 'Россия', 'Игорь Петрович', 'igor@inbox.ru', '+789123485566', 4);*/


-- 8. Создаем таблицу Категория товара
/*
create table categories(
	id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор категории',
	title varchar(50) not null COMMENT 'название категории',
	id_user bigint unsigned not null COMMENT 'ссылка на id пользователя',
	foreign key (id_user) references users(id)	);
*/ 	
-- Заполняем таблицу Категория товара


/*insert into categories values(default, 'Phone', 1),
							 (default, 'Audio', 3),
							 (default, 'Video', 4);*/


-- 9. Создаем таблицу Скидки
/*
create table discount(
	id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор скидки',
	id_product BIGINT unsigned not null COMMENT 'ссылка на товар, на который действует скидка',
	percent DECIMAL(5,2) COMMENT 'процент скидки на товар',
	created_start DATETIME NOT NULL DEFAULT NOW() COMMENT 'дата начала действия скидки',
	created_end DATETIME NOT NULL DEFAULT NOW() COMMENT 'дата окончания действия скидки',
	foreign key (id_product) references products(id_product));
*/

-- Заполняем таблицу Скидки
/*
insert into discount values(default, 1, 14.5, default, '2024-02-04 23:59:59');
insert into discount values(default, 3, 20.0, default, '2024-02-04 23:59:59');
*/

-- 10. Создаем таблицу Избранное(Favourites)
/*
create table Favourites(
	id bigint unsigned auto_increment not null primary key COMMENT 'уникальный идентификатор записи в избранном',
	id_user bigint unsigned not null COMMENT 'ссылка на пользователя, добавившего запись в избранное',
	id_product BIGINT unsigned not null COMMENT 'ссылка на товар, добавленный в избранное',
	foreign key (id_user) references users(id) COMMENT '',
	foreign key (id_product) references products(id_product) );
*/


-- Заполняем таблицу Избранное
/*
insert into Favourites values(default, 1, 4),
							 (default, 1, 6);
*/							 
							
							
							