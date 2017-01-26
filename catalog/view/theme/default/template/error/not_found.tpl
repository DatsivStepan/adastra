<?php echo $header; ?>
<div class="container">
  <!--<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> -->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="s_title"><?php echo $heading_title; ?></h1>
      <div class="s_text">
        <?php echo $text_error; ?>
      </div>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary s_button"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<style>
  .s_title{
    font-family: 'Times New Roman';
    font-weight: bold;
    font-size: 30px;
    color: #060503;
    display: block;
    margin-bottom: 25px;  }
  .s_text{
    font-family: 'Times New Roman';
    font-size: 20px;
    color: #060503;
    display: block;
    margin-bottom: 25px;
  }
  .s_button,
  .s_button:hover,
  .s_button:focus{
    height: 50px;
    color: #fff;
    border: 1px solid #322d2d;
    background: #322d2d;
    font-size: 22px;
    font-family: 'Times New Roman';
    margin-left: 5px;
  }
</style>