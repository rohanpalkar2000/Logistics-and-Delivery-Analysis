# Logistics and Delivery Analysis  

## Project Overview  
**Logistics and Delivery Analysis** is a data-driven project aimed at analyzing order trends, delivery performance, and revenue insights across different regions. This project uses SQL queries to extract meaningful insights from logistics data, including delivery time trends, order status, and customer behavior.  

## Features  
- Total Orders by Region  
- Average Delivery Time per Region  
- Delivery Time Trends Based on Order Date  
- Orders with Delayed Delivery  
- Delayed Deliveries by Region  
- Regions with Most Canceled Orders  
- Average Delivery Time by Status  
- Top Customers by Order Value  
- Delivery Personnel Performance by Region  
- Orders Delivered on Time  
- Longest Deliveries  
- Order Value Trends by Month  
- Customer Retention Rate  
- Most Frequent Customers  
- Order Status Breakdown  
- Revenue by Region  
- Revenue Contribution (%) by Each Region  
- Total Revenue vs. Delivery Time  

## Dataset  
The dataset used in this project includes orders, customers, and delivery personnel details. You can find the dataset and SQL queries in the project repository:  
🔗 [GitHub Repository](https://github.com/rohanpalkar2000/Logistics-and-Delivery-Analysis)  

## Database Setup  
Run the following command to create the database:  
```sql
CREATE DATABASE logistics_and_delivery_analysis;  
USE logistics_and_delivery_analysis;  
```

## Queries  
### 1️⃣ Find Total Orders by Region  
```sql
CREATE VIEW Total_orders AS (  
    SELECT region, COUNT(*) as order_count  
    FROM Orders  
    GROUP BY region  
);  
SELECT * FROM Total_orders;  
```

### 2️⃣ Calculate the Average Delivery Time per Region  
```sql
CREATE VIEW AvgDeliveryTime AS (  
    SELECT region, AVG(delivery_time)  
    FROM orders  
    GROUP BY region  
);  
SELECT * FROM AvgDeliveryTime;  
```

### 3️⃣ Identify Regions with Most Canceled Orders  
```sql
SELECT region, COUNT(*) AS canceled_orders  
FROM Orders  
WHERE delivery_status = 'Canceled'  
GROUP BY region  
ORDER BY canceled_orders DESC;  
```

### 4️⃣ Find Revenue by Region  
```sql
CREATE VIEW total_revenue AS (  
    SELECT region, ROUND(SUM(order_value))  
    FROM Orders  
    GROUP BY region  
);  
SELECT * FROM total_revenue;  
```

## How to Use  
1. Clone the repository:  
   ```sh
   git clone https://github.com/rohanpalkar2000/Logistics-and-Delivery-Analysis.git
   ```
2. Import the dataset into your SQL database.  
3. Execute the queries in your SQL environment.  
4. Analyze the results and visualize insights.  

## Author  
**Rohan Palkar**  
📧 rohanpalkar2000@gmail.com  

## Conclusion
This project helps in understanding logistics performance through structured data analysis. By leveraging SQL queries, key insights on orders, deliveries, and revenue distribution can be extracted, helping optimize business operations.
