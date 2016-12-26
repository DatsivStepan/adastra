<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>
<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" media="screen" />

<div class="hidden-xs banner-div-text">
    <div class="banner-div-main">
        <div class="desktop-img-div-style desktop-img-div-style_20"><img class="banner-logo-size banner-logo-size_20" src="../../../catalog/view/theme/default/image/sliderBanner.png" style="width: 100%" ></br></div>
        <div class="desktop-text-div-style desktop-text-div-style_20">
            <span class="banner-text-style">
                Интернет магазин креативных картин предлагает самые лучшие</br>
                и самые креативные картины в интернете по самым низким</br>
                ценам от производителя.</br>
                <a class="banner-linc-style" href="/index.php?route=information/information&information_id=4">Подробнее о нас<img src="../../../catalog/view/theme/default/image/bannerLinkIcon.png" style="width: 4%"></br></a>
            </span>
        </div>
    </div>
</div>
<div class="hidden-sm hidden-md hidden-lg hidden-xl mobile-banner-div-style">
    <div class="banner-div-main">
        <div class="mobile-img-div-style"><img src="../../../catalog/view/theme/default/image/sliderBanner.png" style="width: 270px;"></div>
        <div class="mobile-text-div-style">
            <span class="mobile-banner-text-style">
                Интернет магазин креативных картин предлагает самые лучшие
                и самые креативные картины в интернете по самым низким
                ценам от производителя.
            </span>
        </div>
    </div>
</div>

<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1; margin: 0">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
        <?php } else { ?>
        <img  src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive slider-img-style img-responsive img-responsive_20 slider-img-style_20" />
        <?php } ?>
    </div>
    <?php } ?>
</div>

<script type="text/javascript"><!--

    $(document).ready(function(){
        $('#slideshow<?php echo $module; ?>').owlCarousel({
            items: 6,
            autoPlay: 3000,
            singleItem: true,
            pagination: true
        });
    })
    --></script>