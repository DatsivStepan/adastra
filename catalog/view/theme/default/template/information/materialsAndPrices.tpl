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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php $category_tmp = ''; ?>
      <?php foreach ($data['materialsAndPrice'] as $data_1){ ?>
     <?php if($data_1['category'] != $category_tmp){ ?>
      <div class="container">
        <?php echo $data_1['category'] ?>
      </div>
      <?php $category_tmp = $data_1['category'];?>
      <?php } ?>
      <div class="row" style="margin-top: 4%">
        <div class="col-lg-3 col-md-3 hidden-sm hidden-xs bac_img_np_20" style="background-image: url('image/<?php echo $data_1['image']; ?>')"></div>
        <div class="hidden-lg hidden-md col-sm-12 col-xs-12 bac_img_np_20_2" style="background-image: url('image/<?php echo $data_1['image']; ?>')"></div>
          <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="padding: 0;">
            <div class="col-lg-12 col-md-12 hidden-sm hidden-xs" style="padding: 0;margin-bottom: 3%;">
              <span class="col-lg-12 col-md-12 hidden-sm hidden-xs text_faktury_gold" style="padding-bottom: 2%;padding-left: 0;"><?php echo $data_1['title']; ?></span>
            </div>
            <div class="hidden-lg hidden-md col-sm-12 col-xs-12">
              <span class="hidden-lg hidden-md col-sm-12 col-xs-12 text_faktury_gold" style="padding-bottom: 2%;text-align: center;"><?php echo $data_1['title']; ?></span>
            </div>
            <p class="adas_text_o_nac" style="padding-bottom: 1%;"><?php echo $data_1['description']; ?></p>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
              <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                <p class="text_factura_bold">Толщина полотна</p>
              </div>

              <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                <span class="text_factura_bold"><?php echo $data_1['fabric_thickness']; ?></span><br><br>
              </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
              <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                <p class="text_factura_bold">Возможно изготовление  изделия без стыков</p>

              </div>

              <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                <span class="text_factura_bold"><?php echo $data_1['MPWJ']; ?></span><br><br>
              </div>

            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;padding-bottom: 1%;">
              <div class="col-lg-9 col-md-9 col-sm-8 col-xs-7" style="padding: 0;padding-bottom: 1%;">
                <p class="text_factura_bold">Цена</p>

              </div>

              <div class="col-lg-3 col-md-3 col-sm-4 col-xs-5">
                <span class="text_factura_bold"><?php echo $data_1['prices']; ?></span>
              </div>

            </div>
          </div>
        </div>

      <?php } ?>
    </div>
   <!--   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
          <h1 class="col-lg-12 col-md-12 hidden-sm hidden-xs title_adas_o_galer" style="padding:0;"><?php echo $heading_title; ?></h1>
          <h1 class="hidden-lg hidden-md col-sm-12 col-xs-12 title_adas_o_galer_2"><?php echo $heading_title; ?></h1>
      </div>-->
      <?php // echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>