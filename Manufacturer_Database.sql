CREATE DATABASE Manufacturer;
Use Manufacturer;

CREATE SCHEMA Product;
CREATE SCHEMA Supplier;

CREATE TABLE [Product].[Product](
	[prod_id] [int] PRIMARY KEY NOT NULL,
	[prod_name] [varchar](50) NOT NULL,
	[Quantity] INT NOT NULL,
	);
CREATE TABLE [Product].[Component](
	[comp_id] [int] PRIMARY KEY NOT NULL,
	[comp_name] [varchar](50) NOT NULL,
	[descripton] [varchar](50) NOT NULL,
    [quantity_comp] [int] NOT NULL,
	);
CREATE TABLE [Product].[Prod_Comp](
	[prod_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
    PRIMARY KEY ([prod_id],[comp_id]),
    [quantity_comp] [int] NOT NULL,
	);
CREATE TABLE [Supplier].[Supplier](
	[supp_id] [int] PRIMARY KEY NOT NULL,
	[supp_name] [varchar](50) NOT NULL,
    [supp_country] [varchar](50) NOT NULL,
	[is_active] [bit] NOT NULL,
	);
CREATE TABLE [Supplier].[Comp_Supp](
	[supp_id] [int] NOT NULL,
	[comp_id] [int] NOT NULL,
    PRIMARY KEY ([supp_id],[comp_id]),
    [order_date] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	);
ALTER TABLE Product.Prod_Comp
ADD CONSTRAINT FK_Product FOREIGN KEY (prod_id) REFERENCES Product.Product (prod_id)

ALTER TABLE Product.Prod_Comp
ADD CONSTRAINT FK_Comp FOREIGN KEY (comp_id) REFERENCES Product.Component (comp_id)

ALTER TABLE Supplier.Comp_Supp
ADD CONSTRAINT FK_Supp FOREIGN KEY (supp_id) REFERENCES Supplier.Supplier (supp_id)
ALTER TABLE Supplier.Comp_Supp
ADD CONSTRAINT FK_Comp_id FOREIGN KEY (comp_id) REFERENCES Product.Component (comp_id)