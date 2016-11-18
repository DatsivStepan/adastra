<?php echo $header;?>
<div id="content" class="<?php echo $class; ?>">
<?php foreach ($category_home as $category) { ?>
<?php if($category == end($category_home)) { ?>
    <div class="adas_img_mar" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
        <h1 class="text_kat_name"><?php echo $category['name']; ?></h1>
        <div class="border_kat">
            <a class="a_kat_adas" href="<?php echo $category['href'];?>">В катеорію</a>
        </div>
    </div>
 <?php }
  else { ?>
    <div class="adas_img" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
        <h1 class="text_kat_name"><?php echo $category['name']; ?></h1>
        <div class="border_kat">
            <a class="a_kat_adas" href="<?php echo $category['href'];?>">В катеорію</a>
        </div>
    </div>
    <?php } ?>
<?php } ?>
<div class="container">
    <div class="col-lg-12 col-md-12 col-sm-12 hidden-xs home_adas_text" style="padding: 0;">
        <?php echo $content_top; ?>
    </div>
    <div class=" col-lg-12 col-md-12">
        <div class=" col-lg-12 col-md-12 adas_new_text" style="">
            <div class=" col-lg-3 col-md-3"></div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a class="a_adas_sul" href="#panely1" aria-controls="home" role="tab" data-toggle="tab">Новинки</a></li>
                <li role="presentation"><a class="a_adas_sul" href="#panely2" aria-controls="profile" role="tab" data-toggle="tab">Хиты продаж</a></li>
                <li role="presentation"><a class="a_adas_sul" href="#panely3" aria-controls="messages" role="tab" data-toggle="tab">Акции</a></li>
            </ul>
            <div class=" col-lg-3 col-md-3"></div>
        </div>
    </div>
        <div class="tab-content">
            <div id="panely1" class="tab-pane fade in active">
                <?php if(isset($content_bottom['modules'][0])){
                echo $content_bottom['modules'][0];
                } ?>
            </div>
            <div id="panely2" class="tab-pane fade">
                <?php if(isset($content_bottom['modules'][1])){
                 echo $content_bottom['modules'][1];
                 } ?>
            </div>
            <div id="panely3" class="tab-pane fade">
                <?php if(isset($content_bottom['modules'][2])){
                 echo $content_bottom['modules'][2];
                 } ?>
            </div>
        </div>
    </div>



  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>

<?php echo $footer; ?>