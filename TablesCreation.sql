USE supply_chain_db;



CREATE TABLE customers (
    `Customer_Id` INT PRIMARY KEY,
    `Customer_Fname` VARCHAR(100),
    `Customer_Lname` VARCHAR(100),
    `Customer_Email` VARCHAR(100),
    `Customer_Password` VARCHAR(100),
    `Customer_Segment` VARCHAR(50),
    `Customer_City` VARCHAR(100),
    `Customer_State` VARCHAR(50),
    `Customer_Country` VARCHAR(100),
    `Customer_Zipcode` FLOAT,
    `Customer_Street` VARCHAR(100)
);

ALTER TABLE customers
ADD COLUMN `Latitude` FLOAT,
ADD COLUMN `Longitude` FLOAT;



CREATE TABLE orders (
    `Order_Id` INT PRIMARY KEY,
    `Customer_Id` INT,
    `Order_Country` VARCHAR(100),
    `Order_City` VARCHAR(100),
    `Order_Region` VARCHAR(50),
    `Order_State` VARCHAR(50),
    `Order_Zipcode` FLOAT,
    `order_date_DateOrders` DATETIME,
    `Order_Status` VARCHAR(50),
    `Order_Profit_Per_Order` FLOAT,
    FOREIGN KEY (`Customer_Id`) REFERENCES customers(`Customer_Id`)
);

ALTER TABLE orders
ADD COLUMN Late_delivery_risk INT;  -- Adding the Late_delivery_risk column

DESCRIBE orders;  -- Check the structure of the orders table

ALTER TABLE orders
ADD COLUMN Days_for_shipping_real INT,
ADD COLUMN Days_for_shipment_scheduled INT;

SET SQL_SAFE_UPDATES = 0;
UPDATE orders o
JOIN shipping s ON o.Order_Id = s.Order_Id
SET o.Late_delivery_risk = CASE 
    WHEN s.Days_for_shipping_real > s.Days_for_shipment_scheduled THEN 1 
    ELSE 0 
END;

SELECT Order_Id, Late_delivery_risk FROM orders LIMIT 10;



CREATE TABLE order_items (
    `Order_Item_Id` INT PRIMARY KEY,
    `Order_Id` INT,
    `Product_Card_Id` INT,
    `Order_Item_Quantity` INT,
    `Order_Item_Product_Price` FLOAT,
    `Order_Item_Discount` FLOAT,
    `Order_Item_Discount_Rate` FLOAT,
    `Order_Item_Profit_Ratio` FLOAT,
    `Order_Item_Total` FLOAT,
    `Sales` FLOAT,
    FOREIGN KEY (`Order_Id`) REFERENCES orders(`Order_Id`)
);

CREATE TABLE products (
    `Product_Card_Id` INT PRIMARY KEY,
    `Product_Category_Id` INT,
    `Product_Name` VARCHAR(100),
    `Product_Description` TEXT,
    `Product_Image` TEXT,
    `Product_Price` FLOAT,
    `Product_Status` INT
);

CREATE TABLE departments (
    `Department_Id` INT PRIMARY KEY,
    `Department_Name` VARCHAR(100)
);


CREATE TABLE shipping (
    `Shipping_Id` INT AUTO_INCREMENT PRIMARY KEY,
    `Order_Id` INT,
    `Shipping_Mode` VARCHAR(50),
    `shipping_date_DateOrders` DATETIME,
    `Days_for_shipping_real` INT,
    `Days_for_shipment_scheduled` INT,
    FOREIGN KEY (`Order_Id`) REFERENCES orders(`Order_Id`)
);
