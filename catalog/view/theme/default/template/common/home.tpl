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
        <div class=" col-lg-12 col-md-12 adas_new_text" style="">
            <!-- Nav tabs -->
            <ul style="margin: 0 auto; width: 30%;" class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a class="a_adas_sul" href="#panely1" aria-controls="home" role="tab" data-toggle="tab">Новинки</a></li>
                <li role="presentation"><a class="a_adas_sul" href="#panely2" aria-controls="profile" role="tab" data-toggle="tab">Хиты продаж</a></li>
                <li role="presentation"><a class="a_adas_sul" href="#panely3" aria-controls="messages" role="tab" data-toggle="tab">Акции</a></li>
            </ul>
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
    <div class="container">
        <div class="row" style="padding-bottom: 15px">
            <span class="desktop-home-text-style">Только что купили</span>
        </div>
        <div class="col-lg-2" style="margin-right: 25px">
            <img style="width: 130%" src="../../../catalog/view/theme/default/image/img_1.png">
            <span class="img-title-style">The Abduction of Ganymede</span>
        </div>
        <div class="col-lg-2" style="margin-right: 25px">
            <img style="width: 130%" src="../../../catalog/view/theme/default/image/img_2.png">
            <span class="img-title-style">Vemus and  Adonis</span>
        </div>
        <div class="col-lg-2" style="margin-right: 25px">
            <img style="width: 127%" src="../../../catalog/view/theme/default/image/img_3.png">
            <span class="img-title-style">Throne Nymphs Offering</span>
        </div>
        <div class="col-lg-2" style="margin-right: 25px">
            <img style="width: 130%" src="../../../catalog/view/theme/default/image/img_4.png">
            <span class="img-title-style">Mythological Scene</span>
        </div>
        <div class="col-lg-2" style="margin-right: 25px">
            <img style="width: 130%" src="../../../catalog/view/theme/default/image/img_5.png">
            <span class="img-title-style">Вид на цветущий сад</span>
        </div>
    </div>
</div>

<?php echo $footer; ?>