<?php echo $header; ?>
<?php
            $tmp_string = "";
    ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['manufacturer']) { ?>
            <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <?php if($_GET['category'] == 'ru'){ ?>
            <?php if($manufacturer['category_name'] == 'Русские художники'){
                                global $tmp_string;
                                $tmp_string = "<h1 class='list_title'>".$manufacturer['category_name']."</h1>";
            } ?>
            <?php } ?>
            <?php if($_GET['category'] == 'world'){ ?>
            <?php if($manufacturer['category_name'] == 'Зарубежные художники'){
                                global $tmp_string;
                                $tmp_string = "<h1 class='list_title'>".$manufacturer['category_name']."</h1>";
            } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <div style="text-align: center; width: 100%; font-family: 'AristonNormal'; "><?php echo $tmp_string;?></div>
      <?php if ($categories) { ?>
      <div style="text-align: center" class="symbol_title">
        <?php foreach ($categories as $category) { ?>
            <a href="index.php?route=product/manufacturerart/&category=<?= $_GET['category'] ?>#<?php echo $category['name']; ?>" class="symbol_title_small"><?php echo $category['name']; ?></a>
        <?php } ?>
      </div>

        <div class="manufacturer_list">
            <?php foreach ($categories as $category) { ?>
            <div class="col-sm-4"><h2 id="<?php echo $category['name']; ?>" class='symbol_title'><?php echo $category['name']; ?></h2>
            <?php if ($category['manufacturer']) { ?>
            <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
                <?php foreach ($manufacturers as $manufacturer) { ?>
                <?php if($_GET['category'] == 'ru'){ ?>
                <?php if($manufacturer['category_name'] == 'Русские художники'){ ?>
                <p><a href="index.php?route=product/manufacturerart/show&manufacturer_id=<?= $manufacturer['manufacturer_art_id'] ?>&category=<?= $_GET['category'] ?>" class="manufacturer_link"><?php echo $manufacturer['name']; ?></a></p>
                <?php } ?>
                <?php } ?>
                <?php if($_GET['category'] == 'world'){ ?>
                <?php if($manufacturer['category_name'] == 'Зарубежные художники'){ ?>
                <p><a href="index.php?route=product/manufacturerart/show&manufacturer_id=<?= $manufacturer['manufacturer_art_id'] ?>&category=<?= $_GET['category'] ?>" class="manufacturer_link"><?php echo $manufacturer['name']; ?></a></p>
                <?php } ?>
                <?php } ?>
                <?php } ?>
            <?php } ?>
            <?php } ?>
            </div>
            <?php } ?>
        </div>



      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<style>
    .list_title{
        font-family: 'BikhamCyrScript';
        font-size: 80px !important;
        margin: 35px 0px;
    }
    .symbol_title{
        font-family: 'Times New Roman';
        font-weight: bold;
        font-size: 28px;
    }
    .manufacturer_link{
        font-family: 'Times New Roman';
        font-size: 21px;
        color: #0b0b0b;
        font-style: italic;
    }
    .manufacturer_link:hover,
    .manufacturer_link:focus{
        color: #0b0b0b;
        text-decoration: underline;
    }
    .symbol_title_small{
        font-family: 'Times New Roman';
        font-weight: bold;
        font-size: 22px;
        color: #0b0b0b;
        margin: 0px 2px;
    }
    .symbol_title_small:hover,
    .symbol_title_small:focus{
        text-decoration: underline;
        color: #0b0b0b;
    }
    .manufacturer_list{
        white-space: nowrap;
    }
</style>