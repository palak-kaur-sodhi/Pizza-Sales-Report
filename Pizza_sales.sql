# PIZZA SALES DATA
select * from pizza_sales;

# TOTAL REVENUE
select round(sum(total_price), 2) as total_revenue from pizza_sales;

# AVERAGE ORDER VALUE 
select round(sum(total_price)/ count(distinct(order_id)), 2) as average_order_value from pizza_sales;

# TOTAL PIZZAS SOLD
select sum(quantity) as total_pizzas_sold from pizza_sales;

# TOTAL ORDERS
select count(distinct(order_id)) as total_orders from pizza_sales;

# AVERAGE PIZZAS PER ORDER
select round(sum(quantity)/ count(distinct(order_id)), 0) as average_pizzas_per_order from pizza_sales;

# HOURLY TREND FOR TOTAL PIZZAS SOLD
select hour(order_time) order_hour, sum(quantity) as total_pizzas from pizza_sales group by hour(order_time) order by order_hour asc;

# WEEKLY TREND FOR TOTAL ORDERS
select week(str_to_date(order_date,'%d-%m-%Y')) order_week, sum(quantity) as total_pizzas from pizza_sales group by order_week;

# PERCENTAGE OF SALE BY PIZZA CATEGORY
select pizza_category, round(sum(total_price) / (select sum(total_price) from pizza_sales) * 100, 2)  as percentage_sale_pizza_category from pizza_sales group by pizza_category;

# PERCENTAGE OF SALE BY PIZZA SIZE
select pizza_size, round(sum(total_price) / (select sum(total_price) from pizza_sales) * 100, 2)  as percentage_sale_pizza_size from pizza_sales group by pizza_size ;

# TOTAL PIZZAS SOLD BY PIZZA CATEGORY
select pizza_category, sum(quantity) as total_pizzas_sold from pizza_sales group by pizza_category;

# TOP 5 SELLERS BY REVENUE
select pizza_name, sum(total_price) as total_price from pizza_sales group by pizza_name order by total_price desc limit 5;

# TOP 5 SELLERS BY QUANTITY
select pizza_name, sum(quantity) as quantity_sold from pizza_sales group by pizza_name order by quantity_sold desc limit 5;

# TOP 5 SELLERS BY ORDERS
select pizza_name, count((order_id)) as total_orders from pizza_sales group by pizza_name order by total_orders desc limit 5;

# BOTTOM 5 SELLERS BY REVENUE
select pizza_name, sum(total_price) as total_price from pizza_sales group by pizza_name order by total_price asc limit 5;

# BOTTOM 5 SELLERS BY QUANTITY
select pizza_name, sum(quantity) as quantity_sold from pizza_sales group by pizza_name order by quantity_sold asc limit 5;

# BOTTOM 5 SELLERS BY ORDERS
select pizza_name, count((order_id)) as total_orders from pizza_sales group by pizza_name order by total_orders asc limit 5;