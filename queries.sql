CREATE DATABASE mobile_sales_db;
USE mobile_sales_db;
SELECT DATABASE();
CREATE TABLE mobile_sales (
    product VARCHAR(100),
    brand VARCHAR(30),
    product_code VARCHAR(30),
    price INT,
    quantity_sold INT,
    inward_date DATE,
    dispatch_date DATE,
    region VARCHAR(30),
    processor VARCHAR(50),
    ram VARCHAR(10),
    rom VARCHAR(10),
    customer_location VARCHAR(50)
);
DESCRIBE mobile_sales;
ALTER TABLE mobile_sales
ADD customer_name VARCHAR(50);
ALTER TABLE mobile_sales
MODIFY processor VARCHAR(255);

SELECT COUNT(*) AS total_rows
FROM mobile_sales;
SELECT *
FROM mobile_sales
LIMIT 10;
SELECT
    MIN(inward_date),
    MAX(inward_date),
    MIN(dispatch_date),
    MAX(dispatch_date)
FROM mobile_sales;

SELECT
    SUM(price * quantity_sold) AS total_revenue
FROM mobile_sales;

SELECT
    price,
    quantity_sold,
    price * quantity_sold AS row_revenue
FROM mobile_sales
LIMIT 5;

SELECT
    brand,
    SUM(price * quantity_sold) AS brand_revenue
FROM mobile_sales
GROUP BY brand
ORDER BY brand_revenue DESC
limit 5;

SELECT
    region,
    SUM(quantity_sold) AS total_units_sold
FROM mobile_sales
GROUP BY region
ORDER BY total_units_sold DESC;
SELECT
    region,
    SUM(price * quantity_sold) AS revenue
FROM mobile_sales
GROUP BY region
ORDER BY revenue DESC;
SELECT
    ram,
    SUM(quantity_sold) AS total_units_sold
FROM mobile_sales
GROUP BY ram
ORDER BY total_units_sold DESC;
SELECT
    ram,
    SUM(price * quantity_sold) AS total_revenue
FROM mobile_sales
GROUP BY ram
ORDER BY total_revenue DESC;
SELECT
    ram,
    AVG(price) AS avg_price
FROM mobile_sales
GROUP BY ram
ORDER BY avg_price DESC;
SELECT
    brand,
    AVG(price) AS avg_price
FROM mobile_sales
GROUP BY brand
ORDER BY avg_price DESC;
SELECT
    AVG(DATEDIFF(dispatch_date, inward_date)) AS avg_delivery_days
FROM mobile_sales;

-- analysed delivery performance using date differences and 
identified regions and orders with higher delivery delays

SELECT
    region,
    AVG(DATEDIFF(dispatch_date, inward_date)) AS avg_delivery_days
FROM mobile_sales
GROUP BY region
ORDER BY avg_delivery_days;

SELECT
    product,
    brand,
    region,
    DATEDIFF(dispatch_date, inward_date) AS delivery_days
FROM mobile_sales
WHERE DATEDIFF(dispatch_date, inward_date) > 7
ORDER BY delivery_days DESC;



SELECT
    brand,
    SUM(price * quantity_sold) AS revenue
FROM mobile_sales
GROUP BY brand
ORDER BY revenue DESC;









