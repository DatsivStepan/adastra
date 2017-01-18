<?php echo $header;?>
<div id="content" class="dad" xmlns="http://www.w3.org/1999/html">
    <div class="hidden-sm hidden-xs">
        <?php foreach ($category_home as $key => $category) { ?>
        <?php if(($key == 0)){ ?>
        <div class="add1_2">
        <div class="add1_1_2"  style="background: url(<?php echo $category['image'];?>)center no-repeat; height: 300px; background-size:cover; "></div>
            <div class="div-ramka-style_2"></div>
            <div class="text_kat_name_2">
                <span><?php echo $category['name']; ?></span>
                <div class="border_kat">
                    <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 1)){ ?>
        <div class="add1_1">
            <div class="add1_1_1"  style="background: url(<?php echo $category['image'];?>)center no-repeat; height: 300px; background-size:cover;"></div>
            <div class="div-ramka-style"></div>
            <div class="text_kat_name_3">
                <span><?php echo $category['name']; ?></span>
                <div class="border_kat">
                    <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 2)){ ?>
        <div class="add1_1">
        <div class="add1_1_1" style="background: url(<?php echo $category['image'];?>)center no-repeat; height: 300px; background-size:cover;"></div>
            <div class="div-ramka-style"></div>
            <div class="text_kat_name">
                <span><?php echo $category['name']; ?></span>
                <div class="border_kat">
                    <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 3)){ ?>
        <div class="add1_1">
        <div class="add1_1_1" style="background: url(<?php echo $category['image'];?>)center no-repeat; height: 300px; background-size:cover;"></div>
            <div class="div-ramka-style"></div>
            <div class="text_kat_name">
                <span><?php echo $category['name']; ?></span>
                <div class="border_kat">
                    <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 4)){ ?>
        <div class="add4">
            <div style="background: url(<?php echo $category['image'];?>)center no-repeat; height: 300px; background-size:cover;"></div>
            <div id="parallelogram_5"></div>
            <div class="text_kat_name">
                <span><?php echo $category['name']; ?></span>
                <div class="border_kat">
                    <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
    <?php
    $i = 1;
    foreach ($category_home as $category) { ?>
    <div class="hidden-lg hidden-md">
        <div class="adas_img_sm adas_img_sm2 <?php if($i == 1){echo 'cat1xsFix';} if($i == 5){echo 'cat5xsFix';} ?>"
             style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar2">
                <div class="col-sm-6 col-xs-12 text_box">
                    <div class="">
                        <span><?php echo $category['name']; ?></span>
                    </div>
                </div>
                <div class="col-sm-6 col-xs-12 text_box2">
                    <div class="border_kat2">
                        <a class="a_kat_adast" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $i++;} ?>

    <!--<?php
        $count = count($arr);
    ?>-->
</div>
<div class="container">
    <div class="col-lg-12 col-md-12 col-sm-12 hidden-xs home_adas_text" style="padding: 0;">
        <?php echo $content_top; ?>
    </div>
    <div class="col-sm-12 col-xs-12 col-lg-12 col-md-12 adas_new_text" style="">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs ul_centr ul_center_20_mar" role="tablist">
            <li role="presentation" class="active"><a class="a_adas_sul news text_tabs text_tabs_20_text bot_hover_20_stile" href="#panely1"
                                                      aria-controls="home" role="tab" data-toggle="tab">Новинки</a></li>
            <li role="presentation"><a class="a_adas_sul hyty_prod text_tabs text_tabs_20_text bot_hover_20_stile" href="#panely2" aria-controls="profile"
                                       role="tab" data-toggle="tab">Хиты продаж</a></li>
            <li role="presentation"><a class="a_adas_sul stocks text_tabs text_tabs_20_text bot_hover_20_stile" href="#panely3" aria-controls="messages"
                                       role="tab" data-toggle="tab">Акции</a></li>
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
    <!-- <div class="">
         <?php
     if(isset($content_bottom['modules'][3])){
                      echo $content_bottom['modules'][3];
                     } ?>
     </div> -->
</div>
<div class="row rows_2 no-margin">
    <?php foreach ($category_muse as $musey) { ?>
    <div class="div_muzey_text"><?php echo($musey['name'])?></div>
    <div id="owl-carousel" class="owl-carousel owl-theme  car_ow_np_20" data-ride="carousel">
        <?php foreach($musey['option_value'] as $option){ ?>
        <div class="item">
            <div class="div_item_text" style="background: url(image/<?php echo $option['image'];?>) center no-repeat; background-size: cover">
                <a href="http://adastra.local/index.php?route=product/category&path=20_28&mfp=36-muzey[<?php echo $option['name'];?>]">
                    <div class="text_title_np_21" style=""><?php echo $option['name'];?></div></a>
            </div>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
</div>
<div style="clear:both;"></div>
<div class="row" style="margin: 0;">
    <div class="middle-home-img-div-style">
        <div class="container">
            <span class="middle-home-text-title">География работы</span>
            <div class="container middle-home-div-text middle-home-div-text20">
            <span class="middle-home-text">
                Мы работаем со всей Россией (упор на Москву, Питер, Ростов, Сочи), а также зарубежьем. Мы готовы продукцию
                отправлять транспортными компаниями за границу. Мы работаем со всей Россией (упор на Москву, Питер, Ростов, Сочи), а также зарубежьем. Мы готовы продукцию
                отправлять транспортными компаниями за границу. Мы работаем со всей Россией (упор на Москву, Питер, Ростов, Сочи), а также зарубежьем. Мы готовы продукцию
                отправлять транспортными компаниями за границу.
            </span>
            </div>
        </div>
    </div>
    <div class="row rows_2 no-margin">
        <?php foreach ($category_artist as $artist) { ?>
            <div class="div_muzey_text_art"><?php echo($artist['name'])?></div>
            <div class="container">
                <div class="row">
                    <?php foreach ($artist['option_value'] as $artist_art) { ?>
                            <div class="div_item_text_art col-lg-3" style="background: url(image/<?php echo $artist_art['image'];?>) center no-repeat;">
                                <a href="http://adastra.local/index.php?route=product/category&path=20_28&mfp=36-muzey[<?php echo $artist_art['name'];?>]">
                                    <div class="text_title_np_21_art" style=""><?php echo $artist_art['name'];?></div></a>
                            </div>
                    <?php } ?>
                </div>
            </div>
        <?php } ?>
        </div>
    </div>
    <div class="row div-advantages-bg no-margin">
        <div class="container advantages-container-style">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 5%;">
                <span class="advantages-style">
                    Наши </br> преимущества
                </span></br>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 advantages_1-div-style advantages_1-div-style_20">
                <span class="advantages_1-style">
                    интернет магазин фресок Галерея Адастра обладает</br>следующими преимуществами:
                </span>
            </div>

            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style adv_con_tit_np_1">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                                Экологически чистые материалы
                            </span></br>
                            <span class="advantages-content-style">
                                При изготовлении нашей продукции используются только экологически чистые материалы,
                                которые не наносят вред вашему здоровью
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style adv_con_tit_np_2">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                                Мы являемся производителями
                            </span></br>
                            <span class="advantages-content-style">
                                Мы являемся производителями с наличием собственной производственной базы,
                                что дает нам возможность придерживаться лояльной ценовой политики не в ущерб качеству изделий
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style adv_con_tit_np_3">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                                Бесшовная печать
                            </span></br>
                            <span class="advantages-content-style">
                                Бесшовная печать фресок и фотообоев до 3,20 метров в высоту и до  36 метров в длину
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style adv_np_20_20" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style adv_con_tit_np_4">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                                Большой выбор
                            </span></br>
                            <span class="advantages-content-style">
                                Широкий выбор фактур фотообоев и фресок
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" >
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style adv_con_tit_np_5">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                               Эксклюзивный макет
                            </span></br>
                            <span class="advantages-content-style">
                                Также наши дизайнеры могут изготовить для вас эксклюзивный макет с применением техники коллажа,
                                дорисовки изображений с учетом конфигурации помещения, которое вы хотите украсить нашими изделиями,
                                или же нарисовать макет, соответствующий вашим персональным пожеланиям.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style adv_con_tit_np_6">
                            <div class="advantages-icon-div-style"><img src="../../../catalog/view/theme/default/image/advantage_icon.png"></div>
                            <span class="advantages-content-title-style">
                                Репродукции картин
                            </span></br>
                            <span class="advantages-content-style">
                               Репродукции картин маслом на холсте любого размера по желанию заказчика.
                               Наши художники выполнят для Вас копии любых шедевров живописи в высочайшем качестве!
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-div-contact-style hidden-xs" >
                <div class="row no-margin" style="padding-bottom: 10px">
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                      <span class="footer-contact-text-left-style home_contact">
                          Контакты:
                      </span>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="row">
                            <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                                <img src="../../../catalog/view/theme/default/image/phone.png">
                            </div>
                            <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-phone-text-style">
                                <span class="footer-contact-text-right-style"><?php echo $telephone; ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="row">
                            <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                                <img src="../../../catalog/view/theme/default/image/phone.png">
                            </div>
                            <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-phone-text-style" >
                                <span class="footer-contact-text-right-style"><?php echo $telephone2; ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                        <div class="row">
                            <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                                <img src="../../../catalog/view/theme/default/image/mail.png">
                            </div>
                            <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-email-text-style">
                                <span class="footer-contact-text-right-style">
                                    <a class="footer-contact-text-right-style" href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="hidden-sm hidden-md hidden-lg hidden-xl container div-home-contact-style no-padding">
        <div class="row no-margin" style="padding-bottom: 10px; text-align: center">
            <div class="col-xs-12 mobile-contact-div-style">
                  <span class="footer-contact-text-left-style">
                      Контакты:
                  </span>
            </div>
            <div style="width: 100%">
                <div class="col-xs-12 mobile-contact-div-style">
                    <img src="../../../catalog/view/theme/default/image/phone.png">
                    <span class="footer-contact-text-right-style"><?php echo $telephone; ?></span>
                </div>
            </div>
            <div style="width: 100%">
                <div class="col-xs-12 mobile-contact-div-style">
                    <img src="../../../catalog/view/theme/default/image/phone.png">
                    <span class="footer-contact-text-right-style"><?php echo $telephone; ?></span>
                </div>
            </div>
            <div style="width: 100%">
                <div class="col-xs-12 mobile-contact-div-style">
                    <img src="../../../catalog/view/theme/default/image/mail.png">
                    <span class="footer-contact-text-right-style">
                        <a class="footer-contact-text-right-style" href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>

                    </span>
                </div>

            </div>
        </div>
    </div>
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
            navigationText: ['<img src="/catalog/view/theme/default/image/owlCarusel_strilka_vlivo.png" />', '<img src="/catalog/view/theme/default/image/owlCarusel_strilka_vpravo.png" />'],
            pagination: false
        });

    });
</script>