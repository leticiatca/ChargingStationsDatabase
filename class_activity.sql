CREATE TABLE BOSTON_HOMES_SALES_CORE (	
	"MLS" VARCHAR2(12), 
	"ADDRESS" VARCHAR2(255), 
	"CITY" VARCHAR2(50), 
	"STATE" VARCHAR2(2), 
	"ZIPCODE" VARCHAR2(10), 
	"PROPERTY_TYPE" VARCHAR2(255), 
	"LATITUDE" NUMBER(10,8), 
	"LONGITUDE" NUMBER(11,8), 
	"PRICE" NUMBER
   );


CREATE TABLE BOSTON_HOMES_SALES_DETAILS (	
	"MLS" VARCHAR2(12), 
	"BEDS" NUMBER, 
	"BATHS" NUMBER(5,2), 
	"LOCATION" VARCHAR2(255), 
	"SQFT" NUMBER, 
	"LOT_SIZE" NUMBER, 
	"YEAR_BUILT" NUMBER, 
	"HOA_MONTH" NUMBER, 
	"URL" VARCHAR2(255)
   );


CREATE TABLE BLUE_BIKE_STATIONS_CORE (	
    "ObjectId" VARCHAR(5),
    "bike_number" VARCHAR2(10),
    "Name" VARCHAR2(255),
    "District" VARCHAR2(50),
    "Public" VARCHAR(5),
    "Total_docks" NUMBER,
    "Latitude" NUMBER(10,8), 
    "Longitude" NUMBER(11,8)
);


CREATE TABLE Mls_Bike_Distance (	
    "MLS" VARCHAR2(12),
    "bike_number" VARCHAR2(10),
    "min_distance" NUMBER(7,5)
);

select * from boston_homes_sales_core;
select address, city, state from boston_homes_sales_core

select mls, price from boston_homes_sales_core where price> 500000

select mls,city from boston_homes_sales_core where city = 'Boston'

select mls,city, price from boston_homes_sales_core where price>800000 and city = 'Boston'

select * from boston_homes_sales_core, boston_homes_sales_details 
where boston_homes_sales_core.mls = boston_homes_sales_details.mls

select * from boston_homes_sales_core join boston_homes_sales_details on 
boston_homes_sales_core.mls = boston_homes_sales_details.mls

Example: size of the property based on number of bedrooms

select beds,
CASE
    WHEN beds < 1 THEN 'small'
    WHEN beds = 1 THEN 'medium'
    WHEN beds > 1 THEN 'large'
    ELSE 'others'
END as property_bed_category
from boston_homes_sales_details
    
CASE
    WHEN condition_1 THEN 'result_1'
    WHEN condition_2 THEN 'result_2'
    WHEN condition_N THEN 'resultN'
    ELSE 'result'