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
      <?php if ($categories) { ?>
        <div class="" style="margin-top: 35px;">
            <?php foreach ($categories as $category) { ?>
            <div class="col-sm-4" style="min-height: 60px;"><!-- <h2 id="<?php echo $category['name']; ?>" class='symbol_title'><?php echo $category['name']; ?></h2> -->
            <?php if ($category['manufacturer']) { ?>
            <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
                <?php foreach ($manufacturers as $manufacturer) { ?>
                <p><a href="museum&manufacturer_id=<?=$manufacturer['manufacturer_id']; ?>" class="manufacturer_link"><?php echo $manufacturer['name']; ?></a></p>
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
    <?php echo $column_right; ?>
    </div>
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