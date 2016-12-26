<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="min-width=600px, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/default/stylesheet/stylees.css" rel="stylesheet">
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/mystels.css" rel="stylesheet">
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modal.js" type="text/javascript"></script>-->
<script src="catalog/view/javascript/header.js" type="text/javascript"></script>

  <!-- START PRODUCT_CARD STYLES&SCRIPTS-->
  <link  href="catalog/view/css/cropper.css" rel="stylesheet">
  <script src="catalog/view/javascript/cropper.min.js" type="text/javascript"></script>
  <script src="catalog/view/javascript/VanillaMasker.js" type="text/javascript"></script>

  <link  href="catalog/view/css/nouislider.css" rel="stylesheet">
  <script src="catalog/view/javascript/nouislider.min.js" type="text/javascript"></script>

  <link  href="catalog/view/theme/default/stylesheet/product_card_1.css" rel="stylesheet">
  <!-- END PRODUCT_CARD STYLES&SCRIPTS -->

  <?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

  <script type="text/javascript">

      $(function() {

          $(window).scroll(function() {

              if($(this).scrollTop() != 0) {

                  $('#toTop').fadeIn();

              } else {

                  $('#toTop').fadeOut();

              }

          });

          $('#toTop').click(function() {

              $('body,html').animate({scrollTop:0},800);

          });

      });

  </script>
</head>


<body class="<?php echo $class; ?>">
<!--
<div id="contactForm_ru" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header" style="border: 0">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            </div>

            <div class="modal-body" style="text-align: center;">
                <div class="modal-title-style">Сообщение</div>
                <div>
                    <form id="contactForm_ru" action="" method="post">
                        <ul id="errorMasege" style="padding-left: 0">
                            <span style="display: none; color: red" class="row name">Некоректно заполнено Имя пользователя</span>
                            <span style="display: none; color: red" class="row email ">Некоректно заполнено Email</span>
                            <span style="display: none; color: red" class="row message ">Минимальная длина сообщения десеть знаков</span>
                        </ul>
                        <div class="row modal-div-input-stile">
                            <input class="modal-input-style contactItem" id="name_ru" name="name_ru" type="text" placeholder="Ваше имя">
                        </div>
                        <div class="row modal-div-input-stile">
                            <input class="modal-input-style contactItem" id="email_ru" name="email_ru" type="text" placeholder="E-MAIL">
                        </div>
                        <div class="row modal-div-input-stile">
                            <textarea  name="message_ru" placeholder="Ваше сообщение" rows="5" id="message_ru" class="contactItem modal-textarea-style"></textarea>
                        </div>
                        <button id="sendMessage_ru" type="button" class="btn modal-btn-style">Отправить сообщение</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> -->
<div id="contactForm_en" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
      <div class="modal-header" style="border: 0">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
      </div>
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" style="text-align: center;">
        <div class="modal-title-style">Обратная связь</div>
        <div>
          <form id="contactForm" action="" method="post">
            <ul id="errorMasege" style="padding-left: 0">
              <span style="display: none; color: red" class="row name">Некоректно заполнено Имя пользователя</span>
              <span style="display: none; color: red" class="row email ">Некоректно заполнено Email</span>
              <span style="display: none; color: red" class="row message ">Минимальная длина сообщения десеть знаков</span>
            </ul>
            <div class="row modal-div-input-stile">
              <input class="modal-input-style contactItem" id="name" name="name" type="text" placeholder="ВАШЕ ИМЯ">
            </div>
            <div class="row modal-div-input-stile">
              <input class="modal-input-style contactItem" id="email" name="email" type="text" placeholder="E-MAIL">
            </div>
            <div class="row modal-div-input-stile">
              <textarea  name="message" placeholder="СООБЩЕНИЕ" rows="5" id="message" class="contactItem modal-textarea-style"></textarea>
            </div>
            <button id="sendMessage" type="button" class="btn modal-btn-style">Отправить</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<header>
  <!--Desktop header begin-->
  <?php if($data['is_home'] == 'home'){ ?>
  <div class="row no-margin div-header-style">
  <?php }else{ ?>
        <div class="row div-header-style-1 no-margin">
     <?php } ?>
          <div class="container hidden-xs">
        <nav >
          <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 header-logo-div-style">
            <div id="logo">
              <?php if ($logo) { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
            </div>
          </div>
          <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10">
            <div class="row">
              <div class="col-sm-8 col-md-8 col-lg-8 col-xl-8">
                <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4  no-padding">
                  <i>
                    <img class="header-phone-icon-width"  src="../../../catalog/view/theme/default/image/phone.png">
                  </i>
                  <span class="header-phone-style">
                    <?php echo $telephone; ?>
                  </span>
                </div>
                <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 no-padding">
                  <i>
                    <img class="header-phone-icon-width"  src="../../../catalog/view/theme/default/image/phone.png">
                  </i>
                  <span class="header-phone-style">
                    <?php echo $telephone2; ?>
                  </span>
                </div>
                <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 no-padding">
                  <i>
                    <img class="header-email-icon-width"  src="../../../catalog/view/theme/default/image/mail.png">
                  </i>
                  <span class="header-phone-style">
                    <?php echo $email; ?>
                  </span>
                </div>
              </div>
              <div class="col-sm-8 col-md-8 col-lg-8 col-xl-8 no-padding" style="margin-top: 15px">
                <div class="row">
                  <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
                    <div id="products" class="products-style fa fa-bars  no-padding div-products-style">
                      <span class="title header-text-style" style="padding-left: 5px">ПРОДУКЦИЯ <span id="product_1" class="fa fa-angle-down product-icon-size"></span></span>
                    </div>
                  </div>
                  <div class="col-sm-9 col-md-9 col-lg-9 col-xl-9 no-padding">
                    <div class=" div-menu-style">
                      <a href="/index.php?route=information/information&information_id=9"><span class="header-menu-text-style">Как купить?</span></a>
                      <a href="/index.php?route=information/information&information_id=10"><span class="header-menu-text-style">Оплата</span></a>
                      <a href="/index.php?route=information/information&information_id=6"><span class="header-menu-text-style">Доставка</span></a>
                      <a href="/index.php?route=information/contact"><span class="header-menu-text-style">Контакты</span></a>
                      <a href="/index.php?route=information/information&information_id=7"><span class="header-menu-text-style">География работы</span></a>
                      <a href="/index.php?route=information/materialsAndPrices"><span class="header-menu-text-style">Материалы и цены</span></a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <div class="row">
                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6" style="margin-top: -10px">
                    <?php echo $currency; ?>
                    <?php echo $language; ?>
                    <div id="contact" class="row header-div-contact-style">
                      <span class="header-contact-text-style-1" data-toggle="modal" data-target="#contactForm_ru">Обратный звонок</span></br>
                      <span class="header-contact-text-style-2"  data-toggle="modal" data-target="#contactForm_en">We speak english</span>
                    </div>
                  </div>
                  <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6" style="margin-top: -20px">
                    <?php echo $cart; ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
          <div id="products_id" class="header-products-div-style ">
            <div class=" container" style="">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 product-div-style" style="border-right-style: dotted;border-right-width: 1px;">
                <div class="product-div-title-style">
                        <span class="products-title-style"><?php echo $category['name']; ?>
                </div>
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <span class="">
                        <?php foreach ($children as $child) { ?>
                  <span class="products-category-span-style" style="display: block;padding: 0 0 0 6px;"><a class="products-category-style" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span>
                  <?php } ?>
                      </span>
                <?php } ?>
              </div>
              </span>
              <?php } else { ?>
              <span class="products-category-style"><?php echo $category['name']; ?></span>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
      </div>
<!--Desktop header end-->
<!--Mobile header begin-->
  <?php if($data['is_home'] == 'home'){ ?>
     <div class="container div-md-header-style hidden-sm hidden-md hidden-lg hidden-xl">
  <?php }else{ ?>
       <div class="container div-md-header-style1 hidden-sm hidden-md hidden-lg hidden-xl">
     <?php } ?>
          <div class="row no-margin">
            <div id="products_id_md" class="products-style no-padding div-products-mb-style col-xs-2">
              <img src="../../../catalog/view/theme/default/image/menu-bar.png">
            </div>
            <div class="col-xs-3">
              <div id="logo">
                <?php if ($logo) { ?>
                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                <?php } ?>
              </div>
            </div>
            <div class="col-xs-2 no-padding" style="text-align: right; float: right">
              <?php echo $cart; ?>
            </div>
            <div id="phone_id" class="col-xs-3  no-padding mb-div-phone-style" style="float: right">
              <img style="width: 42px;margin: -6px 0 0 0;" src="../../../catalog/view/theme/default/image/phone.png">
            </div>
          </div>
          <div id="id_phone" class="row hide-phone-div">
            <span class="mb-phone-style">
              <?php echo $telephone; ?>
            </span><span class="mb-phone-style">/</span>
            <span class="mb-phone-style">
              <?php echo $telephone2; ?>
            </span>
          </div>
          <div id="products_md" class="row " style="display: none">
            <div class=" container" style="text-align: center">
              <div class=" div-menu-mb-style" style="font-size: 25px; width: 100%;">
                <a href="/index.php?route=information/information&information_id=9"><span class="header-menu-text-style">Как купить?</span></a></br>
                <a href="/index.php?route=information/information&information_id=10"><span class="header-menu-text-style">Оплата</span></a></br>
                <a href="/index.php?route=information/information&information_id=6"><span class="header-menu-text-style">Доставка</span></a></br>
                <a href="/index.php?route=information/contact"><span class="header-menu-text-style">Контакты</span></a></br>
                <a href="/index.php?route=information/information&information_id=7"><span class="header-menu-text-style">География работы</span></a></br>
                <a href="/index.php?route=information/materialsAndPrices"><span class="header-menu-text-style">Материалы и цены</span></a></br>
              </div>
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <div class="product-div-title-style">
                <span class="products-title-style"><?php echo $category['name']; ?>
              </div>
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <span class="">
                  <?php foreach ($children as $child) { ?>
                      <span class=""><a class="products-category-style products-category-style_20" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span></br>
                  <?php } ?>
                </span>
              <?php } ?>
              </span>
              <?php } else { ?>
                <span class="products-category-style"><?php echo $category['name']; ?></span>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
        </div>
<!--Mobile header end-->
        <?php if($data['is_home'] == 'home'){ ?>
            <?php echo $slider; ?>
        <?php } ?>

</header>