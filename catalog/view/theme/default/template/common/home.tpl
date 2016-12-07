<?php echo $header;?>
<div id="content" class="dad" xmlns="http://www.w3.org/1999/html">
    <div class="hidden-sm hidden-xs">
        <?php foreach ($category_home as $key => $category) { ?>
        <?php if(($key == 0)){ ?>
        <div class="add" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar">
                <div class="text_kat_name">
                    <h1><?php echo $category['name']; ?></h1>
                    <div class="border_kat">
                        <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 1)){ ?>
        <div class="add1" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar">
                <div class="text_kat_name">
                    <h1><?php echo $category['name']; ?></h1>
                    <div class="border_kat">
                        <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 2)){ ?>
        <div class="add2" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar">
                <div class="text_kat_name">
                    <h1><?php echo $category['name']; ?></h1>
                    <div class="border_kat">
                        <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 3)){ ?>
        <div class="add3" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar">
                <div class="text_kat_name">
                    <h1><?php echo $category['name']; ?></h1>
                    <div class="border_kat">
                        <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php if(($key == 4)){ ?>
        <div class="add4" style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar">
                <div class="text_kat_name">
                    <h1><?php echo $category['name']; ?></h1>
                    <div class="border_kat">
                        <a class="a_kat_adas" href="<?php echo $category['href'];?>">В категорию</a>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
    <?php foreach ($category_home as $category) { ?>
    <div class="hidden-lg hidden-md">
        <div class="adas_img_sm adas_img_sm2"
             style="background: url(<?php echo $category['image'];?>)center no-repeat;">
            <div class="adas_img_mar2">
                <div class="col-sm-6 col-xs-12 text_box">
                    <div class="">
                        <h1><?php echo $category['name']; ?></h1>
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
    <?php } ?>

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
    <div class="">
        <?php
    if(isset($content_bottom['modules'][3])){
                    echo $content_bottom['modules'][3];
                    } ?>
    </div>
</div>
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
    <div class="row div-advantages-bg no-margin">
        <div class="container advantages-container-style">
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top: 5%;">
                <span class="advantages-style advantages_style_20">
                    Наши </br> преимущества
                </span></br>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 advantages_1-div-style advantages_1-div-style_20">
                <span class="advantages_1-style">
                    интернет магазин фресок Галерея Адастра обладает</br>следующими преимуществами:
                </span>
            </div>
            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="margin-bottom: 30px">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_1-style">1</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style">
                            <span class="advantages-content-title-style">
                                Экологически чистые материалы
                            </span></br>
                            <span class="advantages-content-style">
                                При изготовлении нашей продукции используются только экологически чистые материалы, корорые не наносят
                                вред вашему здоровью
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_2-style">2</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style">
                            <span class="advantages-content-title-style">
                                Мы являемся производителями
                            </span></br>
                            <span class="advantages-content-style">
                                Мы являемся производителями с наличием собственной производственной базы, что дает
                                нам возможность придерживаться лояльной ценовой политики не в ущерб качеству изделий.
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
            </div>
            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="margin-bottom: 30px">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_3-style">3</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style">
                            <span class="advantages-content-title-style">
                                Экологически чистые материалы
                            </span></br>
                            <span class="advantages-content-style">
                                При изготовлении нашей продукции используются только экологически чистые материалы, корорые не наносят
                                вред вашему здоровью
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_4-style">4</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style">
                            <span class="advantages-content-title-style">
                                Мы являемся производителями
                            </span></br>
                            <span class="advantages-content-style">
                                Мы являемся производителями с наличием собственной производственной базы, что дает
                                нам возможность придерживаться лояльной ценовой политики не в ущерб качеству изделий.
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
            </div>
            <div class="row  row-advantages-style">
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="margin-bottom: 30px">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_5-style">5</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_1-div-style">
                            <span class="advantages-content-title-style">
                                Экологически чистые материалы
                            </span></br>
                            <span class="advantages-content-style">
                                При изготовлении нашей продукции используются только экологически чистые материалы, корорые не наносят
                                вред вашему здоровью
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
                <div class="col-sm-5 col-md-5 col-lg-5 col-xl-5 advantages-div-style" style="float: right">
                    <div class="row" style="position: relative; margin: 0 ">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xl-2 advantages-number_1-div-style">
                            <span class="advantages-number_6-style">6</span>
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xl-10 text-left advantages-content_2-div-style">
                            <span class="advantages-content-title-style">
                                Мы являемся производителями
                            </span></br>
                            <span class="advantages-content-style">
                                Мы являемся производителями с наличием собственной производственной базы, что дает
                                нам возможность придерживаться лояльной ценовой политики не в ущерб качеству изделий.
                            </span>
                        </div>
                    </div>
                    <div class="div-border_1-style"></div>
                    <div class="div-border-style"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="hidden-xs container div-home-contact-style no-padding">
        <div class="row no-margin" style="padding-bottom: 10px">
            <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3 no-padding">
                  <span class="footer-contact-text-left-style">
                      Контакты:
                  </span>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                <div class="row">
                    <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                        <img src="../../../catalog/view/theme/default/image/phone.png">
                    </div>
                    <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-phone-text-style">
                        <span class="footer-contact-text-right-style" style="color: #494545;"><?php echo $telephone; ?></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                <div class="row">
                    <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                        <img src="../../../catalog/view/theme/default/image/phone.png">
                    </div>
                    <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-phone-text-style">
                        <span class="footer-contact-text-right-style" style="color: #494545;"><?php echo $telephone; ?></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                <div class="row">
                    <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 ">
                        <img src="../../../catalog/view/theme/default/image/mail.png">
                    </div>
                    <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 footer-email-text-style">
                        <span class="footer-contact-text-right-style" style="color: #494545;"><?php echo $email; ?></span>
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
                    <span class="footer-contact-text-right-style"><?php echo $email; ?></span>
                </div>

            </div>
        </div>
    </div>
</div>

<?php echo $footer; ?>