-- Скрипты выборок данных.

-- Обычная выборка
/*
1 .Выборка всех пользователей и их заказов:

SELECT
	Users.first_name,
	Users.last_name,
	Orders.id,
	Orders.data_order
FROM
	Users
JOIN Orders ON
	Users.id = Orders.id_user;



2. Выборка товаров в корзине пользователя:

select 
			u.first_name as Имя,
			u.last_name as Фамилия,
			u.email as Почта,
			p.name_product as Имя_Продукта,
			p.brand as Бренд_Продукта,
			p.price as Цена,
			p.name_product as Продукт_в_корзине
		from users u
		join basket  b on b.id = u.id
		join products  p on p.id_product = b.id_product

ИЛИ 

SELECT
	Users.first_name,
	Users.last_name,
	Basket.id_product,
	products.name_product
FROM
	Users
JOIN Basket ON
	Users.id = Basket.id_user
JOIN products ON
	Basket.id_product = products.id_product;
	
	
	
	
3. Выборка средней цены товаров по категориям:

SELECT
	category,
	AVG(price) AS average_price
FROM
	products
GROUP BY
	category;
	
		
			
4. Выборка количества товаров в каждой категории:

select
	category,
	COUNT(*) as total_count
from
	products
group by
	category;
	
5. Выборка заказов и соответствующих им адресов доставки:

select
	o.id,
	o.data_order,
	a.country,
	a.city,
	a.street,
	a.house
from
	Orders o
join Address_Delivery a on
	o.id = a.id_order;								
						
							
6. Выборка количество товаров в корзине для каждого пользователя:

select
	Users.first_name,
	Users.last_name,
	SUM(basket.count) as total_count
from
	Users
join basket on
	Users.id = basket.id_user
group by
	Users.id;				
									

7. Выборка всех пользователей, у которых есть товары в корзине, но нет оформленных заказов:

select
	users.first_name,
	users.last_name
from
	users
left join Basket on
	users.id = Basket.id_user
left join Orders on
	users.id = Orders.id_user
where
	Basket.id is not null
	and Orders.id is null;
												
													
8. Выборка самого дорогого товара в каждой категории:

select
	p.category,
	p.name_product,
	p.price,
	t.max_price as Макс_цена
from
	products p
join (
	select
		category,
		MAX(price) as max_price
	from
		products
	group by
		category
) t on
	p.category = t.category AND p.price = t.max_price;		
																					
															
9. 			Выборка всех отзывов с указанием имени пользователя и названия товара:													
		

SELECT r.id, u.first_name AS user_name, p.name_product  AS product_name, r.rating
FROM reviews r
JOIN users u ON r.from_id_user = u.id
JOIN orders o ON r.id_order = o.id
JOIN products p ON o.id = p.id_product;																
																				
		
10. Выборка всех поставщиков, у которых есть товары из определенной категории:


select
	s.id,
	s.name,
	s.country,
	c.title as category_name
from
	Suppliers s
join products p on
	s.id_product = p.id_product
join categories cp on
	p.id_product = cp.id
join categories c on
	cp.id = c.id
where
	c.title = 'Название категории';		
	
*/ 