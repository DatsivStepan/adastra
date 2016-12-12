<?php echo $header; ?>
<div class="container">
  <div class=" container_breadcrumb hidden-xs">
    <ul class="breadcrumb_contact_style hidden-xs  col-sm-12 col-md-12 col-lg-12 no-padding">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if ($breadcrumb ['href']==('')){ ?>
      <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
      <?php }else{ ?>
      <li class="breadcrumb_text"
      ><a class="text_np_20" href="<?php echo $breadcrumb['href']; ?>" style="padding-right: 12px; background: url('../../../catalog/view/theme/default/image/strilka.png') right center no-repeat;"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <div class="row">
        <div class="map-category-title-style">
          <span >Материалы и цены</span>
        </div>
        <?php foreach($product_array as $category){ ?>
          <h1><?= $category['category_name']; ?></h1>
          <div class="map-category-style">
            <span><?= $category['category_description']; ?></span>
          </div>
            <?php if($category['category_name']){ ?>
              <?php foreach($category['category_product'] as $product){ ?>
                <?php foreach($product as $product_c){ ?>
                  <div class="row" style="margin-top: 4%">
                    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs bac_img_np_20" style="background-image: url('image/<?php echo $product_c['image']; ?>')"></div>
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="padding: 0;">
                      <div class="col-lg-12 col-md-12 hidden-sm hidden-xs " style="padding: 0;margin-bottom: 3%;">
                        <span class="col-lg-12 col-md-12 hidden-sm hidden-xs text_faktury_gold" style="padding-bottom: 2%;padding-left: 0;"><?php echo $product_c['title']; ?></span>
                      </div>
                      <div style="padding-bottom: 3%;">
                        <span class="adas_text_o_nac" ><?php echo (html_entity_decode ($product_c['description'], ENT_QUOTES, 'UTF-8')); ?></span>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
                        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                          <p class="text_factura_bold">Толщина полотна</p>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                          <span class="text_factura_bold"><?php echo $product_c['fabric_thickness']; ?></span><br><br>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
                        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                          <p class="text_factura_bold">Возможно изготовление  изделия без стыков</p>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                          <span class="text_factura_bold"><?php echo $product_c['MPWJ']; ?></span><br><br>
                        </div>
                      </div>
                      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
                        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                          <p class="text_factura_bold">Цена</p>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                          <span class="text_factura_bold"><?php echo $product_c['prices']; ?></span>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              <?php } ?>
            <?php } ?>
        <?php } ?>
      <?php // echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<?php exit; ?>