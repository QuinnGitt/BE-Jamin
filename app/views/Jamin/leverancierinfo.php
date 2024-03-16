<?php require_once APPROOT . '/views/includes/header.php'; 

// var_dump($data);?>
<h1><?= $data['title'];?></h1>
<p>Naam Leverancier: <?= $data['naamLeverancier'];?></p>
<p>Contact Persoon Leverancier: <?= $data['contactpersoon'];?></p>
<p>Leverancier Nummer: <?= $data['leveranciernr'];?></p>
<p>Mobiel: <?= $data['mobiel'];?></p>

<?php if ($data['AantalAanwezig'] == 0) : ?>
    <tr>
        <td colspan='4'>
            Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: 30-04-2023
        </td>
    </tr>
<?php else : ?>

<table class="table table-hover">
    <thead>
        <th>Naam</th>
        <th>Datum Levering</th>
        <th>Aantal</th>
        <thead>Datum Eerst Volgende Levering</th>
    </thead>
    <tbody>
        <?= $data['tableRows']; ?>
    </tbody>
</table>
<?php endif; ?>
<br>
    <a href="<?= URLROOT; ?>/jamin/overzichtmagazijn">Overzicht Magazijn Jamin</a> 
<?php require_once APPROOT .'/views/includes/footer.php'; ?>
