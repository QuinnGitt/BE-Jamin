-- Step: 01
-- Goal: Create a new database NAME
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            04-04-2023      Quinty de Winter            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS ``;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS ``;

-- Use database 
Use ``;


-- Step: 02
-- Goal: Create a new table XXX
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

-- Drop table XXX
DROP TABLE IF EXISTS XXX;

CREATE TABLE IF NOT EXISTS XXX
(
    Id              TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam        VARCHAR(50)                     NOT NULL
   ,Tussenvoegsel   VARCHAR(10)                     NOT NULL
   ,Achternaam      VARCHAR(50)                     NOT NULL
   ,Mobiel          VARCHAR(12)                     NOT NULL
   ,DatumInDienst   DATE                            NOT NULL
   ,AantalSterren   VARCHAR(6)                      NOT NULL
   ,IsActief        BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen     VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt DateTime(6)                     NOT NULL
   ,DatumGewijzigd  DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Instructeur_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table XXX with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            08-01-2024      Quinty de Winter            New
-- **********************************************************************************/

INSERT INTO XXX
(
     Voornaam
    ,Tussenvoegsel
    ,Achternaam
    ,Mobiel
    ,DatumInDienst
    ,AantalSterren
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Li', '', 'Zhan', '06-28493827', '2015-04-17', '***', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Yoeri', 'van', 'Veen', '06-24383291', '2010-05-12', '***', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bert', 'van', 'Sali', '06-48293823', '2023-01-10', '****', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', '*****', 1, NULL, SYSDATE(6), SYSDATE(6));
