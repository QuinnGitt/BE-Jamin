<?php

class Jamin extends BaseController
{
    private $jaminmodel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('MagazijnModel');
    }
}