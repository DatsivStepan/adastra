<footer style="padding-bottom: 10px">
  <div class=" hidden-xs">
      <div class="container">
          <div class="footer-bottom-div-style row ">
            <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <?php if ($logo) { ?>
                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                <?php } ?>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 footer-bottom-text-padding ">
                <span class="footer-bottom-text-style footer-bottom-text-padding_20">&#169; 2008-2016. Галерея адастра Все права защищены.</span>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 footer-bottom-text-padding" style="text-align: right;">
                <span class="footer-bottom-text-style">Разработано в <span style="text-decoration: underline">Рекламотерапия</span></span>
            </div>
          </div>
          </div>
      </div>
  </div>

    <div class=" hidden-sm hidden-md hidden-lg hidden-xl">
        <div class="container">
                <div class="footer-bottom-div-style  ">
                    <div class="">
                        <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>"><img style="margin: 0 auto;" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                        <?php } else { ?>
                        <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                        <?php } ?>
                    </div>
                    <div class=" footer-bottom-text-padding">
                        <span class="footer-bottom-text-style">&#169; 2016. Галерея адастра Все права защищены.</span>
                    </div>
                    <div class=" footer-bottom-text-padding">
                        <span class="">Разработано в <span style="text-decoration: underline">Рекламотерапия</span></span>
                    </div>
                </div>
        </div>
    </div>

</footer>
</body></html>