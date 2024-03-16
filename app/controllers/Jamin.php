<?php

class Jamin extends BaseController
{
    // de model importeren
    private $JaminModel;
    public function __construct()
    {
        $this->JaminModel = $this->model('JaminModel');
    }

    //onderstaand een functie om het overzicht van het magazijn te tonen
    public function overzichtMagazijn () 
    {
        // een variabele wordt gemaakt die verwijst naar de function in de model getOverzichtMagazijn
        $overzicht = $this->JaminModel->getOverzichtMagazijn();
        // var_dump($overzicht);

        $rows = "";
        foreach ($overzicht as $magazijn) {
        $rows .= "<tr>
                        <td>$magazijn->Barcode</td>
                        <td>$magazijn->Naam</td>
                        <td>$magazijn->VerpakkingsEenheid</td>
                        <td>$magazijn->AantalAanwezig</td>
                        <td>
                            <a href='" . URLROOT . "/Jamin/overzichtallergenen/$magazijn->Id'>
                                <i class='bi bi-ban'></i>
                            </a>
                        </td>   

                        <td>
                            <a href='" . URLROOT . "/Jamin/leverancierinfo/$magazijn->Id'>
                                <i class='bi bi-info-circle'></i>
                            </a>
                        </td>
                      </tr>";
        }

    $data = [
        'title' => 'Overzicht Magazijn Jamin',
        'tableRows' => $rows,
    ];

    $this->view('Jamin/overzichtmagazijn', $data);

    }

    public function LeverancierInfo($productId) {
        //echo $productId; exit();
        $results = $this->JaminModel->getLeverancierInfo($productId);
        // var_dump($results); exit();
        $rows = "";
        foreach ($results as $result) {
            $rows .= "<tr>
                        <td>$result->Naam</td>
                        <td>$result->DatumLevering</td>
                        <td>$result->AantalAanwezig</td>
                        <td>$result->DatumEerstVolgendeLevering</td>
                      </tr>";
        }
        
        $data = [
            'title' => 'Leverings Informatie',
            'tableRows' => $rows,
            'naamLeverancier' => $result->leveNaam,
            'contactpersoon' => $result->ContactPersoon,
            'leveranciernr' => $result->LeverancierNummer,
            'mobiel' => $result->Mobiel,
            'AantalAanwezig' => $result->AantalAanwezig
        ];
        $this->view('Jamin/leverancierinfo', $data);
    }
}