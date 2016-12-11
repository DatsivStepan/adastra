<?php echo $header; ?>
<div class="container" id="container">
  <div class=" container_breadcrumb hidden-xs">
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
  </div>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

<!-- Quick Checkout v4.0 by Dreamvention.com checkout/quickcheckout.tpl -->
  <?php echo $d_quickcheckout; ?>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>