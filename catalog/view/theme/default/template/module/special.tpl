<div class="hidden-xs">
  <h3><?php echo $heading_title; ?></h3>
</div>
<div class="row">
  <div id="masonry_hybrid_demo2"  style="min-height: 600px">
    <div class="grid-sizer"></div>
    <div class="gutter-sizer"></div>
    <?php foreach ($products as $product) { ?>


    <div class="grid-item container_spanprod hidden-xs">
      <img src="<?php echo $product['thumb']; ?>"  style="width:100%;">
      <div class="conteiner_proz_2 spanprod ">
        <div class="conteiner_text_KP">
          <h4 style=" text-align: center;"><a class="pull-right_KP_3"
                                              href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          </h4>
          <div class="pull-right_KP_2-3">

          </div>
          <h5 class="text_style_1_3" style="text-align: center;">
            5 видов фактур на выбор
          </h5>
          <h5 class="text_style_1_3" style="text-align: center">
            22 стандартных размера
          </h5>
          <h5 class="text_style_1_3" style="text-align: center"><?php echo $text_special; ?>
            <span class="text_style_price"><?php echo $product['special']; ?></span></h5>
          <button class="korzuna_style-3" type="button"
                  onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
          </button>
        </div>
      </div>
    </div>
    <div class="grid-item container_spanprod hidden-sm hidden-md hidden-lg">
      <img src="<?php echo $product['thumb']; ?>"  style="width:75%;     margin-left: 13%;">
      <div class="conteiner_proz_3 hidden-sm hidden-md hidden-lg" style="margin-bottom: 55px;">
        <h4 style="    text-align: center; margin-top: 25px;"><a class="pull-right_KP_2"
                                                                 href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        </h4>
        <div class="pull-right_KP_2-1">

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
    <!--<div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb transition">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
          <p><?php echo $product['description']; ?></p>
          <?php if ($product['rating']) { ?>
          <div class="rating">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>
          <?php if ($product['price']) { ?>
          <p class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
            <?php } ?>
            <?php if ($product['tax']) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
            <?php } ?>
          </p>
          <?php } ?>
        </div>
        <div class="button-group">
          <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
        </div>
      </div>
    </div>-->
    <?php } ?>
  </div>
  <script>
    $(document).ready(function() {
      $('.stocks').click(function () {
        var grid_demo_classic = $('#masonry_hybrid_demo2');
        var grid = new MasonryHybrid(grid_demo_classic, {col: 3, space: 30});
        grid.elem.trigger('grid:refresh', {col: 3, space: 30});
        setTimeout(function(){
          grid_demo_classic.show();
        }, 1000)
      });

      $(".grid-item"). hover(function (e) {
                var height = $(this).children('img').height();
                var width = $(this).children('img').width();
                $(this).children('.spanprod').css({width: width, height: height});
                $(this).children('.spanprod').show();

              },
              function(e){
                $(this).children('.spanprod').hide();
              });
      $(".row").outerWidth(true);
      if (outerWidth < 768){
        $('.stocks').click(function () {
          var grid_demo_classic = $('#masonry_hybrid_demo2');
          var grid = new MasonryHybrid(grid_demo_classic, {col: 1, space: 30});
          grid.elem.trigger('grid:refresh', {col: 1, space: 30});
          setTimeout(function(){
            grid_demo_classic.show();
          }, 1000)
        });
      }else{
        $('.stocks').click(function () {
          var grid_demo_classic = $('#masonry_hybrid_demo2');
          var grid = new MasonryHybrid(grid_demo_classic, {col: 3, space: 30});
          grid.elem.trigger('grid:refresh', {col: 3, space: 30});
          setTimeout(function(){
            grid_demo_classic.show();
          }, 1000)
        });
      }
    });

  </script>
</div>
