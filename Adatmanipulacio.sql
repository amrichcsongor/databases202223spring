	select distinct customer_id, customer_name, customer_since into customers from test3

	select order_id, customer_id, rating into ratings from test3

SELECT DISTINCT order_id, customer_id, rating
INTO #temp_ratings
FROM ratings

TRUNCATE TABLE ratings

INSERT INTO ratings (order_id, customer_id, rating)
SELECT order_id, customer_id, rating
FROM #temp_ratings

DROP TABLE #temp_ratings

ALTER TABLE ratings
ADD review_id INT

SELECT IDENTITY(INT, 1, 1) AS review_id, order_id, customer_id, rating
INTO #temp_ratings
FROM ratings

TRUNCATE TABLE ratings

INSERT INTO ratings (review_id, order_id, customer_id, rating)
SELECT review_id, order_id, customer_id, rating
FROM #temp_ratings

DROP TABLE #temp_ratings

	select distinct order_id, order_status, order_date, payment_method into orders
	from test3

	select distinct product_id, product_name, category into products
	from test3

	select order_item_id, order_id, product_id, quantity into orderitems
	from test3


select * from customers
select * from ratings
select * from orders
select * from products
select * from orderitems


alter table customers add constraint customerid PRIMARY key(customer_id)
Alter table ratings ALTER COLUMN review_id int NOT NULL
alter table ratings add constraint reviewid PRIMARY key(review_id)
alter table orders add constraint orderid PRIMARY key(order_id)
alter table products add constraint productid PRIMARY key(product_id)
alter table orderitems add constraint orderitemid PRIMARY key(order_item_id)

ALTER TABLE customers ADD CONSTRAINT datumcheck CHECK (customer_since<=getdate())
ALTER TABLE orders ADD CONSTRAINT orderstatusdefault DEFAULT 'pending' FOR order_status
ALTER TABLE orderitems ALTER COLUMN quantity int NOT NULL
alter table products add constraint uniqueID UNIQUE(product_id)

alter table orderitems add constraint fk_orderid FOREIGN KEY (order_id) REFERENCES orders (order_id)
alter table orderitems add constraint fk_productid FOREIGN KEY (product_id) REFERENCES products (product_id)
alter table ratings add constraint fk_orderid2 FOREIGN KEY (order_id) REFERENCES orders (order_id)
alter table ratings add constraint fk_customerid FOREIGN KEY (customer_id) REFERENCES customers (customer_id)


