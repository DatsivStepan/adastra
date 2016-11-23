<?php foreach ($categories as $category) { ?>
<div class="panel-heading">
	<h4 class="panel-title panel_h4_text"><?php echo $category['name']; ?></h4>
</div>
<div class="row mar_left_cont">
  <?php foreach ($category['products'] as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-3 col-xs-6 mar_left_cont" >
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><?php echo $product['name']; ?></h4>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<?php } ?>
