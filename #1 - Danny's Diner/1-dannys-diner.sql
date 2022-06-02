-- 1. What is the total amount each customer spent at the restaurant?

SELECT
  	a.customer_id, 
    sum(b.price) as Spent
FROM dannys_diner.sales a
LEFT JOIN dannys_diner.menu b
ON a.product_id = b.product_id
GROUP BY a.customer_id;

-- 2. How many days has each customer visited the restaurant?

SELECT
  	customer_id, 
    count(distinct order_date) as Days
FROM dannys_diner.sales
GROUP BY customer_id; 

