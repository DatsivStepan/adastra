<?php foreach ($categories as $category) { ?>
<div class="panel-heading">
	<h4 class="panel-title panel_h4_text"><?php echo $category['name']; ?></h4>
</div>
<div class="row mar_left_cont KP_80" style="float: right">
  <?php foreach ($category['products'] as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-3 hidden-xs mar_left_cont" >
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><?php echo $product['name']; ?></h4>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<div class="hidden-sm container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <?php $i = 0;
                     foreach ($category['products'] as $product) {
                $i++;
                if($i >2) break; ?>
                    <div class="product-layout hidden-lg hidden-md hidden-sm col-xs-6 mar_left_cont" >
                        <div class="product-thumb transition">
                            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                            <div class="caption">
                                <h4><?php echo $product['name']; ?></h4>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
            </div>
            <div class="item">
                <?php $i = 0;
                     foreach ($category['products'] as $product) {
                $i++;
                if($i >2) break; ?>
                <div class="product-layout hidden-lg hidden-md hidden-sm col-xs-6 mar_left_cont" >
                    <div class="product-thumb transition">
                        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                        <div class="caption">
                            <h4><?php echo $product['name']; ?></h4>
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<?php } ?>
