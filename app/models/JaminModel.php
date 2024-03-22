<?php

class JaminModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getOverzichtMagazijn()
    {
        $sql = "SELECT PRO.Id 
                      ,Barcode
                      ,Naam
                      ,VerpakkingsEenheid
                      ,AantalAanwezig
                      
                FROM  Product as PRO
                JOIN  Magazijn as MAG
                ON    PRO.Id = MAG.ProductId
                
                GROUP BY PRO.Id
                ORDER BY Barcode ASC";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

    public function getLeverancierInfo($productId)
    {
        $sql = "SELECT  PPLE.DatumLevering
                        ,PPLE.Aantal
                        ,PPLE.DatumEerstVolgendeLevering 
                        ,PROD.Naam
                        ,MAG.AantalAanwezig
                        ,PPLE.Id as ppleId
                        ,PROD.Id as prodId
                        ,LEVE.Naam as leveNaam
                        ,LEVE.ContactPersoon
                        ,LEVE.LeverancierNummer
                        ,LEVE.Mobiel 
                        ,LEVE.Id as leveId
                        ,PROD.Naam
                         
                    
                 FROM ProductPerLeverancier as PPLE
                 JOIN Product as PROD
                 ON PPLE.ProductId = PROD.Id
                 JOIN Leverancier as LEVE
                 ON PPLE.LeverancierId = LEVE.Id
                 JOIN Magazijn as MAG
                 ON PROD.Id = MAG.ProductId
                 WHERE PPLE.ProductId = :productId";


        $this->db->query($sql);
        $this->db->bind(':productId', $productId);
        return $this->db->resultSet();
    }

    public function getOverzichtAllergie($productId)
    {

        $sql = "SELECT alg.Naam as allerNaam
                ,alg.Omschrijving
                ,pro.Barcode
                ,pro.Naam
                FROM Allergeen alg
                INNER JOIN ProductPerAllergeen proper
                ON alg.Id = proper.AllergeenId
                INNER JOIN product pro
                ON proper.productId = pro.Id
                WHERE pro.Id = $productId";
        // $sql = "SELECT  PROD.Naam as prodNaam
        //         ,PROD.Barcode
        //         -- ,ALLE.Naam as allerNaam
        //         -- ,ALLE.Omschrijving
        //         -- ,ALLE.Id as allerId
        //         ,PROD.Id as prodId
        //         FROM ProductPerAllergeen as PA
        //         JOIN Product as PROD
        //         ON PA.ProductId = PROD.Id
        //         JOIN Allergeen as ALLE
        //         ON Pa.AllergeenId = ALLE.Id
        //         -- WHERE PROD.Id = :productId OR ALLE.Id = :allergieId";

        $this->db->query($sql);
        // $this->db->bind(':allergieId', $allergieId);
        // $this->db->bind(':productId', $productId);
        return $this->db->resultSet();
    }

    public function getInfoProductById($productId)
    {
        $sql = "SELECT PRO.Id
                      ,Naam as prodNaam
                      ,Barcode
                    FROM Product AS PRO
                    WHERE PRO.Id = :productId
                    ORDER BY Barcode asc";

        $this->db->query($sql);
        $this->db->bind(':productId', $productId);
        return $this->db->resultSet();        
    }
    // public function productPerAllergeen($allergieId)
    // {
    //     $sql = "SELECT PPA.ProductId
    //                    ,PPA.AllergeenId
    //                    ,ALLE.Id
    //                    ,ALLE.Naam as allerNaam
    //                    ,ALLE.Omschrijving as allerOmschrijving
    //             FROM Allergeen as ALLE
    //             INNER JOIN ProductPerAllergeen as PPA
    //             ON  ALLE.Id = PPA.AllergeenId
    //             WHERE PPA.ProductId = $allergieId
    //             ";

    //     $this->db->query($sql);
    //     return $this->db->resultSet();
    // }
}