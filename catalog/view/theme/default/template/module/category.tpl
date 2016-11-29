<!--<div class="list-group hidden-xs" style="width: 100%">
    <?php foreach ($categories as $category) { ?>
    <?php if ($category['category_id'] == $category_id) { ?>
    <a href="<?php echo $category['href']; ?>" class="list-group-item active" style="border: none;
    background: #ffffff; font-family: 'Philosopher';
    font-size: 14px;  text-indent: -11px;">- <?php echo $category['name']; ?></a>
    <?php if ($category['children']) { ?>
    <?php foreach ($category['children'] as $child) { ?>
    <?php if ($child['category_id'] == $child_id) { ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item active" style="border: none;
    background: #322d2d;     color: #ffffff;font-family: 'Philosopher';
    font-size: 14px;">&nbsp; <?php echo $child['name']; ?></a>
    <?php } else { ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item" style="border: none;
    background: #ffffff;font-family: 'Philosopher';
    font-size: 14px;color: #322d2d">&nbsp; <?php echo $child['name']; ?></a>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php } else { ?>
    <a href="<?php echo $category['href']; ?>" class="list-group-item" style="border: none;font-family: 'Philosopher';
    font-size: 14px;color: #322d2d;     text-indent: -11px;">+ <?php echo $category['name']; ?></a>
    <?php } ?>
    <?php } ?>
</div>


<div class="listcat hidden-sm hidden-md hidden-lg">
    <div class="menuname text-center category-name-padding " style="     margin: 6% 0 12px 0; border-bottom: 2px solid #e0deda; padding-bottom: 5%;" ><a class="Catalog">КАТАЛОГ</a></div>
    <ul class="customdrop ul-category-style">
        <?php foreach ($categories as $category) { ?>
        <?php
                        $classes = '';
                        $display = 'display:none;';
                        $icon = ' category-icon-style_1 ';
                        if ($category['category_id'] == $category_id) {
                            $classes .= 'active';
                            $display = '';
                            $icon = ' category-icon-style ';
                        }
                    ?>

        <li class='<?= $classes; ?> li-category-style' style="list-style-type: none;     margin-top: -13px;">
            <a   class='clickParentMenu '  title="<?php echo $category['name'];?>">
                <div style=" border-top: 1px solid #e0deda; margin: 0 0 15px -37px">

                </div>
                <div class="<?= $icon; ?>"></div>
                            <span data-href="<?= $category['href']; ?>" style="cursor:pointer; " class="clickCategoryName category-style_KP">
                                <?php echo $category['name']; ?>
                            </span>
                <div class="container" style="border-bottom: 1px solid #e0deda; margin: 2% 0 2% -37px;"> </div>
            </a>
            <?php if($category['children']) { ?>
            <ul class="dropDownSubMenu" style='<?= $display; ?> ' >
                <?php
                                    foreach ($category['children'] as $child)
                                    {
                                ?>
                <div style="margin-bottom:  30px "></div>
                <li class="li-category-child-style" style="list-style-type: none;     margin-top: -13px;">
                    <?php if ($child['category_id'] == $child_id) { ?>
                    <a class="category-child-style_KP" href="<?php echo $child['href'];?>" tabindex="-1" title="<?php echo $child['name'];?>"><?php echo $child['name'];?></a>
                    <?php } else { ?>
                    <a href="<?php echo $child['href'];?>" class="category-child-style_KP" tabindex="-1" title="<?php echo $child['name'];?>"><?php echo $child['name'];?></a>
                    <?php } ?>
                </li>
                <div style="margin-bottom:  30px "></div>
                <?php } ?>

            </ul>
            <?php }  ?>
            <?php } ?>
    </ul>
</div>-->
<div class="hidden-xs" style="width: 100%">
    <div class="listcat">
        <ul class="customdrop ul-category-style" style="padding: 0; margin: 0">
            <?php foreach ($categories as $category) { ?>
            <?php
                        $classes = '';
                        $display = 'display:none;';
                        $icon = ' category-icon-style_1 ';
                        if ($category['category_id'] == $category_id) {
                            $classes .= 'active';
                            $display = '';
                            $icon = ' category-icon-style ';
                        }
                    ?>
            <li class='<?= $classes; ?> li-category-style'
                style="list-style-type: none; text-indent: -11px;     margin-bottom: 22px;">
                <a class='clickParentMenu ' title="<?php echo $category['name'];?>">
                    <div class="<?= $icon; ?>"></div>
                            <span data-href="<?= $category['href']; ?>" style="cursor:pointer;"
                                  class="clickCategoryName a-category-style">
                                <?php echo $category['name']; ?>
                            </span>
                </a>
                <?php if($category['children']) { ?>
                <ul class="dropDownSubMenu" style='<?= $display; ?>;  padding: 0; margin: 0'>
                    <?php
                                    foreach ($category['children'] as $child)
                                    {
                                ?>
                    <?php if ($child['category_id'] == $child_id) { ?>
                    <li class="li-category-child-style active" style="list-style-type: none;  background-color: #322d2d; font-family: 'Philosopher'; font-size: 14px;color: #fff!important;     padding: 10px 0px 10px 14px;
    margin-left: -12px; margin-bottom: 20px; margin-top: 10px ">

                        <a href="<?php echo $child['href'];?>" tabindex="-1" title="<?php echo $child['name'];?>"
                           class="a_text_KP"><?php echo $child['name'];?></a>
                    </li>
                    <?php } else { ?>
                    <li class="li-category-child-style" style="list-style-type: none;     margin: 21px 0 10px 0;">
                        <a href="<?php echo $child['href'];?>" class="a-category-child-style" tabindex="-1"
                           title="<?php echo $child['name'];?>"><?php echo $child['name'];?></a>

                    </li>
                    <?php } ?>
                    <?php } ?>
                </ul>
                <?php }  ?>
                <?php } ?>
        </ul>
    </div>
    <script>
        // Menu
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
    </script>
</div>