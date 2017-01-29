<?php echo $header; ?>
<div class="container">
  <!-- <div class=" container_breadcrumb hidden-xs">
    <ul class="breadcrumb_contact_style hidden-xs  col-sm-12 col-md-12 col-lg-12 no-padding">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if ($breadcrumb ['href']==('')){ ?>
      <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
      <?php }else{ ?>
      <li class="breadcrumb_text"
      ><a class="text" href="<?php echo $breadcrumb['href']; ?>" style="padding-right: 12px; background: url('../../../catalog/view/theme/default/image/strilka.png') right center no-repeat;"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div> -->
  <div class="row" style="margin-top: 20px;"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="container">
        <div class="row">
          <div class="col-lg-5">
            <span><img src="../image/<?= $image; ?>" class="museum-cart-img-size"></span>
          </div>
          <div class="col-lg-6">
            <span class="museum-title-style">
              <?php echo $heading_title; ?>
            </span>
            <span class="museum-description-style">
              <?= $description; ?>
            </span>
            <div class="row">
              <div class="col-lg-6"></div>
              <div class="col-lg-6"><a href="index.php?route=product/manufacturer/" class="btnLink">Назад в каталог</a></div>
            </div>
          </div>
        </div>
        <div class="row museum-ing-bottom">
          <span class="museum-img-div-title">фотографии</span>
          <div class="">
            <?php  $mus_imgs = explode('*', $images); ?>
            <div id="owl-carousel" class="owl-carousel owl-theme  car_ow_np_20 owl-pagination" data-ride="carousel">
              <?php $i = 0; ?>
              <?php foreach($mus_imgs as $mus_img){ ?>
                <div class="item" style="margin: 0 2px;">
                    <div style="width: 100%; margin-right: 2px; float: left; margin-top: 15px">
                      <img src="../image/<?= $mus_img; ?>" style="width: 100%; height: 150px">
                    </div>
                </div>
              <?php $i+=1; ?>
              <?php } ?>
            </div>
            <div class="pagination-text-style">
              <?php  echo 'Еще фото'.' '.'('.($i - 5).')'; ?>
            </div>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script>
    $(document).ready(function() {
        var owl = $("#owl-carousel");

        owl.owlCarousel({

            itemsCustom : [
                [0, 1],
                [450, 2],
                [600, 2],
                [700, 3],
                [1000, 5],
                [1200, 5],
                [1400, 5],
                [1600, 5]
            ],
            navigation : true,
            autoPlay: true,
            navigationText: ['<img src="/catalog/view/theme/default/image/left_point.png" />', '<img src="/catalog/view/theme/default/image/right_point.png" />'],
            pagination: false
        });

    });
</script>
<style>
  .btnLink,
  .btnLink:hover
  .btnLink:focus{
    color: #fff !important;
    background: #000;
    float: right;
    display: block;
    height: 40px;
    padding: 9px 35px;
    font-family: 'Times NEW Roman';
    font-weight: bold;
    font-size: 16px;
    text-decoration: none !important;
    cursor: pointer;
  }
</style>
