USE supply_chain_db;

INSERT INTO customers (Customer_Id, Customer_Fname, Customer_Lname, Customer_Email, Customer_Password, 
                       Customer_Segment, Customer_City, Customer_State, Customer_Country, Customer_Zipcode, Customer_Street)
SELECT DISTINCT Customer_Id, Customer_Fname, Customer_Lname, Customer_Email, Customer_Password, 
                Customer_Segment, Customer_City, Customer_State, Customer_Country, Customer_Zipcode, Customer_Street
FROM temp_supply_chain_data;


INSERT INTO orders (Order_Id, Customer_Id, Order_Country, Order_City, Order_Region, 
                    Order_State, Order_Zipcode, order_date_DateOrders, Order_Status, Order_Profit_Per_Order)
SELECT DISTINCT Order_Id, Order_Customer_Id, Order_Country, Order_City, Order_Region, 
                Order_State, Order_Zipcode, order_date_DateOrders, Order_Status, Order_Profit_Per_Order
FROM temp_supply_chain_data AS temp
ON DUPLICATE KEY UPDATE 
    Customer_Id = temp.Customer_Id,
    Order_Country = temp.Order_Country,
    Order_City = temp.Order_City,
    Order_Region = temp.Order_Region,
    Order_State = temp.Order_State,
    Order_Zipcode = temp.Order_Zipcode,
    order_date_DateOrders = temp.order_date_DateOrders,
    Order_Status = temp.Order_Status,
    Order_Profit_Per_Order = temp.Order_Profit_Per_Order; 
    
    

INSERT INTO order_items (Order_Item_Id, Order_Id, Product_Card_Id, Order_Item_Quantity, 
                        Order_Item_Product_Price, Order_Item_Discount, Order_Item_Discount_Rate, 
                        Order_Item_Profit_Ratio, Order_Item_Total, Sales)
SELECT DISTINCT Order_Item_Id, Order_Id, Order_Item_Cardprod_Id, Order_Item_Quantity, 
                Order_Item_Product_Price, Order_Item_Discount, Order_Item_Discount_Rate, 
                Order_Item_Profit_Ratio, Order_Item_Total, Sales
FROM temp_supply_chain_data;


INSERT INTO products (Product_Card_Id, Product_Category_Id, Product_Name, 
                      Product_Description, Product_Image, Product_Price, Product_Status)
SELECT DISTINCT Product_Card_Id, Product_Category_Id, Product_Name, 
                Product_Description, Product_Image, Product_Price, Product_Status
FROM temp_supply_chain_data;


INSERT INTO departments (Department_Id, Department_Name)
SELECT DISTINCT Department_Id, Department_Name
FROM temp_supply_chain_data;


INSERT INTO shipping (Order_Id, Shipping_Mode, shipping_date_DateOrders, 
                      Days_for_shipping_real, Days_for_shipment_scheduled)
SELECT DISTINCT Order_Id, Shipping_Mode, shipping_date_DateOrders, 
                Days_for_shipping_real, Days_for_shipment_scheduled
FROM temp_supply_chain_data;

UPDATE customers c
JOIN temp_supply_chain_data t ON c.Customer_Id = t.Customer_Id
SET 
    c.Latitude = t.Latitude,
    c.Longitude = t.Longitude;


-- -----------------------------------------
-- check table


SELECT Order_Id, order_date_DateOrders, Order_Status, Order_Profit_Per_Order 
FROM orders
LIMIT 10;

SELECT Order_Id, shipping_date_DateOrders, Shipping_Mode, Days_for_shipping_real, Days_for_shipment_scheduled
FROM shipping
LIMIT 10;

SELECT Order_Item_Id, Order_Id, Product_Card_Id, Order_Item_Quantity, Order_Item_Product_Price, Order_Item_Total 
FROM order_items
LIMIT 10;

SELECT Product_Card_Id, Product_Name, Product_Price, Product_Status 
FROM products
LIMIT 10;

SELECT Department_Id, Department_Name 
FROM departments
LIMIT 10;


-- Delete Temporary Table
DROP TEMPORARY TABLE IF EXISTS temp_supply_chain_data;




