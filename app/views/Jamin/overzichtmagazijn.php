<?php require_once APPROOT . '/views/includes/header.php'; ?>
<h3><u><?= $data['title']; ?></u></h3>

<table class="table table-hover">
        <thead>
            <th>Barcode</th>
            <th>Naam</th>
            <th>Verpakkingseenheid</th>
            <th>Aantal aanwezig</th>
            <th>Allergenen Info</th>
            <th>Leverantier Info</th>
        </thead>
        <tbody>
            <?= $data['tableRows']; ?>
        </tbody>
    </table>
   
<?php require_once APPROOT .'/views/includes/footer.php'; ?>