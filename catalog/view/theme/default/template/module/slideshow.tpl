<div class="hidden-xs banner-div-text">
    <img class="banner-logo-size" src="../../../catalog/view/theme/default/image/sliderBanner.png" ></br>
    <span class="banner-text-style">
        интернер магазин креативных картин предлагает самые лучшие</br>
        и самые креативные картины в интернете по самым низким</br>
        ценам от производителя.</br>
        <a class="banner-linc-style" href="">Подробнее о нас<img src="../../../catalog/view/theme/default/image/bannerLinkIcon.png" style="width: 4%"></br></a>
    </span>
</div>
<div class="hidden-xs hidden-sm hidden-md hidden-lg hidden-xl banner-div-text">
    <img src="../../../catalog/view/theme/default/image/sliderBanner.png" style="width: 70%"></br>
    <span class="banner-text-style">
        интернер магазин креативных картин предлагает самые лучшие</br>
        и самые креативные картины в интернете по самым низким</br>
        ценам от производителя.</br>
        <a class="banner-linc-style" href="">Подробнее о нас<img src="../../../catalog/view/theme/default/image/bannerLinkIcon.png" style="width: 4%"></br></a>
    </span>
</div>

<div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1; margin: 0">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img  src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive slider-img-style" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	pagination: true
});
--></script>