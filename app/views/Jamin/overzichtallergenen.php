<?php require_once APPROOT . '/views/includes/header.php'; 
//  var_dump($data);?>

<h1><?= $data['title'];?></h1>

<?php foreach ($data['infoProduct'] as $allergeen) : ?>
    
    <?= $allergeen->prodNaam; ?> <br>
    <?= $allergeen->Barcode; ?>
    <?php endforeach ?>

    <br>
<?php if (empty(($data['overzichtAllergeen']))) :?>    
    <tr>
        <td colspan='4'>
        In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken
        </td>
    </tr>
    
        <?php else : ?>
    <table class="table table-hover">
        <thead>
            <th>Naam</th>
            <th>Omschrijving</th>
        </thead>
        <tbody>
            <?php foreach ($data['overzichtAllergeen'] as $allergeen) : ?>
                <tr>
                    <td><?= $allergeen->allerNaam; ?></td>
                    <td><?= $allergeen->Omschrijving; ?></td>

                <?php endforeach ?>

        </tbody>
    </table>
    <?php endif; ?>


<br>
    <a href="<?= URLROOT; ?>/jamin/overzichtmagazijn">Overzicht Magazijn Jamin</a> 
<?php require_once APPROOT .'/views/includes/footer.php'; ?>

