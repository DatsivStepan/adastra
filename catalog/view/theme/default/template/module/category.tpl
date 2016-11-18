<div class="list-group hidden-xs" style="border-right: 1px solid #cdc1aa;">
    <?php foreach ($categories as $category) { ?>
    <?php if ($category['category_id'] == $category_id) { ?>
    <a href="<?php echo $category['href']; ?>" class="list-group-item active" style="    border: none;
    background: #ffffff; font-family: 'Philosopher';
    font-size: 14px;">- <?php echo $category['name']; ?></a>
    <?php if ($category['children']) { ?>
    <?php foreach ($category['children'] as $child) { ?>
    <?php if ($child['category_id'] == $child_id) { ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item active" style="    border: none;
    background: #322d2d;     color: #ffffff;font-family: 'Philosopher';
    font-size: 14px;">&nbsp; <?php echo $child['name']; ?></a>
    <?php } else { ?>
    <a href="<?php echo $child['href']; ?>" class="list-group-item" style="    border: none;
    background: #ffffff;font-family: 'Philosopher';
    font-size: 14px;color: #322d2d">&nbsp; <?php echo $child['name']; ?></a>
    <?php } ?>
    <?php } ?>
    <?php } ?>
    <?php } else { ?>
    <a href="<?php echo $category['href']; ?>" class="list-group-item" style="    border: none;font-family: 'Philosopher';
    font-size: 14px;color: #322d2d">+ <?php echo $category['name']; ?></a>
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
    <script>
        $('#menu .dropdown-menu').each(function() {
            var menu = $('#menu').offset();
            var dropdown = $(this).parent().offset();

            console.log(dropdown);

            var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

            if (i > 0) {
                $(this).css('margin-left', '-' + (i + 5) + 'px');
            }
        });

        $(document).on('click','.clickParentMenu',function(){
            $(this).parent().find('.dropDownSubMenu').toggle();
        });

    </script>
</div>
