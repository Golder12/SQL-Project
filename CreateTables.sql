CREATE TABLE [Orders] (
    [RowId] int  NOT NULL ,
    [OrderId] varchar(10)  NOT NULL ,
    [ItemId] varchar(10)  NOT NULL ,
    [createdAt] datetime  NOT NULL ,
    [Quantity] int  NOT NULL ,
    [CustomerId] int  NOT NULL ,
    [Delivery] bit  NOT NULL ,
    [AddressId] int  NOT NULL ,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED (
        [RowId] ASC
    )
)

CREATE TABLE [Customer] (
    [CustomerId] int  NOT NULL ,
    [CustomerFirstName] varchar(50)  NOT NULL ,
    [CustomerLastName] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED (
        [CustomerId] ASC
    )
)

CREATE TABLE [Address] (
    [AddressId] int  NOT NULL ,
    [DeliveryAddress1] varchar(200)  NOT NULL ,
    [DeliveryAddress2] varchar(200)  NOT NULL ,
    [DeliveryCity] varchar(50)  NOT NULL ,
    [DeliveryZipCode] varchar(20)  NOT NULL ,
    CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED (
        [AddressId] ASC
    )
)

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE [Item] (
    [ItemId] varchar(10)  NOT NULL ,
    [sku] varchar(20)  NOT NULL ,
    [ItemName] varchar(100)  NOT NULL ,
    [Item_Category] varchar(100)  NOT NULL ,
    [Item_Size] varchar(10)  NOT NULL ,
    [Item_Price] decimal(10,3)  NOT NULL ,
    CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED (
        [ItemId] ASC
    )
)

CREATE TABLE [Ingredient] (
    [ingredientId] varchar(10)  NOT NULL ,
    [ingredientName] varchar(200)  NOT NULL ,
    [ingredientWeight] int  NOT NULL ,
    [ingredientMeas] varchar(20)  NOT NULL ,
    [ingredientPrice] decimal(5,2)  NOT NULL ,
    CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED (
        [ingredientId] ASC
    )
)

CREATE TABLE [Recipe] (
    [RowId] int  NOT NULL ,
    [RecipeId] varchar(20)  NOT NULL ,
    [IngredientId] varchar(10)  NOT NULL ,
    [Quantity] int  NOT NULL ,
    CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED (
        [RowId] ASC
    )
)

CREATE TABLE [Inventory] (
    [inventory_id] int  NOT NULL ,
    [item_Id] varchar(10)  NOT NULL ,
    [quantity] int  NOT NULL ,
    CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED (
        [inventory_id] ASC
    )
)

CREATE TABLE [Staff] (
    [staff_id] varchar(5)  NOT NULL ,
    [firstName] varchar(50)  NOT NULL ,
    [lastName] varchar(50)  NOT NULL ,
    [position] varchar(100)  NOT NULL ,
    [hourlyRate] decimal(5,2)  NOT NULL ,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED (
        [staff_id] ASC
    )
)

CREATE TABLE [Shift] (
    [shiftId] varchar(20)  NOT NULL ,
    [dayOfTheWeek] varchar(10)  NOT NULL ,
    [startTime] time  NOT NULL ,
    [endTime] time  NOT NULL ,
    CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED (
        [shiftId] ASC
    )
)

CREATE TABLE [Rota] (
    [rowId] int  NOT NULL ,
    [rotaId] varchar(20)  NOT NULL ,
    [date] datetime  NOT NULL ,
    [shiftId] varchar(20)  NOT NULL ,
    [staffId] varchar(5)  NOT NULL ,
    CONSTRAINT [PK_Rota] PRIMARY KEY CLUSTERED (
        [rowId] ASC
    )
)

ALTER TABLE Orders
	ADD CONSTRAINT fk_Customer_id
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)

ALTER TABLE Orders
	ADD CONSTRAINT fk_Item_id
	FOREIGN KEY (ItemId) REFERENCES Item(ItemId)

ALTER TABLE Orders
	ADD CONSTRAINT fk_Address_id
	FOREIGN KEY (AddressId) REFERENCES Address(AddressID)

--ALTER TABLE Orders
--	ADD CONSTRAINT fk_createdAt
--	FOREIGN KEY (createdAt) REFERENCES Rota(rowId)

ALTER TABLE Rota
	ADD CONSTRAINT fk_shift_id
	FOREIGN KEY (shiftId) REFERENCES Shift(shiftId)

ALTER TABLE Rota
	ADD CONSTRAINT fk_staff_id
	FOREIGN KEY (staffid) REFERENCES Staff(staff_id)

ALTER TABLE Recipe
	ADD CONSTRAINT fk_ingredient_id
	FOREIGN KEY (IngredientId) REFERENCES Ingredient(IngredientId)

--ALTER TABLE Item
--	ADD CONSTRAINT fk_sku
--	FOREIGN KEY (sku) REFERENCES Recipe(IngredientId)

ALTER TABLE Recipe
	ADD CONSTRAINT fk_Customer_id
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
