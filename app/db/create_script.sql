-- Step: 01
-- Goal: Create a new database jamin-backend-opdr-5
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Quinty de Winter            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `jamin-backend-opdr-5`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `jamin-backend-opdr-5`;

-- Use database 
Use `jamin-backend-opdr-5`;


-- Step: 02
-- Goal: Create a new table Magazijn
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table Magazijn
DROP TABLE IF EXISTS Magazijn;

CREATE TABLE IF NOT EXISTS Magazijn
(
    Id                  INT         UNSIGNED            NOT NULL    AUTO_INCREMENT
   ,ProductId           INT                             NOT NULL
   ,VerpakkingsEenheid  DECIMAL(3,2)                    NOT NULL
   ,AantalAanwezig      INT                                 NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Magazijn_Id          PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_Magazijn_ProductId_Product_Id   FOREIGN KEY (ProductId) REFERENCES Product(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Magazijn with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO Magazijn
(                
    ProductId         
    ,VerpakkingsEenheid
    ,AantalAanwezig    
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     (1,  5,   453,  NULL, SYSDATE(6), SYSDATE(6))
    ,(2,  2.5, 400,  NULL, SYSDATE(6), SYSDATE(6))
    ,(3,  5,   1,    NULL, SYSDATE(6), SYSDATE(6))
    ,(4,  1,   800,  NULL, SYSDATE(6), SYSDATE(6))
    ,(5,  3,   234,  NULL, SYSDATE(6), SYSDATE(6))
    ,(6,  2,   345,  NULL, SYSDATE(6), SYSDATE(6))
    ,(7,  1,   795,  NULL, SYSDATE(6), SYSDATE(6))
    ,(8,  10,  233,  NULL, SYSDATE(6), SYSDATE(6))
    ,(9,  2.5, 123,  NULL, SYSDATE(6), SYSDATE(6))
    ,(10, 3,   NULL, NULL, SYSDATE(6), SYSDATE(6))
    ,(11, 2,   367,  NULL, SYSDATE(6), SYSDATE(6))
    ,(12, 1,   467,  NULL, SYSDATE(6), SYSDATE(6))
    ,(13, 5,   20,   NULL, SYSDATE(6), SYSDATE(6));

-- Step: 04
-- Goal: Create a new table Product
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table Product
DROP TABLE IF EXISTS Product;

CREATE TABLE IF NOT EXISTS Product
(
    Id                  INT         UNSIGNED            NOT NULL    AUTO_INCREMENT
   ,Naam                VARCHAR(50)                     NOT NULL
   ,Barcode             INT                             NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Product_Id          PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 05
-- Goal: Fill table Product with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO Product
(                
    Naam         
    ,Barcode
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     ("Mintnopjes",     8719587231278, NULL, SYSDATE(6), SYSDATE(6))
    ,("Schoolkrijt",    8719587326713, NULL, SYSDATE(6), SYSDATE(6))
    ,("Honingdrop",     8719587327836, NULL, SYSDATE(6), SYSDATE(6))
    ,("Zure Beren",     8719587321441, NULL, SYSDATE(6), SYSDATE(6))
    ,("Cola Flesjes",   8719587321237, NULL, SYSDATE(6), SYSDATE(6))
    ,("Turtles",        8719587322245, NULL, SYSDATE(6), SYSDATE(6))
    ,("Witte Muizen",   8719587328256, NULL, SYSDATE(6), SYSDATE(6))
    ,("Reuzen Slangen", 8719587325641, NULL, SYSDATE(6), SYSDATE(6))
    ,("Zoute Rijen",    8719587322739, NULL, SYSDATE(6), SYSDATE(6))
    ,("Winegums",       8719587327527, NULL, SYSDATE(6), SYSDATE(6))
    ,("Drop Munten",    8719587322345, NULL, SYSDATE(6), SYSDATE(6))
    ,("Kruis Drop",     8719587322265, NULL, SYSDATE(6), SYSDATE(6))
    ,("Zoute Ruitjes",  8719587323256, NULL, SYSDATE(6), SYSDATE(6));

    -- Step: 06
-- Goal: Create a new table ProductPerAllergeen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table ProductPerAllergeen
DROP TABLE IF EXISTS ProductPerAllergeen;

CREATE TABLE IF NOT EXISTS ProductPerAllergeen
(
    Id                  INT         UNSIGNED            NOT NULL    AUTO_INCREMENT
   ,ProductId           INT                             NOT NULL
   ,AllergeenId         INT                             NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_ProductPerAllergeen_Id          PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_ProductPerAllergeen_ProductId_Product_Id   FOREIGN KEY (ProductId) REFERENCES Product(Id)
   ,CONSTRAINT      FK_ProductPerAllergeen_AllergeenId_Allergeen_Id   FOREIGN KEY (AllergeenId) REFERENCES Allergeen(Id)

) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table ProductPerAllergeen with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO ProductPerAllergeen
(                
    ProductId       
    ,AllergeenId
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     (1,  2, NULL, SYSDATE(6), SYSDATE(6))
    ,(1,  1, NULL, SYSDATE(6), SYSDATE(6))
    ,(1,  3, NULL, SYSDATE(6), SYSDATE(6))
    ,(3,  4, NULL, SYSDATE(6), SYSDATE(6))
    ,(6,  5, NULL, SYSDATE(6), SYSDATE(6))
    ,(9,  2, NULL, SYSDATE(6), SYSDATE(6))
    ,(9,  5, NULL, SYSDATE(6), SYSDATE(6))
    ,(10, 2, NULL, SYSDATE(6), SYSDATE(6))
    ,(12, 4, NULL, SYSDATE(6), SYSDATE(6))
    ,(13, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,(13, 4, NULL, SYSDATE(6), SYSDATE(6))
    ,(13, 5, NULL, SYSDATE(6), SYSDATE(6));

    -- Step: 08
-- Goal: Create a new table Allergeen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table Allergeen
DROP TABLE IF EXISTS Allergeen;

CREATE TABLE IF NOT EXISTS Allergeen
(
    Id                  INT             UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Naam                VARCHAR(50)                     NOT NULL
   ,Omschrijving        VARCHAR(100)                    NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Allergeen_Id          PRIMARY KEY CLUSTERED(Id)

) ENGINE=InnoDB;


-- Step: 09
-- Goal: Fill table Allergeen with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO Allergeen
(                
    Naam        
    ,Omschrijving
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     ("Gluten",             "Dit product bevat Gluten",             NULL, SYSDATE(6), SYSDATE(6))
    ,("Gelatine",           "Dit product bevat Gelatine",           NULL, SYSDATE(6), SYSDATE(6))
    ,("AZO-kleurstoffen",   "Dit product bevat AZO-kleurstoffen",   NULL, SYSDATE(6), SYSDATE(6))
    ,("Lactose",            "Dit product bevat Lactose",            NULL, SYSDATE(6), SYSDATE(6))
    ,("Soja",               "Dit product bevat Soja",               NULL, SYSDATE(6), SYSDATE(6));

    -- Step: 10
-- Goal: Create a new table ProductPerLeverancier
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table ProductPerLeverancier
DROP TABLE IF EXISTS ProductPerLeverancier;

CREATE TABLE IF NOT EXISTS ProductPerLeverancier
(
    Id                          INT             UNSIGNED    NOT NULL    AUTO_INCREMENT
   ,LeverancierId               INT                         NOT NULL
   ,ProductId                   INT                         NOT NULL
   ,DatumLevering               DATETIME                    NOT NULL
   ,Aantal                      INT                         NOT NULL 
   ,DatumEersteVolgendeLevering DATETIME                    NOT NULL
   ,Omschrijving                VARCHAR(100)                NOT NULL
   ,IsActief                    BIT                         NOT NULL    DEFAULT 1
   ,Opmerkingen                 VARCHAR(250)                    NULL    DEFAULT NULL
   ,DatumAangemaakt             DateTime(6)                 NOT NULL
   ,DatumGewijzigd              DateTime(6)                 NOT NULL

   ,CONSTRAINT      PK_ProductPerLeverancier_Id          PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_ProductPerLeverancier_LeverancierId_Leverancier_Id   FOREIGN KEY (LeverancierId) REFERENCES Leverancier(Id)
   ,CONSTRAINT      FK_ProductPerLeverancier_ProductId_Product_Id   FOREIGN KEY (ProductId) REFERENCES Product(Id)


) ENGINE=InnoDB;


-- Step: 11
-- Goal: Fill table ProductPerLeverancier with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO ProductPerLeverancier
(                
    LeverancierId
    ,ProductId
    ,DatumLevering
    ,Aantal
    ,DatumEersteVolgendeLevering        
    ,Omschrijving
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     (1, 1,  '2023-04-09', 23, '2023-04-09', NULL, SYSDATE(6), SYSDATE(6))
    ,(1, 1,  '2023-04-18', 21, '2023-04-25', NULL, SYSDATE(6), SYSDATE(6))
    ,(1, 2,  '2023-04-09', 12, '2023-04-16', NULL, SYSDATE(6), SYSDATE(6))
    ,(1, 3,  '2023-04-10', 11, '2023-04-17', NULL, SYSDATE(6), SYSDATE(6))
    ,(2, 4,  '2023-04-14', 16, '2023-04-21', NULL, SYSDATE(6), SYSDATE(6))
    ,(2, 4,  '2023-04-21', 23, '2023-04-28', NULL, SYSDATE(6), SYSDATE(6))
    ,(2, 5,  '2023-04-14', 45, '2023-04-21', NULL, SYSDATE(6), SYSDATE(6))
    ,(2, 6,  '2023-04-14', 30, '2023-04-21', NULL, SYSDATE(6), SYSDATE(6))
    ,(3, 7,  '2023-04-12', 12, '2023-04-19', NULL, SYSDATE(6), SYSDATE(6))
    ,(3, 7,  '2023-04-19', 23, '2023-04-26', NULL, SYSDATE(6), SYSDATE(6))
    ,(3, 8,  '2023-04-10', 12, '2023-04-17', NULL, SYSDATE(6), SYSDATE(6))
    ,(3, 9,  '2023-04-11', 1,  '2023-04-18', NULL, SYSDATE(6), SYSDATE(6))
    ,(4, 10, '2023-04-16', 24, '2023-04-30', NULL, SYSDATE(6), SYSDATE(6))
    ,(5, 11, '2023-04-10', 47, '2023-04-17', NULL, SYSDATE(6), SYSDATE(6))
    ,(5, 11, '2023-04-10', 60, '2023-04-26', NULL, SYSDATE(6), SYSDATE(6))
    ,(5, 12, '2023-04-11', 45, NULL,         NULL, SYSDATE(6), SYSDATE(6))
    ,(5, 13, '2023-04-12', 23, NULL,         NULL, SYSDATE(6), SYSDATE(6));

    -- Step: 12
-- Goal: Create a new table Leverancier
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table Leverancier
DROP TABLE IF EXISTS Leverancier;

CREATE TABLE IF NOT EXISTS Leverancier
(
    Id                          INT             UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Naam                        VARCHAR(50)                     NOT NULL
   ,ContactPersoon              VARCHAR(30)                     NOT NULL
   ,LeverancierNummer           VARCHAR(30)                     NOT NULL 
   ,Mobiel                      VARCHAR(15)                     NOT NULL
   ,Omschrijving                VARCHAR(100)                    NOT NULL
   ,IsActief                    BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen                 VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt             DateTime(6)                     NOT NULL
   ,DatumGewijzigd              DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Leverancier_Id          PRIMARY KEY CLUSTERED(Id)

) ENGINE=InnoDB;


-- Step: 13
-- Goal: Fill table Leverancier with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO Leverancier
(                
    Naam             
    ,ContactPersoon   
    ,LeverancierNummer
    ,Mobiel           
    ,IsActief          
    ,Opmerkingen       
    ,DatumAangemaakt   
    ,DatumGewijzigd    
)
VALUES
     ('Venco',        "Bert van Linge",     'L1029384719', "06-28493827", NULL, SYSDATE(6), SYSDATE(6))
    ,('Astra Sweets', "Jasper del Monte",   'L1029284315', "06-39398734", NULL, SYSDATE(6), SYSDATE(6))
    ,('Haribo',       "Sven Stalman",       'L1029324748', "06-24383291", NULL, SYSDATE(6), SYSDATE(6))
    ,('Basset',       "Joyce Stelterberg",  'L1023845773', "06-48293823", NULL, SYSDATE(6), SYSDATE(6))
    ,('De Bron',      "Remco Veenstra",     'L1023857736', "06-34291234", NULL, SYSDATE(6), SYSDATE(6));