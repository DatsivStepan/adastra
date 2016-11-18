<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/mystels.css" rel="stylesheet">
<script src="catalog/view/javascript/header.js" type="text/javascript"></script>

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
</head>
<body class="<?php echo $class; ?>">
<div id="myModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Заголовок модального окна -->
      <div class="modal-header" style="border: 0">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      </div>
      <!-- Основное содержимое модального окна -->
      <div class="modal-body" style="text-align: center;">
        <div class="modal-title-style">MESSAGE</div>
        <div>
          <form id="contactForm" action="" method="post">
            <ul id="errorMasege" style="padding-left: 0">
              <span style="display: none; color: red" class="row name">Некоректно заполнено Имя пользователя</span>
              <span style="display: none; color: red" class="row email ">Некоректно заполнено Email</span>
              <span style="display: none; color: red" class="row message ">Минимальная длина сообщения десеть знаков</span>
            </ul>
            <div class="row modal-div-input-stile">
              <input class="modal-input-style contactItem" id="name" name="name" type="text" placeholder="NAME">
            </div>
            <div class="row modal-div-input-stile">
              <input class="modal-input-style contactItem" id="email" name="email" type="text" placeholder="EMAIL">
            </div>
            <div class="row modal-div-input-stile">
              <textarea  name="message" placeholder="MESSAGE" rows="5" id="message" class="contactItem modal-textarea-style"></textarea>
            </div>
            <button id="sendMessage" type="button" class="btn modal-btn-style">Send message</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<header>
  <!--Desktop header begin-->
  <?php if($data['is_home'] == 'home'){ ?>
      <div class="container div-header-style hidden-xs">
        <nav >
          <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2">
            <div id="logo">
              <?php if ($logo) { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
            </div>
          </div>
          <div id="products" class="products-style fa fa-bars  no-padding div-products-style">
            <span class="title header-text-style" style="padding-left: 5px">ПРОДУКЦИЯ <span id="product_1" class="fa fa-angle-down" style="font-size: 20px"></span></span>
          </div>
          <div id="products_id" class="row header-products-div-style">
            <div class=" container" style="">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 product-div-style">
                <div class="product-div-title-style">
              <span class="products-title-style"><?php echo $category['name']; ?>
                </div>
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <span class="">
              <?php foreach ($children as $child) { ?>
                  <span class=""><a class="products-category-style" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span></br>
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
          <div class=" div-menu-style">
            <a href="index.php?route=common/home"><span class="header-menu-text-style">Как купить?</span></a>
            <a href=""><span class="header-menu-text-style">Оплата</span></a>
            <a href=""><span class="header-menu-text-style">Доставка</span></a>
            <a href=""><span class="header-menu-text-style">Контакты</span></a>
            <a href=""><span class="header-menu-text-style">География работи</span></a>
            <a href=""><span class="header-menu-text-style">Материалы</span></a>
            <a href=""><span class="header-menu-text-style">Цены</span></a>
          </div>
          <?php echo $currency; ?>
          <?php echo $language; ?>
          <div class="div-phone-style">
            <div class="row">
              <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 no-padding">
                <img style="width: 20px" src="../../../catalog/view/theme/default/image/phone.png">
              </div>
              <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 no-padding">
                <span class="header-phone-style"><?php echo $telephone; ?></span>
              </div>
            </div>
            <div id="contact" class="row header-div-contact-style">
              <span class="header-contact-text-style-1">Обратный звонок</span></br>
              <span class="header-contact-text-style-2">We speak english</span>
            </div>
          </div>
          <div class="div-cart-style"><?php echo $cart; ?></div>
        </nav>
      </div>
    <!--Mobile header begin-->
      <div class="container div-md-header-style hidden-sm hidden-md hidden-lg hidden-xl">
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
        <div id="phone_id" class="col-xs-3  no-padding mb-div-phone-style">
          <img style="width: 22%" src="../../../catalog/view/theme/default/image/phone.png">
        </div>
        <div class="col-xs-3 no-padding" style="text-align: right">
          <?php echo $cart; ?>
        </div>
        </div>
        <div id="id_phone" class="row hide-phone-div">
          <span class="mb-phone-style">
            <?php echo $telephone; ?>
          </span>
        </div>
        <div id="products_md" class="row " style="display: none">
          <div class=" container" style="text-align: center">
            <div class=" div-menu-mb-style" style="font-size: 25px; width: 100%;">
              <a href="index.php?route=common/home"><span class="header-menu-text-style">Как купить?</span></a></br>
              <a href=""><span class="header-menu-text-style">Оплата</span></a></br>
              <a href=""><span class="header-menu-text-style">Доставка</span></a></br>
              <a href=""><span class="header-menu-text-style">Контакты</span></a></br>
              <a href=""><span class="header-menu-text-style">География работи</span></a></br>
              <a href=""><span class="header-menu-text-style">Материалы</span></a></br>
              <a href=""><span class="header-menu-text-style">Цены</span></a></br>
            </div>
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 product-div-style">
              <div class="product-div-title-style">
              <span class="products-title-style"><?php echo $category['name']; ?>
              </div>
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <span class="">
              <?php foreach ($children as $child) { ?>
                <span class=""><a class="products-category-style" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span></br>
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
    <!--Mobile header end-->
      <div class=""><?php echo $slider; ?></div>
  <?php }else{ ?>
      <div class="container div-header-style-1 hidden-xs">
        <nav >
          <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2">
            <div id="logo">
              <?php if ($logo) { ?>
              <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
              <?php } else { ?>
              <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
            </div>
          </div>
          <div id="products" class="products-style fa fa-bars  no-padding div-products-style">
            <span class="title header-text-style" style="padding-left: 5px">ПРОДУКЦИЯ <span id="product_1" class="fa fa-angle-down" style="font-size: 20px"></span></span>
          </div>
          <div id="products_id" class="row header-products-div-style">
            <div class=" container" style="">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 product-div-style">
                <div class="product-div-title-style">
              <span class="products-title-style"><?php echo $category['name']; ?>
                </div>
                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                <span class="">
              <?php foreach ($children as $child) { ?>
                  <span class=""><a class="products-category-style" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></span></br>
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
          <div class=" div-menu-style">
            <a href="index.php?route=common/home"><span class="header-menu-text-style">Как купить?</span></a>
            <a href=""><span class="header-menu-text-style">Оплата</span></a>
            <a href=""><span class="header-menu-text-style">Доставка</span></a>
            <a href=""><span class="header-menu-text-style">Контакты</span></a>
            <a href=""><span class="header-menu-text-style">География работи</span></a>
            <a href=""><span class="header-menu-text-style">Материалы</span></a>
            <a href=""><span class="header-menu-text-style">Цены</span></a>
          </div>
          <?php echo $currency; ?>
          <?php echo $language; ?>
          <div class="div-phone-style">
            <div class="row">
              <div class="col-sm-2 col-md-2 col-lg-2 col-xl-2 no-padding">
                <img style="width: 20px" src="../../../catalog/view/theme/default/image/phone.png">
              </div>
              <div class="col-sm-10 col-md-10 col-lg-10 col-xl-10 no-padding">
                <span class="header-phone-style"><?php echo $telephone; ?></span>
              </div>
            </div>
            <div id="contact" class="row header-div-contact-style">
              <span class="header-contact-text-style-1">Обратный звонок</span></br>
              <span class="header-contact-text-style-2">We speak english</span>
            </div>
          </div>
          <div class="div-cart-style"><?php echo $cart; ?></div>
        </nav>
      </div>
  <?php } ?>
  <!--Desktop header end-->

</header>



<!--<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>-->
