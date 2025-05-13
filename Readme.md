## Introduction
Little Lemon Restaurant needs to transition from managing orders and booking information in Excel to a structured MySQL database. As their data continues to grow, it has become increasingly difficult to manage and extract insights using their current setup. To address these challenges, we will design and implement a well-structured database that optimizes both data storage and retrieval for future needs. We also build for them some stored procedures to facilitate their booking system.

## Software Requirements
For proper design and implementation of the project, we need following tools: MySQL, MySQL Workbench, Python, Jupiter Notebook, and Tableau for visualization.

## Scope of Work

Before building the database for Little Lemon, it's important to define the scope of work. The details are outlined below:
- Design a proper data model to show entities and their relationship (ERD) in MySQL Workbench
- Perform forward engineer to transform data model into data schema
- Perform data engineering task from excel file then insert clean data into MyQL tables
- Implement stored procedures to support the booking system
- Analyzing data using MySQL queries (Join, Common Table Expression, Sub Queries, Window Functions)
- Use Tableau to analyze and visualize sales & profit and create a dashboard

## 1. Build Entity Relation Diagram and Data Model
Before constructing MySQL database, we need to have a proper Entity Relation Diagram which present entities of the database and their relationship. After examining the existing data, we come out about five entities (tables) which are appropriate for Little Lemon, details about each entity and its features as below:
- Customers: CustomerID (Primary Key), Name, City, Country.
- Orders: OrderID (Primary Key), OrderDate, Cost, Sales, Discount, Quantity, CustomerID (Foreign Key), MenuItemID (Foreign Key).
- Deliveries: Deliveries_id (Primary Key), DeliveryDate, DeliveryDtatus, OrderID (Foreign Key).
- Menu_Items: Menu_Item_ID (Primary Key), CourseName, StarterName, DessertName, Drink, Sides.
- Bookings: BookingID (Primary Key), CustomerID (Foreign Key), BookingDate, TableNo
  
<p align = "center"> <image src = "Data Model/LittleLemon_PNG.png" alt = "Data Model" width = "700" height = "500"> </p>

## 2. Build database schema 
Once we have ER Diagram, we can set up database schema for LittleLemon. We use Forward Engineering function of MySQL WorkBench to convert data model into data schema. The final result is showed below:
<p align = "center"> <image src = "Data Model/LittleLemon_Schema.png" alt = "Data Model" width = "600" height = "450"> </p>

## 3. Inserting data into tables
In order to inserting into tables from Excel file, we need a Jupiter notebook to facilitate this process. It is first to read Excel file into a DataFrame then perform some engineering tasks such as removing duplicate rows, formating columns into suitable data types and removing unnecessary characters...We need to connect Jupiter notebook to the database as well and extract relevant data for each table. This process is found in the notebook "ETL Process.ipynb".

## 4. Stored procedures for booking system
There are five stored procedures need to implement:
- CheckBooking: Check if a table is available for a certain data.
- AddBooking: Insert a new booking into booking table then confirm whether a booking is added.
- AddValidBooking: this also insert a new booking into the table but we utilize **transaction** functionality to **rollback** if something go wrong unexpectedly.
- UpdateBooking: this update existing booking.
- CancelBooking: cancel a booking when customer request.

<strong>Following are the detailed code for each procedure</strong>:
<p align ="center"> <strong>CheckBooking Procedure </strong> </p>
<p align = "center"> <image src = "Stored Procedures for Bookings/CheckBooking.png" alt = "CheckBooking" width = "500" height = "250"> </p>
                     
<p align ="center"> <strong>AddBooking Procedure </strong> </p>
<p align = "center"> <image src = "Stored Procedures for Bookings/AddBooking.png" alt = "AddBooking" width = "500" height = "150"> </p>
                     
<p align ="center"> <strong>AddValidBooking Procedure </strong> </p>
<p align = "center"> <image src = "Stored Procedures for Bookings/AddValidBooking.png" alt = "AddValidBooking" width = "550" height = "350"> </p>    

<p align ="center"> <strong>UpdateBooking Procedure </strong> </p>
<p align = "center"> <image src = "Stored Procedures for Bookings/UpdateBooking.png" alt = "UpdateBooking" width = "500" height = "200"> </p>  

<p align ="center"> <strong>CancelBooking Procedure </strong> </p>
<p align = "center"> <image src = "Stored Procedures for Bookings/CancelBooking.png" alt = "CancelBooking" width = "500" height = "150"> </p>  

## 5. Data Analytics with MySQL queries
- Write a query to find the country with highest total sales:
<p align = "center"> <image src = "Data Analysis with MySQL/Highest_Sales_Country.png" alt = "UpdateBooking" width = "500" height = "300"> </p> 

- Write a query to find the city with highest total sales in each country:
<p align = "center"> <image src = "Data Analysis with MySQL/Highest_Sales_City_Country.png" alt = "UpdateBooking" width = "500" height = "350"> </p> 
                           
  
  
  
