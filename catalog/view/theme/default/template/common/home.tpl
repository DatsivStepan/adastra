<?php echo $header;?>
<div id="content" class="dad" xmlns="http://www.w3.org/1999/html">
    <div class="hidden-sm hidden-xs" style="position: relative">
        <?php foreach ($category_home as $key => $category) { ?>
        <?php if(($key == 0)){ ?>
        <div class="add1_2">
        <div class="add1_1_2"  style="background: url(<?php echo $category['image'];?>)center no-repeat; background-size:100% 100%; "></div>
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
            <div class="add1_1_1"  style="background: url(<?php echo $category['image'];?>)center no-repeat; background-size:100% 100%;"></div>
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
        <div class="add1_1_1" style="background: url(<?php echo $category['image'];?>)center no-repeat; background-size:100% 100%;"></div>
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
        <div class="add1_1_1" style="background: url(<?php echo $category['image'];?>)center no-repeat; background-size:100% 100%;"></div>
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

        <?php } ?>
        <?php } ?>
        <div class="add1_3">
            <div class="add1_1_3" style="background: url('../../image/catalog/category_5.png')center no-repeat; background-size:100% 100%;"></div>
            <div class="div-ramka-style_3"></div>
            <div class="text_kat_name_3">
                <span>ПЕЧАТЬ ВАШЕГО ФОТО НА ХОЛСТЕ</span>
                <div class="border_kat_3">
                    <a class="a_kat_adas" href="http://<?php echo $_SERVER['SERVER_NAME']?>/index.php?route=product/product&product_id=62">В категорию <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
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
    <div class="hidden-lg hidden-md">
        <div class="adas_img_sm adas_img_sm2 <?php if($i == 1){echo 'cat1xsFix';} if($i == 5){echo 'cat5xsFix';} ?>"
             style="background: url('../../image/catalog/category_5.png')center no-repeat;">
            <div class="adas_img_mar2">
                <div class="col-sm-6 col-xs-12 text_box">
                    <div class="">
                        <span>ПЕЧАТЬ ВАШЕГО ФОТО НА ХОЛСТЕ</span>
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
<div class="row rows_2" style="    margin: 50px 0;">
    <div class="div_muzey_text_art"></div>
    <div class="container">
        <div class="row">
            <div class="div_item_text_art col-lg-3 col-sm-12" style="background: url(image/catalog/art_1.png) center no-repeat;">
                <a href="index.php?route=product/manufacturerart/&category=ru">
                    <div class="text_title_np_21_art" style="">Русские художники</div></a>
            </div>
            <div class="div_item_text_art col-lg-3 col-sm-12" style="background: url(image/catalog/art_2.png) center no-repeat;">
                <a href="index.php?route=product/manufacturerart/&category=world">
                    <div class="text_title_np_21_art" style="">Зарубежные художники</div></a>
            </div>
            <div class="div_item_text_art col-lg-3 col-sm-12" style="background: url(image/catalog/art_3.png) center no-repeat;">
                <a href="index.php?route=product/manufacturerart/&category=other">
                    <div class="text_title_np_21_art" style="">Роботы неизвестных художников</div></a>
            </div>
        </div>

    </div>
</div>
<div class="row rows_2 no-margin">
    <?php foreach ($category_muse as $musey) { ?>
    <div class="div_muzey_text"><?php echo($musey['name'])?></div>
    <div id="owl-carousel" class="owl-carousel owl-theme  car_ow_np_20" data-ride="carousel">
        <?php foreach($manufacturers as $manufacturer){ ?>
        <div class="item">
            <div class="div_item_text" style="background: url(image/<?php echo $manufacturer['image'];?>) center no-repeat; background-size: cover">
                <a href="index.php?route=product/manufacturer/show&manufacturer_id=<?php echo $manufacturer['manufacturer_id'];?>">
                    <div class="text_title_np_21" style=""><?php echo $manufacturer['name'];?></div></a>
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

    </div>
    <div class="row div-advantages-bg no-margin">
        <div class="container advantages-container-style hidden-xs">
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
        <div class="container advantages-container-style visible-xs">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 5%;">
                <span class="advantages-style">
                    Здравствуйте
                </span><br>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 advantages_1-div-style advantages_1-div-style_20">
                <span class="advantages_1-style" style="text-align: justify;">
                    Мы рады приветствовать Вас в Галерее Адастра!
                </span>
            </div>
            <div>
                <p class="advantages-content-style" style="padding: 20px 60px;">
                    Мы являемся производителями с наличием собственной производственной базы, что дает нам возможность придерживаться лояльной ценовой политики не в ущерб качеству изделий. При изготовлении нашей продукции используются только экологически чистые материалы, которые не наносят вред вашему здоровью.
                </p>
                <p class="advantages-content-style" style="padding: 20px 60px;">
                    Мы предлагаем Вашему вниманию огромный каталог изображений и широкий выбор фактур и багетов. Технические возможности позволяют нам изготавливать бесшовные обои и фрески до 3,20 м. в высоту и 36 м. в длину.  Вы можете приобрести готовые репродукции картин маслом, заказать печать копии картины на холсте, либо распечатать свое фото, загрузив его на сайт. Кроме того, наши художники выполнят под заказ репродукции картин маслом любого размера на холсте, а дизайнеры изготовят эксклюзивный макет с применением техники коллажа, дорисовки изображений с учетом конфигурации помещения, которое Вы хотите украсить нашими изделиями.
                </p>
                <p class="advantages-content-style" style="padding: 20px 60px;">
                    На сайте размещены не все образцы фактур и багета в связи с их большим количеством. Для более подробного ознакомления с ними приглашаем Вас посетить наш шоу-рум на м. Таганская.
                </p>
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