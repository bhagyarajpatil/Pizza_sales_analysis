select * from pizza;
select * from p_details;
select * from orders;
select * from order_details;
---Retrieve the total number of orders placed.
select count(order_id) as total_no_of_orders from orders;

---Calculate the total revenue generated from pizza sales.
select sum(p.price*od.quantity) as total_sale from 
pizza p join order_details od on p.pizza_id = od.pizza_id 


---Identify the highest-priced pizza.
select pd.name,max(p.price) as highest_priced from 
pizza p inner join p_details pd on p.pizza_id = pd.pizza_id
group by pd.name order by highest_priced desc limit 2;

---Identify the most common pizza size ordered.
select p.size,count(order_id) as total_counts from pizza p inner join order_details od on p.pizza_id = od.pizza_id
group by p.size order by total_counts desc;

---List the top 5 most ordered pizza types along with their quantities.
select pd.name, sum(od.quantity) as quantity from 
pizza p inner join order_details od on p.pizza_id = od.pizza_id  
inner join p_details pd  on p.pizza_id = pd.pizza_id
group by od.quantity,pd.name order by quantity desc limit 5;

---Join the necessary tables to find the total quantity of each pizza category catogery.
select category,sum(quantity) as total_quantity from p_details pd join order_details od on pd.pizza_id = od.pizza_id group by pd.category;

---Determine the distribution of orders by hour of the day.
select extract(hour from time) as hours,count(order_id)as total_orders from orders group by hours order by total_orders desc;

---Join relevant tables to find the category-wise distribution of pizzas.
select category,count(pizza_id) from p_details group by category order by count desc;













