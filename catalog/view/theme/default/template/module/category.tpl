<div class="hidden-xs mod_category" style="width: 100%; min-height: 800px;">
    <div class="listcat">
        <ul class="customdrop ul-category-style" style="padding-left: 20px; margin: 0">
            <?php
    function outTree2($category, $level, $child_id, $cat_id, $level) {
        foreach($category as $cat){

            if(isset($cat['children'][0])){
?>
            <li class="li-category-style <?php if ($cat['category_id'] == $cat_id){ echo 'active'; }?>" style="list-style-type: none; text-indent: -11px;     margin-bottom: 22px;">
                <a class="clickParentMenu " title="<?php echo $cat['name'] ?>">
                    <div class="<?php if ($cat['category_id'] == $cat_id){ echo 'category-icon-style'; }else{echo 'category-icon-style_1';}?>"></div>
                    <span data-href="<?php echo $cat['href'] ?>" style="cursor:pointer;" class="clickCategoryName a-category-style">
                               </span></a><a class="a-category-style" href="<?php echo $cat['href'] ?>"><?php echo $cat['name'] ?></a>


                <ul class="dropDownSubMenu" style="padding: 0px; margin: 0px; display: <?php if ($cat['category_id'] == $cat_id){ echo 'block'; }else{echo 'none';}?>;">

                    <?
                outTree2($cat['children'], $level+1, $child_id, $cat_id, $level+1);
?>
                </ul>
            </li>
            <?php
            }else{
                if($level == 0){
            ?>
            <li class="li-category-child-style <?php if ($cat['category_id'] == $child_id){ echo 'sub_active'; }?>" style="list-style-type: none;     margin: 21px 0 10px 0;">
                <a href="<?php echo $cat['href'] ?>" class="a-category-style" tabindex="-1" title="<?php echo $cat['name'] ?>"><?php echo $cat['name'] ?></a>

            </li>
            <?php
                }else{
            ?>
            <li class="li-category-child-style <?php if ($cat['category_id'] == $child_id){ echo 'sub_active'; }?>" style="list-style-type: none;     margin: 21px 0 10px 0;">
                <a href="<?php echo $cat['href'] ?>" class="a-category-child-style" tabindex="-1" title="<?php echo $cat['name'] ?>"><?php echo $cat['name'] ?></a>

            </li>
            <?php
                }
            }
?>

            <?php
        }
    }
    ?>

            <?php
    outTree2($categories, 0, $child_id, $category_id, 0);/**/

    ?>
        </ul>
    </div>
</div>


<div class="hidden-sm hidden-md hidden-lg mod_category" style="width: 100%">
    <div class="menuname text-center category-name-padding " style="     margin: 6% 0 12px 0; border-bottom: 2px solid #e0deda; padding-bottom: 5%;" ><a class="Catalog catalog3">КАТАЛОГ</a></div>
    <div class="listcat">
        <ul class="customdrop ul-category-style" style="padding: 0; margin: 0;">
            <?php
    function outTree_mob($category, $level, $child_id, $cat_id, $level) {
        foreach($category as $cat){

            if(isset($cat['children'][0])){
?>
            <li class="li-category-style <?php if ($cat['category_id'] == $cat_id){ echo 'active'; }?>" style="list-style-type: none; text-indent: -11px;     margin-bottom: 22px;">
                <a class="clickParentMenu " title="<?php echo $cat['name'] ?>">
                    <div class="<?php if ($cat['category_id'] == $cat_id){ echo 'category-icon-style_mob'; }else{echo 'category-icon-style_mob_1';}?>"></div>
                    <span data-href="<?php echo $cat['href'] ?>" style="cursor:pointer;" class="clickCategoryName a-category-style">
                               </span></a><a class="a-category-style_mob a-category-style_mob23" href="<?php echo $cat['href'] ?>"><?php echo $cat['name'] ?></a>


                <ul class="dropDownSubMenu" style="padding: 0px; margin: 0px; display: <?php if ($cat['category_id'] == $cat_id){ echo 'block'; }else{echo 'none';}?>;">

                    <?
                outTree_mob($cat['children'], $level+1, $child_id, $cat_id, $level+1);
?>
                </ul>
            </li>
            <?php
            }else{
                if($level == 0){
            ?>
            <li class="li-category-child-style <?php if ($cat['category_id'] == $child_id){ echo 'sub_active'; }?>" style="list-style-type: none;     margin: 21px 0 10px 0;">
                <a href="<?php echo $cat['href'] ?>" class="a-category-child-style_mob style_mob20" tabindex="-1" title="<?php echo $cat['name'] ?>" style="margin-left: 3%;"><?php echo $cat['name'] ?></a>

            </li>
            <?php
                }else{
            ?>
            <li class="li-category-child-style <?php if ($cat['category_id'] == $child_id){ echo 'sub_active'; }?>" style="list-style-type: none;     margin: 21px 0 10px 0;">
                <a href="<?php echo $cat['href'] ?>" class="a-category-child-style_mob style_mob20" tabindex="-1" title="<?php echo $cat['name'] ?>"><?php echo $cat['name'] ?></a>

            </li>
            <?php
                }
            }
?>

            <?php
        }
    }
    ?>

            <?php
    outTree_mob($categories, 0, $child_id, $category_id, 0);/**/

    ?>
        </ul>
    </div>
</div>
<script>
    $(document).ready(function () {

        $('.Catalog').click(function() {
            $(".customdrop").toggle();
            $(this).toggleClass('ghhh');
        });

        $(".listcat"). hover(function (e) {
                var height = $(this).children().height();
                var width = $(this).children().width();
                $(this).children('.listcat').css({width: width, height: height});
                $(this).children('.listcat').show();
            },
            function (e) {
                $(this).children('.listcat').hide();
            });
        $(".mod_category").outerWidth(true);

        if (outerWidth > 767){
            $('#menu .dropdown-menu').each(function () {
                var menu = $('#menu').offset();
                var dropdown = $(this).parent().offset();

                var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

                if (i > 0) {
                    $(this).css('margin-left', '-' + (i + 5) + 'px');
                }
            });

            $(document).on('click', '.clickParentMenu', function () {
                $(this).parent().find('.dropDownSubMenu').toggle();

                if ($(this).parent().find('.category-icon-style_1').length) {
                    $(this).parent().find('.category-icon-style_1').addClass('category-icon-style');
                    $(this).parent().find('.category-icon-style').removeClass('category-icon-style_1');
                } else {
                    $(this).parent().find('.category-icon-style').addClass('category-icon-style_1');
                    $(this).parent().find('.category-icon-style_1').removeClass('category-icon-style');
                }
            });
        } else{
            $('#menu .dropdown-menu').each(function () {
                var menu = $('#menu').offset();
                var dropdown = $(this).parent().offset();

                var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

                if (i > 0) {
                    $(this).css('margin-right', '-' + (i + 5) + 'px');
                }
            });

            $(document).on('click', '.clickParentMenu', function () {
                $(this).parent().find('.dropDownSubMenu').toggle();

                if ($(this).parent().find('.category-icon-style_mob_1').length) {
                    $(this).parent().find('.category-icon-style_mob_1').addClass('category-icon-style_mob');
                    $(this).parent().find('.category-icon-style_mob').removeClass('category-icon-style_mob_1');
                } else {
                    $(this).parent().find('.category-icon-style_mob').addClass('category-icon-style_mob_1');
                    $(this).parent().find('.category-icon-style_mob_1').removeClass('category-icon-style_mob');
                }
            });
        }
    });
</script>
<style>
    .sub_active{
        list-style-type: none;
        background-color: #322d2d;
        font-family: 'Times New Roman';
        font-size: 14px;
        color: #fff!important;
        padding: 10px 0px 10px 20px;
        margin-left: -12px;
        margin-bottom: 20px;
        margin-top: 10px;
        margin-left: -14px !important;
    }
    .sub_active a,
    .sub_active a:hover{
        color:#fff!important;
    }
</style>