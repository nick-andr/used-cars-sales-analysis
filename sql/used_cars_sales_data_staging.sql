-- LOADING DATA

-- create empty table
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	ID INT,
    pricesold INT,
    yearsold INT,
    zipcode VARCHAR(100),
    Mileage INT,
    Make VARCHAR(100),
    Model VARCHAR(100),
    Year INT,
    Trim VARCHAR(100),
    Engine VARCHAR(100),
    BodyType VARCHAR(100),
    NumCylinders INT,
    DriveType VARCHAR(100)
    );
    
 -- load data from csv file
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/used_car_sales.csv'
INTO TABLE sales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- create a copy to work with data. use only columns that are important
DROP TABLE IF EXISTS sales_copy;
CREATE TABLE sales_copy  AS
SELECT ID, pricesold, yearsold, zipcode, Mileage, Make, Model, Year FROM sales;

-- verify they match
SELECT 
	(SELECT COUNT(*) FROM sales) as sales_rows,
    (SELECT COUNT(*) FROM sales_copy) as sales_copy_rows;
