<h3 class="last_h3_text"><?php echo $heading_title; ?></h3>
<div class="container hidden-xs">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout_modul col-sm-6 col-md-3 col-lg-3 col-xs-12" style="padding: 5px;">
    <div class="product-thumb_style">
      <div class="image hidden-xs"><a class="imga_catalog" href="<?php echo $product['href']; ?>" style="background: url('<?php echo $product['thumb']; ?>') center no-repeat; min-height: 300px; background-size: cover"></a>
      </div>
      <div>
        <div class="caption_style col-sm-8 col-md-8 col-lg-8 hidden-xs"
             style="     margin-top: 7px;   padding: 0 0 0 5px;">
          <h4 style="    margin: 0;"><a class="pull-right_KP "
                                        href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          </h4>
                                <span class="ribbon pull-right_KP" style="display: none"><?php echo $text_price; ?>
                                  от <?php echo $product['price']; ?></span>
        </div>
        <div class="button-group col-sm-4 col-md-4 col-lg-4 hidden-xs button-group_KP"
             style="    margin-top: -6px;">
          <button class="korzuna_style" style="display: none" type="button"
                  onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
          </button>
        </div>
      </div>
    </div>

  </div>
  <?php } ?>
</div>

<div class="container hidden-sm hidden-md hidden-lg">
  <div id="myCarousel2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel1" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <div class="row">
          <?php $i = 0;
          foreach ($products as $product) {
          $i++;
          if($i > 2) break; ?>
          <div class="hidden-lg hidden-md hidden-sm col-xs-6 last_img last_img_4">
            <div class="product-thumb transition">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
                <h4><?php echo $product['name']; ?></h4>
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
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="item">
        <div class="row">
          <?php $i = 0;
          foreach ($products as $product) {
          $i++;
          if($i > 2) break; ?>
          <div class="hidden-lg hidden-md hidden-sm col-xs-6 last_img last_img_4">
            <div class="product-thumb transition">
              <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
                <h4><?php echo $product['name']; ?></h4>
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
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
    </div>
    <!-- Left and right controls -->
    <a class=" hidden-lg hidden-md hidden-sm col-xs-6 left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class=" hidden-lg hidden-md hidden-sm col-xs-6 right carousel-control" href="#myCarousel2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
