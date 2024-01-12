USE SuperStore
GO



CREATE TABLE dbo.ProductCategory(
	ID SMALLINT IDENTITY(1,1) NOT NULL,
	CONSTRAINT PK_Category PRIMARY KEY CLUSTERED(ID),
	CatgoryName VARCHAR(100) NOT NULL
)


CREATE TABLE dbo.ProductSubCategory(
	ID SMALLINT IDENTITY(1,1) NOT NULL,
	CategoryID  SMALLINT NULL,
	SubCategory VARCHAR(100) NOT NULL,
	CONSTRAINT FK_SubCategory_Category FOREIGN KEY(CategoryID) REFERENCES dbo.ProductCategory(ID),
	CONSTRAINT PK_SubCategory PRIMARY KEY CLUSTERED(ID)
)


CREATE TABLE dbo.Product(
	ID int IDENTITY(1,1) NOT NULL ,
	ProductID VARCHAR(100) NOT NULL,
	ProductSubCategoryID SMALLINT NULL,
	CONSTRAINT PK_Product PRIMARY KEY NONCLUSTERED(ID),
	CONSTRAINT FK_Product_ProductSubCategory FOREIGN KEY(ProductSubCategoryID) REFERENCES dbo.ProductSubCategory(ID),
	ProductName VARCHAR(255) NOT NULL,
	Price SMALLMONEY NULL
)

