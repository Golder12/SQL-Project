# SQL-Project
Project scenario: 
There is a client, Ben, who is opening up a new pizzeria. He requires a custom relational for his
business that will allow him to capture and store all of the important information and data that
the business generates.

This project is focusing on developing three main areas:
Customer Orders
Stock control
Staff

## FIRST AREA: CUSTOMER ORDER
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
|Row id| int PK||
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

Key:
PK - Primary key
FK - Foreign key

Below we look again at a sample of how our data will look in the ORDERS table:

IMAGE

We can see a repitition of data in the various rows. This leads to redundancy. This can be
corrected by performing Normalization.

Normalizing data is the process of organising data to:
1. reduce redundancy
2. make the database more flexible and efficient.
To normalize, we will create new additional tables for both customers and delivery addresses.

CUSTOMERS table
Creatin the CUSTOMERS table is the first action we shall take in our normalization process. The table shall
contain the CUSTOMER FIRST NAME and CUSTOMER FIRST NAME fields. Then it shall have the CUSTOMER ID field which will be the unique identifier. 
The CUSTOMER FIRST NAME and CUSTOMER FIRST NAME fields in the ORDERS table shall be replaced by the CUSTOMER ID field . CUSTOMER ID will act as a foreign key in the ORDERS table.

Below we can see the new CUSTOMERS table and updated ORDERS table.

Current fields for the CUSTOMERS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|customer id| int PK||
|Customer first name| varchar|50|
|Customer last name| varchar|50|

Current fields for the ORDERS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|Row id| int PK||
|Order Id| varchar |10|
|Item Name|varchar|50|
|Item Category| varchar|50|
|Item Size|varchar|20|
|Item Price|decimal|5,2|
|Quantity| int|
|customer id| int FK||
|Delivery| boolean||
|Delivery Address 1| varchar|200|
|Delivery Address 2| varchar|200|
|Delivery city| varchar|50|
|Delivery zip code| varchar|20|

Key:
PK - Primary key
FK - Foreign key

ADDRESS table
The ADDRESS table shall undergo the same process as was done for the CUSTOMERS table

Below are the new ADDRESS table and the updated ORDERS table

Current fields for the ADDRESS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|address id| int PK||
|Delivery Address 1| varchar|200|
|Delivery Address 2| varchar NULL|200|
|Delivery city| varchar|50|
|Delivery zip code| varchar|20|

Current fields for the ORDERS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|Row id| int PK||
|Order Id| varchar |10|
|Item Name|varchar|50|
|Item Category| varchar|50|
|Item Size|varchar|20|
|Item Price|decimal|5,2|
|Quantity| int|
|customer id| int FK||
|Delivery| boolean||
|address id| int PK||

Key:
PK - Primary key
FK - Foreign key

A NULL constraint has been added to the Delivery Address 2 as not everyone will
always have a second address.

We're also going to create an ITEM table. It will reduce on the number of fields in 
ORDERS table as well as repetitions. It will also allow for easier editing of product 
names in future.

Current fields for the ITEM table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|item id| int PK||
|sku| varchar|20|
|item name| varchar|100|
|item_cat| varchar|100|
|item_size| varchar|10|
|item_price| decimal|10,3|

Current fields for the ORDERS table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|Row id| int PK||
|Order Id| varchar |10|
|item id| int FK||
|Quantity| int|
|customer id| int FK||
|Delivery| boolean||
|address id| int FK||

Key:
PK - Primary key
FK - Foreign key

At this point we have four tables: ORDERS, CUSTOMERS, ADDRESS and ITEM.

## SECOND AREA: STOCK CONTROL
Requirements:
Ben wants to be able to know when it's time to order new stock.
We need more information abput :
- what ingredients go into each pizza
- their quantity based on the size of the pizza
- the existing stock level

Assumption: lead time for delivery by suppliers is the same for all ingredients

Tables to be created: INGREDIENT, RECIPE, INVENTORY

INGREDIENT
Fields for the INGREDIENT table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|ingredient id| varchar PK|10|
|ingredient name| varchar|200|
|ingredient weight| int||
|ingredient meas| varchar |20|
|ingredient price| decimal|5,2|

RECIPE
Fields for the RECIPE table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|row id| int PK||
|recipe id| varchar|20|
|ingredient id| varchar FK|10|
|quantity| int||

INVENTORY
Fields for the INVENTORY table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|inv id| int PK||
|item id| varchar FK|10|
|quantity| int||
 
## THIRD AREA: STAFF
Ben would like to know which staff members are working when. Then based on their salary information, how much each pizza costs(ingredients + chef + delivery)

STAFF
Fields for the STAFF table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|staff id| varchar PK|20|
|first name| varchar|50|
|last name| varchar|50|
|position| varchar|100|
|hourly_rate | decimal|5,2|

SHIFT
Fields for the SHIFT table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|shift id| varchar PK|20|
|day of the week| varchar|10|
|start time| time||
|end time| time||

ROTA
Fields for the ROTA table :
|Field name| Field type |Field Length|
|----------|------------|------------|
|row id| int PK||
|rota id| varchar|20|
|date| datetime||
|shift id| varchar FK|20|
|staff id| varchar FK|20|
