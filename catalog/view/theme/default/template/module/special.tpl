<div class="hidden-xs">
<span style="color: #fff">wdwd</span>
</div>
<div class="row">
  <div id="masonry_hybrid_demo2">
    <div class="grid-sizer"></div>
    <div class="gutter-sizer"></div>
    <?php foreach ($products as $product) { ?>


    <div class="grid-item container_spanprod hidden-xs">
      <img src="<?php echo $product['thumb']; ?>"  style="width:100%;">
      <div class="conteiner_proz_2 spanprod ">
        <div class="conteiner_text_KP">
          <h4 style=" text-align: center;"><a class="pull-right_KP_3"
                                              href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          </h4>
          <div class="pull-right_KP_2-3">

          </div>
          <!--<h5 class="text_style_1_3" style="text-align: center"><?php echo $text_special; ?>
            <span class="text_style_price"><?php echo $product['special']; ?></span></h5> -->
        </div>
      </div>
    </div>
    <?php } ?>
  </div>

  <div class="row hidden-sm hidden-md hidden-lg">
    <?php foreach ($products as $product) { ?>
    <div class="img img2020" style="position: relative; margin-bottom: 8%; margin-top: 8%;">
      <img src="<?php echo $product['thumb']; ?>" style="width:75%;     margin-left: 13%;     min-height: 340px">

      <div class="conteiner_proz_3 hidden-sm hidden-md hidden-lg" style="margin-bottom: 55px;">
        <h4 style="    text-align: center; margin-top: 25px;"><a class="pull-right_KP_2 pull-right_KP_20"
                                                                 href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        </h4>
        <div class="pull-right_KP_2-1 pull-right_KP_20-120"
             style="border-bottom: 1px solid #fff; width: 100px; margin-left: 40%; margin-top: 4%;">

        </div>

      </div>
    </div>
    <?php } ?>
  </div>
  <script>
    $(document).ready(function() {
      $('.stocks').click(function () {
        var grid_demo_classic = $('#masonry_hybrid_demo2');
        var grid = new MasonryHybrid(grid_demo_classic, {col: 3, space: 30});
        grid.elem.trigger('grid:refresh', {col: 3, space: 30});
        setTimeout(function(){
          grid_demo_classic.show();
        }, 1000)
      });

      $(".grid-item"). hover(function (e) {
                var height = $(this).children('img').height();
                var width = $(this).children('img').width();
                $(this).children('.spanprod').css({width: width, height: height});
                $(this).children('.spanprod').show();

              },
              function(e){
                $(this).children('.spanprod').hide();
              });
      $(".row").outerWidth(true);
      if (outerWidth < 768){
        $('.stocks').click(function () {
          var grid_demo_classic = $('#masonry_hybrid_demo2');
          var grid = new MasonryHybrid(grid_demo_classic, {col: 1, space: 30});
          grid.elem.trigger('grid:refresh', {col: 1, space: 30});
          setTimeout(function(){
            grid_demo_classic.show();
          }, 1000)
        });
      }else{
        $('.stocks').click(function () {
          var grid_demo_classic = $('#masonry_hybrid_demo2');
          var grid = new MasonryHybrid(grid_demo_classic, {col: 3, space: 30});
          grid.elem.trigger('grid:refresh', {col: 3, space: 30});
          setTimeout(function(){
            grid_demo_classic.show();
          }, 1000)
        });
      }
    });

  </script>
</div>
