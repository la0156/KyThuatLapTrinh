/****** Create Script for Lesson 36  ******/
USE AdventureWorks2012
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson36ProductCategorySource' AND TABLE_SCHEMA = 'Production') 
	DROP TABLE [Production].[Lesson36ProductCategorySource];
GO
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_NAME = 'Lesson36ProductCategoryDestination' AND TABLE_SCHEMA = 'Production') 
DROP TABLE [Production].[Lesson36ProductCategoryDestination];
GO
CREATE TABLE [Production].[Lesson36ProductCategorySource](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [Production].[Lesson36ProductCategoryDestination](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Deleted Flag] Char(1) NOT NULL DEFAULT 'F'
) ON [PRIMARY]
GO

INSERT INTO [Production].[Lesson36ProductCategorySource]
SELECT ProductCategoryID, Name ,ModifiedDate
  FROM [Production].[ProductCategory]
GO
INSERT INTO [Production].[Lesson36ProductCategoryDestination]
SELECT ProductCategoryID, Name ,ModifiedDate, 'F'
  FROM [Production].[ProductCategory]
GO

SELECT * FROM [Production].[Lesson36ProductCategorySource]
SELECT * FROM [Production].[Lesson36ProductCategoryDestination]
GO