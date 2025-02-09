CREATE DATABASE logistics_and_delivery_analysis;
USE logistics_and_delivery_analysis;

# Find Total Orders by Region
CREATE view Total_orders AS (
SELECT region, COUNT(*) as order_count
FROM Orders
GROUP BY region);

select * from Total_orders;


# Calculate the average delivery time per region.
CREATE VIEW AvgDeliveryTime AS (SELECT region, AVG(delivery_time)
FROM orders
GROUP BY region);
select * from AvgDeliveryTime;


# Analyze delivery time trends based on the order date.
SELECT DATE(order_date) AS OrderDate, 
	round(AVG(delivery_time)) AS AvgDeliveryTime
FROM orders
GROUP BY DATE(order_date)
ORDER BY DATE(order_date);


# Find Orders with Delayed Delivery
SELECT *
FROM orders
WHERE delivery_status = 'Delayed';


# Delayed Deliveries by Region
SELECT region, COUNT(*) AS delayed_orders
FROM Orders
WHERE delivery_status = 'Delayed'
GROUP BY region
ORDER BY delayed_orders DESC;


# Identify Regions with Most Canceled Orders
SELECT region, COUNT(*) AS canceled_orders
FROM Orders
WHERE delivery_status = 'Canceled'
GROUP BY region
ORDER BY canceled_orders DESC;


# Find Average Delivery Time by Status
CREATE VIEW Avg_delivery_time AS(
SELECT delivery_status, AVG(delivery_time)
FROM Orders
WHERE delivery_time IS NOT NULL
GROUP BY delivery_status);

select * from Avg_delivery_time;


# Find Top Customers by Order Val
CREATE VIEW Top_customers_spent AS(
SELECT C.name, C.region, round(SUM(O.order_value))
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
GROUP BY C.name, C.region
LIMIT 5);

select * from Top_customers_spent;


# Find Delivery Personnel Performance by Region
CREATE VIEW Total_deliveries AS(
SELECT name, region, total_deliveries
FROM Personnel
ORDER BY total_deliveries DESC);

select * from Total_deliveries;


# Find Orders Delivered on Time
CREATE VIEW on_time_deliveries AS (
SELECT COUNT(*)
FROM Orders
WHERE delivery_status = 'Delivered' AND delivery_time <= 48);

select * from on_time_deliveries;


# Top 5 Longest Deliveries
SELECT *
FROM orders
ORDER BY delivery_time DESC
LIMIT 5;


# Delivery Time Analysis
SELECT 
    CASE 
        WHEN delivery_time <= 24 THEN '0-24 hours'
        WHEN delivery_time <= 48 THEN '25-48 hours'
        WHEN delivery_time <= 72 THEN '49-72 hours'
        ELSE '72+ hours'
    END AS delivery_time_range,
    COUNT(*) AS total_orders
FROM Orders
WHERE delivery_time IS NOT NULL
GROUP BY delivery_time_range;


# Find Order Value Trends by Month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, round(SUM(order_value)) AS monthly_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;


# Customer Retention Rate
SELECT region, 
       COUNT(DISTINCT customer_id) AS unique_customers,
       COUNT(*) AS total_orders,
       ROUND((COUNT(*) / COUNT(DISTINCT customer_id)), 2) AS avg_orders_per_customer
FROM Orders
GROUP BY region;



 # Find Most Frequent Customers
SELECT C.name, COUNT(O.order_id) AS total_orders
FROM Customers C
JOIN orders O ON C.customer_id = O.customer_id
GROUP BY C.name
ORDER BY total_orders DESC
LIMIT 5;


# Find Order Status Breakdown
CREATE VIEW count_delivery AS (
SELECT delivery_status, COUNT(*)
FROM Orders
GROUP BY delivery_status);

select * from count_delivery;


# Revenue by Region
CREATE VIEW total_revenue AS (
SELECT region, round(SUM(order_value))
FROM Orders
GROUP BY region);

select * from total_revenue;


# Revenue Contribution(%) by Each Region
SELECT region, round(SUM(order_value)) AS total_revenue, 
       ROUND(SUM(order_value) * 100.0 / (SELECT SUM(order_value) FROM Orders), 2) AS percentage_contribution
FROM Orders
GROUP BY region;

select * from total_revenue;


# Total Revenue vs. Delivery Time
CREATE VIEW total_revenue_by_DeliveryTime AS (SELECT 
    delivery_time,
    round(SUM(order_value))
FROM Orders
WHERE delivery_time IS NOT NULL
GROUP BY delivery_time
ORDER BY delivery_time);

select * from total_revenue_by_DeliveryTime;



