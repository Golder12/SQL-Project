# SQL-Project
Project scenario: 
There is a client, Ben, who is opening up a new pizzeria. He requires a custom relational for his
business that will allow him to capture and store all of the important information and data that
the business generates.

This project is focusing on developing three main areas:
Customer Orders
Stock control
Staff

## CUSTOMER ORDER
This is the data that will be collected for each different order:
Item name
Item price
Quantity
Customer name
Delivery address

Translating this data so as to create an ORDERS table for our database, some adjustments to be made
to the data above will be :
1.adding an ORDER ID field for a particular customer item
2.Splitting the delivery address into different parts
3.Splitting customer name into first name and last name
3.adding an ITEM SIZE field as some of Ben's menu items come in different sizes

(IMAGE)

4.including a field for the PRODUCT CATEGORY 

(IMAGE)

Below is a smaple of what the final table will look like with some sample data. 

(IMAGE)

One will notice that there is another field called ROW ID. This field came about because of the 
ORDER ID field. A customer can have multiple items in one order and so all those items will have
the same order id. This prevents the ORDER ID field from being used as primary key. The
introduction of the ROW ID field allows it to be used a primary key.

Current fields for the ORDERS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|Row id| int pk||
|Order Id| varchar |10|
|Item Name|varchar|50|
|Item Category| varchar|50|
|Item Size|varchar|20|
|Item Price|decimal|5,2|
|Quantity| int|
|Customer first name| varchar|50|
|Customer last name| varchar|50|
|Delivery| boolean||
|Delivery Address 1| varchar|200|
|Delivery Address 2| varchar|200|
|Delivery city| varchar|50|
|Delivery zip code| varchar|20|

Below we look again at a sample of how our data will look in the ORDERS table:

IMAGE

We can see a repitition of data in the various rows. This leads to redundancy. This can be
corrected by performing Normalization.

Normalizing data is the process of organising data to:
1. reduce redundancy
2. make the database more flexible and efficient.
To normalize, we will create new additional tables for both customers and delivery addresses.

CUSTOMERS table




