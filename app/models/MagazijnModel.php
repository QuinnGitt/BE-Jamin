<?php

class MagazijnModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getOverzichtMagazijn()
    {
        $sql = "SELECT Barcode
                      ,Naam
                      ,VerpakkingsEenheid
                      ,AantalAanwezig
                FROM  Product
                JOIN  Magazijn
                ON    Product.Id = Magazijn.Id";

        $this->db->query($sql);
        return $this->db->resultSet();
    }

}