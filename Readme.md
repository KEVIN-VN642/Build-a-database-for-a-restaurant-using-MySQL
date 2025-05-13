## Introduction
Little Lemon Restaurant needs to transition from managing orders and booking information in Excel to a structured MySQL database. As their data continues to grow, it has become increasingly difficult to manage and extract insights using their current setup. To address these challenges, we will design and implement a well-structured database that optimizes both data storage and retrieval for future needs.

## Software Requirements
For proper design and implementation of the project, we need following tools: MySQL, MySQL Workbench, Python, Jupiter Notebook, and Tableau for visualization.

## Scope of Work

Before constructing a database for Little Lemon, we need Below are the details about scope of work:
- Design a proper data model to show entities and their relationship (ERD) in MySQL Workbench
- Perform forward engineer to transform data model into data schema
- Perform data engineering task from excel file then insert clean data into MyQL tables
- Analyzing data using MySQL queries
- Implement stored procedures to support the booking system
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
<p align = "center"> <image src = "Data Model/LittleLemon_Schema.png" alt = "Data Model" width = "700" height = "500"> </p>

