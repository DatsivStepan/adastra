<?php echo $header; ?>
<div class="container">
  <div class="col-lg-12 col-md-12 hidden-sm hidden-xs container_breadcrumb_2" style="padding: 0;">
    <ul class="breadcrumb_contact col-lg-12"style="padding: 0;">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php if ($breadcrumb ['href']==('')){ ?>
          <li class="breadcrumb_text_2"><?php echo $breadcrumb['text']; ?></li>
      <?php }else{ ?>
      <li class="breadcrumb_text_2">
          <a class="text" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      </li>
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
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
          <h1 class="col-lg-12 col-md-12 hidden-sm hidden-xs title_adas_o_galer" style="padding:0;"><?php echo $heading_title; ?></h1>
          <h1 class="hidden-lg hidden-md col-sm-12 col-xs-12 title_adas_o_galer_2"><?php echo $heading_title; ?></h1>
      </div>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
