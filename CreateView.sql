USE supply_chain_db;

DROP VIEW IF EXISTS FullSupplyChainData;


CREATE OR REPLACE VIEW FullSupplyChainData AS 
SELECT 
    c.Customer_Id, 
    c.Customer_Fname, 
    c.Customer_Lname, 
    c.Customer_Segment, 
    c.Customer_Country, 
    c.Customer_City, 
    c.Customer_Zipcode, 
    c.Latitude, 
    c.Longitude,
    o.Order_Id, 
    o.order_date_DateOrders AS Order_Date, 
    o.Order_Status, 
    o.Order_Profit_Per_Order, 
    p.Product_Card_Id, 
    p.Product_Name, 
    p.Product_Price, 
    p.Product_Category_Id,
    s.Shipping_Mode, 
    s.shipping_date_DateOrders AS Shipping_Date, 
    s.Days_for_shipping_real, 
    s.Days_for_shipment_scheduled, 
    d.Department_Name AS Product_Department,
    o.Order_Region,
    o.Order_State,
    o.Order_Zipcode,
    o.Late_delivery_risk  -- Ensure this column is included
FROM 
    customers c
JOIN 
    orders o ON c.Customer_Id = o.Customer_Id
JOIN 
    order_items oi ON o.Order_Id = oi.Order_Id
JOIN 
    products p ON oi.Product_Card_Id = p.Product_Card_Id
JOIN 
    shipping s ON o.Order_Id = s.Order_Id
JOIN 
    departments d ON p.Product_Category_Id = d.Department_Id;


