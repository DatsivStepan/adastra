<?php echo $header; ?>
<div class="container">
    <div class="container_breadcrumb hidden-xs">
        <ul class="breadcrumb_contact hidden-xs  col-sm-12 col-md-12 col-lg-12">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if ($breadcrumb ['href']==('')){ ?>
            <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
            <?php }else{ ?>
            <li class="breadcrumb_text"
            ><a class="text" href="<?php echo $breadcrumb['href']; ?>"
                style="padding-right: 12px; background: url('../../../catalog/view/theme/default/image/strilka.png') right center no-repeat;"><?php echo $breadcrumb['text']; ?></a>
            </li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <div class="container KP">
        <div class="KP_20">
            <?php echo $column_left; ?>
        </div>
        <div class="KP_80"><?php echo $content_top; ?>
            <?php if ($products) { ?>
            <div class="hidden-xs" style="border-top: 3px solid #f0ebe2; border-bottom: 1px solid #f0ebe2; padding-top:5px; padding-bottom:5px; width: 100%; float: left;">
                <div class="hidden-xs hidden-sm hidden-md  hidden-lg">
                    <div class="btn-group">
                        <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip"
                                title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                        <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip"
                                title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                    </div>
                </div>
                <div class="col-sm-8 col-md-5 col-lg-5">
                    <div class="col-sm-5 col-md-5 col-lg-4 text-right" style="text-align: left; padding: 0">
                        <label class="control-label label_text_sort" for="input-sort"><?php echo $text_sort; ?></label>
                    </div>
                    <div class="col-sm-6 col-md-7 col-lg-8 text-right" style="text-align: left; padding: 0;">
                        <select class="input-sort_KP label_text_sort" id="input-sort" onchange="location = this.value;">
                            <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>"
                                    selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                            <?php } ?>

                        </select>
                    </div>
                </div>
                <div class="col-sm-4  col-md-4 col-md-offset-3 col-lg-4 col-lg-offset-3"
                     style="text-align: right; padding: 0;">
                    <div class=" col-sm-7 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-4 col-lg-offset-6 text-right"
                         style="padding: 0;">
                        <label class="control-label label_text_sort"
                               for="input-limit"><?php echo $text_limit; ?></label>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-2 text-right" style="text-align: right; padding: 0;">
                        <select class="input-sort_KP label_text_sort" id="input-limit"
                                onchange="location = this.value;">
                            <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>"
                                    selected="selected"><?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>

            </div>

            <div class="KP">
                <?php foreach ($products as $product) { ?>
                <div class="KP_25">
                    <div class="product-thumb_style">
                        <div class="image hidden-xs"><a class="imga_catalog" href="<?php echo $product['href']; ?>" style="background: url('<?php echo $product['thumb']; ?>') center no-repeat; min-height: 300px; background-size: cover;min-width: 219px;"></a>
                        </div>
                        <div>
                            <div class="caption_style hidden-xs"
                                 style="width: 100% ;    margin-top: 7px;   padding: 0 0 0 5px;">
                                <h4 style="margin: 0 0 0 10px; width: 79%; float: left;"><a class="pull-right_KP "
                                                              href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </h4>
                                    <button class="korzuna_style" style="display: none; width: 10%; float: left" type="button"
                                            onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                                    </button>
                                    <div style="clear: both"></div>
                                        <span class="ribbon pull-right_KP" style="display: none; margin-left: 10px"><?php echo $text_price; ?>
                                            от <?php echo $product['price']; ?></span>
                            </div>

                        </div>
                    </div>

                </div>
                <?php } ?>
            </div>
            <div class="row hidden-sm hidden-md hidden-lg">
                <?php foreach ($products as $product) { ?>
                <div class="img" style="position: relative; margin-bottom: 8%;margin-top: 8%;">
                    <img src="<?php echo $product['thumb']; ?>" style="width:75%;     margin-left: 13%;     min-height: 340px">

                    <div class="conteiner_proz_3 hidden-sm hidden-md hidden-lg" style="margin-bottom: 55px;">
                        <h4 style="    text-align: center; margin-top: 25px;"><a class="pull-right_KP_2"
                                                                                 href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        </h4>
                        <div class="pull-right_KP_2-1"
                             style="border-bottom: 1px solid #fff; width: 100px; margin-left: 40%; margin-top: 4%;">

                        </div>
                        <h5 class="text_style_1" style="text-align: center;  padding-top: 15px;">
                            5 видов фактур на выбор
                        </h5>
                        <h5 class="text_style_2" style="text-align: center">
                            22 стандартных размера
                        </h5>
                        <button class="korzuna_style-2" type="button"
                                onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                        </button>
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="KP_80">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right "><a href="<?php echo $continue; ?>"
                                            class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>



        </div>
        <?php echo $column_right; ?></div>

</div>
<div class="container">
    <?php echo $content_bottom; ?>
</div>

<div class="container conteiner_botton hidden-xs"
     style="width: 100%; height: 243px; background: url('../../../catalog/view/theme/default/image/Pictures_catalog.png') center no-repeat;">
    <div class="container text_na_kartuni">
        <h2 class="h2_KP">Не нашли изображение?</h2>
        <h3 class="h3_KP">Позвоните нам </h3>
        <h1 class="h1_KP"><?php echo $telephone; ?></h1>
    </div>
</div>
<div class="container conteiner_botton hidden-sm hidden-md hidden-lg"
     style="margin-bottom: 7%; width: 100%; height: 500px; background: url('../../../catalog/view/theme/default/image/Mob_-pictures.png') center no-repeat; -webkit-background-size: 100%; ">
    <div class="container text_na_kartuni">
        <h2 class="h2_KP_2">Не нашли изображение?</h2>
        <h3 class="h3_KP_2">Позвоните нам </h3>
        <h1 class="h1_KP_2"><?php echo $telephone; ?></h1>
        <div class="nomer_border">

        </div>
    </div>
</div>
<div class="container text_pid-kartunkov">
    <p class="text-bottom"><?php echo $description; ?></p>
</div>

<?php echo $footer; ?>