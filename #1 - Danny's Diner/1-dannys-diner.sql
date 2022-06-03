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

-- 3. What was the first item from the menu purchased by each customer?

with sale_order as (
  SELECT a.customer_id, a.order_date, a.product_id, b.product_name,
  DENSE_RANK() OVER (
    PARTITION BY a.customer_id
    	ORDER BY a.order_date) ranked
    FROM dannys_diner.sales a
    LEFT JOIN dannys_diner.menu b
    ON a.product_id = b.product_id
  )
 SELECT distinct customer_id, product_name
 FROM sale_order
 WHERE ranked = 1;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT
  	a.product_name, count(b.order_date) as count_bought
    FROM dannys_diner.sales b
 	LEFT JOIN dannys_diner.menu a
    ON a.product_id = b.product_id
    GROUP BY a.product_name
    ORDER BY count_bought DESC
    LIMIT 1;

-- 5. Which item was the most popular for each customer?


--6. Which item was purchased first by the customer after they became a member?


-- 7. Which item was purchased just before the customer became a member?


--8. What is the total items and amount spent for each member before they became a member?


--9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?


-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?