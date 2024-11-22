USE supply_chain_db;

-- Query to count the number of orders by their status
SELECT Order_Status, COUNT(*) AS total_orders
FROM orders
GROUP BY Order_Status;


-- Query to calculate the average profit per order by region
SELECT Order_Region, AVG(Order_Profit_Per_Order) AS avg_profit
FROM orders
GROUP BY Order_Region;


-- Query to count customers by their segment (e.g., Consumer, Corporate)
SELECT Customer_Segment, COUNT(*) AS total_customers
FROM customers
GROUP BY Customer_Segment;


-- Query to count the number of products in each department
SELECT d.Department_Name, COUNT(p.Product_Card_Id) AS total_products
FROM products p
JOIN departments d ON p.Product_Category_Id = d.Department_Id
GROUP BY d.Department_Name;


-- Query to count the number of shipments by shipping mode
SELECT Shipping_Mode, COUNT(*) AS total_shipments
FROM shipping
GROUP BY Shipping_Mode;

-- Advanced Queries

-- Query to calculate the average delivery delay (real days - scheduled days) by region
SELECT o.Order_Region, AVG(s.Days_for_shipping_real - s.Days_for_shipment_scheduled) AS avg_delay_days
FROM orders o
JOIN shipping s ON o.Order_Id = s.Order_Id
GROUP BY o.Order_Region;


-- Query to find the top 10 customers by total sales
SELECT c.Customer_Id, c.Customer_Fname, c.Customer_Lname, SUM(oi.Sales) AS total_sales
FROM customers c
JOIN orders o ON c.Customer_Id = o.Customer_Id
JOIN order_items oi ON o.Order_Id = oi.Order_Id
GROUP BY c.Customer_Id
ORDER BY total_sales DESC
LIMIT 10;


-- Query to calculate average delay days and count of risk orders by country
SELECT 
    c.Customer_Country, 
    AVG(s.Days_for_shipping_real - s.Days_for_shipment_scheduled) AS avg_delay_days,  -- Average delay in days
    COUNT(CASE WHEN o.Order_Status = 'LATE' THEN 1 END) AS total_risk_orders,          -- Count of orders with 'LATE' status
    COUNT(o.Order_Id) AS total_orders                                                  -- Total number of orders in that country
FROM customers c
JOIN orders o ON c.Customer_Id = o.Customer_Id
JOIN shipping s ON o.Order_Id = s.Order_Id
GROUP BY c.Customer_Country;


-- Query to calculate total profit by shipping mode
SELECT s.Shipping_Mode, SUM(o.Order_Profit_Per_Order) AS total_profit
FROM shipping s
JOIN orders o ON s.Order_Id = o.Order_Id
GROUP BY s.Shipping_Mode;


-- Query to find the most popular products by total revenue
SELECT p.Product_Name, SUM(oi.Order_Item_Total) AS total_revenue
FROM products p
JOIN order_items oi ON p.Product_Card_Id = oi.Product_Card_Id
GROUP BY p.Product_Name
ORDER BY total_revenue DESC
LIMIT 10;

-- Query to calculate average delay days and count of risk orders by country based on real shipping delays
SELECT 
    c.Customer_Country, 
    AVG(s.Days_for_shipping_real - s.Days_for_shipment_scheduled) AS avg_delay_days,  -- Average delay in days
    COUNT(o.Order_Id) AS total_orders,                                                 -- Total number of orders
    SUM(CASE WHEN s.Days_for_shipping_real > s.Days_for_shipment_scheduled THEN 1 ELSE 0 END) AS total_risk_orders,  -- Count of orders with delays
    c.Latitude, 
    c.Longitude
FROM customers c
JOIN orders o ON c.Customer_Id = o.Customer_Id
JOIN shipping s ON o.Order_Id = s.Order_Id
GROUP BY c.Customer_Country, c.Latitude, c.Longitude
LIMIT 50000;





