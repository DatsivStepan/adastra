<div class="row no-margin no-padding" style="margin: 10px 0 10px 0 !important;">
    <h3 class="last_h3_text text_mod_h3"><?php echo $heading_title; ?></h3>
    <div class="container KP hidden-xs">
        <?php foreach ($products as $product) { ?>
        <div class="KP_25_mod">
            <div class="product-thumb_style">
                <div class="image hidden-xs"><a class="imga_catalog_mod" href="<?php echo $product['href']; ?>"
                                                style="background: url('<?php echo $product['thumb']; ?>') center no-repeat; min-height: 300px; background-size: contain; background-repeat: no-repeat; min-width: 219px;"></a>
                </div>
                <div>
                    <div class="caption_style hidden-xs"
                         style="width: 100% ;    margin-top: 7px;   padding: 0 0 0 5px;">
                        <h4 style="margin: 0 0 0 10px; width: 79%; float: left;"><a class="pull-right_KP "
                                                                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        </h4>

                        <div style="clear: both"></div>
                                        <!--<span class="ribbon pull-right_KP"
                                              style="display: none; margin-left: 10px"><?php echo $text_price; ?>
                                            от <?php echo $product['price']; ?></span> -->
                    </div>

                </div>
            </div>

        </div>
        <?php } ?>
    </div>

    <div class="container KP hidden-sm hidden-md hidden-lg">
        <div id="owl-carousel" class="owl-carousel owl-theme" data-ride="carousel">
            <?php foreach ($products as $product) { ?>
            <div class="item">
                <div class="KP_25_mod">
                    <div class="product-thumb_style">
                        <div class="image "><a class="imga_catalog_mod" href="<?php echo $product['href']; ?>"
                                               style="background: url('<?php echo $product['thumb']; ?>') center no-repeat; min-height: 300px; background-size: contain; background-repeat: no-repeat; min-width: 219px; display: block"></a>
                        </div>
                        <div>
                            <div class="caption_style"
                                 style="width: 100% ;    margin-top: 7px;   padding: 0 0 0 5px;">
                                <h4 style="margin: 0 0 0 10px; width: 79%; float: left;"><a class="pull-right_KP "
                                                                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                </h4>

                                <div style="clear: both"></div>
                                        <!--<span class="ribbon pull-right_KP"
                                              style="display: none; margin-left: 10px"><?php echo $text_price; ?>
                                            от <?php echo $product['price']; ?></span>-->
                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

        var owl = $("#owl-carousel");

        owl.owlCarousel({

            itemsCustom: [
                [0, 1],
                [579, 1],
                [580, 2],
                [700, 2],
                [1000, 10],
                [1200, 12],
                [1400, 13],
                [1600, 15]
            ],
            navigation: true,
            autoPlay: true,
            navigationText: ['<img src="/catalog/view/theme/default/image/owlCarusel_strilka_vlivo.png" />', '<img src="/catalog/view/theme/default/image/owlCarusel_strilka_vpravo.png" />'],
            pagination: false

        });

    });
</script>