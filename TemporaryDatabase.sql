CREATE DATABASE supply_chain_db;
USE supply_chain_db;

CREATE TEMPORARY TABLE temp_supply_chain_data (
    `Type` VARCHAR(50),
    `Days_for_shipping_real` INT,
    `Days_for_shipment_scheduled` INT,
    `Benefit_per_order` FLOAT,
    `Sales_per_customer` FLOAT,
    `Delivery_Status` VARCHAR(50),
    `Late_delivery_risk` INT,
    `Category_Id` INT,
    `Category_Name` VARCHAR(100),
    `Customer_City` VARCHAR(100),
    `Customer_Country` VARCHAR(100),
    `Customer_Email` VARCHAR(100),
    `Customer_Fname` VARCHAR(100),
    `Customer_Id` INT,
    `Customer_Lname` VARCHAR(100),
    `Customer_Password` VARCHAR(100),
    `Customer_Segment` VARCHAR(50),
    `Customer_State` VARCHAR(50),
    `Customer_Street` VARCHAR(100),
    `Customer_Zipcode` FLOAT,
    `Department_Id` INT,
    `Department_Name` VARCHAR(100),
    `Latitude` FLOAT,
    `Longitude` FLOAT,
    `Market` VARCHAR(50),
    `Order_City` VARCHAR(100),
    `Order_Country` VARCHAR(100),
    `Order_Customer_Id` INT,
    `order_date_DateOrders` DATETIME,
    `Order_Id` INT,
    `Order_Item_Cardprod_Id` INT,
    `Order_Item_Discount` FLOAT,
    `Order_Item_Discount_Rate` FLOAT,
    `Order_Item_Id` INT,
    `Order_Item_Product_Price` FLOAT,
    `Order_Item_Profit_Ratio` FLOAT,
    `Order_Item_Quantity` INT,
    `Sales` FLOAT,
    `Order_Item_Total` FLOAT,
    `Order_Profit_Per_Order` FLOAT,
    `Order_Region` VARCHAR(50),
    `Order_State` VARCHAR(50),
    `Order_Status` VARCHAR(50),
    `Order_Zipcode` FLOAT,
    `Product_Card_Id` INT,
    `Product_Category_Id` INT,
    `Product_Description` TEXT,
    `Product_Image` TEXT,
    `Product_Name` VARCHAR(100),
    `Product_Price` FLOAT,
    `Product_Status` INT,
    `shipping_date_DateOrders` DATETIME,
    `Shipping_Mode` VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_supply_chain_data.csv'
INTO TABLE temp_supply_chain_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


SELECT * FROM temp_supply_chain_data LIMIT 10;




