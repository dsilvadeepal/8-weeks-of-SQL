-- 1. What is the total amount each customer spent at the restaurant?

SELECT
  	a.customer_id, 
    sum(b.price)
FROM dannys_diner.sales a
LEFT JOIN dannys_diner.menu b
ON a.product_id = b.product_id
GROUP BY a.customer_id;