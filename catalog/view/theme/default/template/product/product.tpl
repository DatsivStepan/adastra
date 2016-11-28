<?php echo $header; ?>
<div class="container-pc1 container">
    <ul class="breadcrumb_contact hidden-xs  col-sm-12 col-md-12 col-lg-12">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if ($breadcrumb ['href']==('')){ ?>
        <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
        <?php }else{ ?>
        <li class="breadcrumb_text"
        ><a class="text" href="<?php echo $breadcrumb['href']; ?>"
            style="padding-right: 12px; background: url('../../../catalog/view/theme/default/image/strilka.png') right center no-repeat;"><?php echo $breadcrumb['text']; ?></a>
        </li>
        <?php } ?>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>" style="padding: 0;">
            <div class="row">
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <?php if ($thumb || $images) { ?>
                    <div class="product_image-pc thumbnails">
                        <?php if ($thumb) { ?>
                        <div class="my_cropper_container">
                            <input type="hidden" value="<?php echo $thumb; ?>">
                            <img class="main_image" id="image" src="<?php echo $thumb; ?>">
                        </div>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <div class="deliveryBox">
                        <p class="deliveryBoxTitle">Доставка:</p>
                        <p>
                        <table>
                            <tr>
                                <td class="deliveryBoxTitle" style="width: 75%;">Доставка по Москве:</td>
                                <td>500 руб.</td>
                            </tr>
                            <tr>
                                <td class="deliveryBoxTitle" style="width: 75%;">За МКАД:</td>
                                <td>+20 руб./км.</td>
                            </tr>
                        </table>
                        </p>
                        <p>Бесплатная доставка по Москве и области при покупке от 20 000 рублей. Доставка до
                            транспортной компании “Байкал” и транспортной компании “Деловые линии” бесплатно</p>

                    </div>
                </div>
                <?php if ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <h1 class="productTitle"><?php echo $heading_title; ?></h1>
                    <div class="product_description-pc">
                        <div>
                            <?php echo $description; ?>
                        </div>
                    </div>

                    <?php if ($price) { ?>
                    <div class="list-unstyled">
                        <?php if (!$special) { ?>
                        <h2 class="productPrice">Цена: <?php echo $price; ?></h2>
                        <?php } else { ?>
                        <h2 class="productPrice">Цена: <?php echo $special; ?></h2>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <?php //var_dump($attribute_groups);?>
                    <?php
                        $height = 0;
                        $width  = 0;
                    ?>
                    <div id="product" style="width: 100%;">
                        <input type="hidden" name="quantity" value="<?php echo $minimum; ?>" size="2"
                               id="input-quantity" class="form-control"/>
                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                        <button class="clickToBuy">
                            <p>Заказать в<br>один клик</p>
                        </button>
                        <button type="button" class="addToCart" id="button-cart">
                            <p>В корзину</p>
                        </button>
                    </div>
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <?php
                            foreach ($attribute_group['attribute'] as $attribute) {
                                if(mb_strtolower($attribute['name'])=="высота"){
                                   $height = intval($attribute['text']);
                                }
                                if(mb_strtolower($attribute['name'])=="ширина"){
                                   $width = intval($attribute['text']);
                                }
                             }
                             ?>
                    <?php } ?>
                    <!-- OPTIONS HERE-->
                    <div class="optionsContainer" id="product">
                        <?php if ($options) { ?>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                    id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                    <?php } ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'покрытие':
                        ?>
                        <div style="width: 48%; float: right;"
                             class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <div class="underframeContainer">
                                    <?php
                                    $option_value = $option['product_option_value'][0];
                                    ?>
                                    <label class="underframeSecondary">
                                        <input type="radio"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                    </label>
                                    <?php
                                    $option_value = $option['product_option_value'][1];
                                    ?>
                                    <label class="underframeSecondary">
                                        <input type="radio"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <?php
                                break;
                                default:
                         ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                        }
                        ?>
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'подрамник':
                        ?>
                        <div style="width: 48%; float: left;"
                             class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <div class="underframeContainer">
                                    <?php
                                    $option_value = $option['product_option_value'][0];
                                    ?>
                                    <label class="underframeMain">
                                        <input type="radio"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                    </label>
                                    <?php
                                    $option_value = $option['product_option_value'][1];
                                    ?>
                                    <label class="underframeSecondary">
                                        <input type="radio"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                    </label>
                                    <?php
                                    $option_value = $option['product_option_value'][2];
                                    ?>
                                    <label class="underframeSecondary">
                                        <input type="radio"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <?php
                                break;
                                default:
                         ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"
                                               name="option[<?php echo $option['product_option_id']; ?>][]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                        }?>

                        <?php } ?>
                        <!-- CUSTOM IMAGE OPTION START (рама, цвет) -->
                        <?php if ($option['type'] == 'image') { ?>
                        <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'цвет':
                                ?>
                        <div class="colorBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <div class="smallTitleBox">Цвет</div>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="colorBox">
                                    <label class="my-custom-label"
                                           id="option[<?php echo $option_value['product_option_value_id']; ?>]">
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <span style="background-image: url(<?php echo $option_value['image']; ?>); background-size: cover;"></span>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                                break;
                            case 'рама':
                               ?>
                        <div class="frameBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <div style="min-height: 50px;" class="smallTitleBox">Рама</div>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="frameBox">
                                    <label class="my-custom-labelFrame">
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <span style="background-image: url(<?php echo $option_value['image']; ?>); background-size: cover;"></span>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                                break;
                            case 'фактура':
                        ?>
                        <div class="textureContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <div class="textureTitle">Фактура</div>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="">
                                    <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <span class="textureSelector"
                                              txtSrc="<?php echo $option_value['image']; ?>"><?php echo $option_value['name'] ?></span>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                            break;
                            default:
                               ?>
                        <div class="frameBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                        <img src="<?php echo $option_value['image']; ?>"
                                             alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                             class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
                                        )
                                        <?php } ?>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php
                        }
                        ?>
                        <?php } ?>
                        <!-- CUSTOM IMAGE OPTION END (рама, цвет) -->
                        <!-- SIZE OPTION START -->
                        <?php if ($option['type'] == 'text') { ?>
                        <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'высота':
                                ?>
                        <div class="sliderContainer">
                            <div id="hSlider"></div>
                            <div class="leftRullerCutter"></div>
                            <div class="leftRullerValue" id="minHeight">1</div>
                            <div class="rightRullerCutter"></div>
                            <div class="rightRullerValue" id="maxHeight"><?php echo $height ?></div>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php
                                break;
                            case 'ширина':
                                ?>
                        <div class="sliderContainer">
                            <div id="wSlider"></div>
                            <div class="leftRullerCutter"></div>
                            <div class="leftRullerValue" id="minWidth">1</div>
                            <div class="rightRullerCutter"></div>
                            <div class="rightRullerValue" id="maxWidth"><?php echo $width ?></div>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php
                                break;
                                case 'вертикальное смещение':
                                ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php
                                break;
                                case 'горизонтальное смещение':
                                ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php
                                break;
                            default:
                                ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                   value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                                   id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"/>
                        </div>
                        <?php
                                break;
                        }
                        ?>
                        <?php } ?>
                        <!-- SIZE OPTION END -->
                        <?php if ($option['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                                      placeholder="<?php echo $option['name']; ?>"
                                      id="input-option<?php echo $option['product_option_id']; ?>"
                                      class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                    data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
                                <i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                                   id="input-option<?php echo $option['product_option_id']; ?>"/>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group date">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group datetime">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"
                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group time">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                                       value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                       class="form-control"/>
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span>
                            </div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($recurrings) { ?>
                        <hr>
                        <h3><?php echo $text_payment_recurring ?></h3>
                        <div class="form-group required">
                            <select name="recurring_id" class="form-control">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($recurrings as $recurring) { ?>
                                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block" id="recurring-description"></div>
                        </div>
                        <?php } ?>
                        <div class="form-group">

                        </div>
                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <?php echo $content_top; ?>
        </div>

        <?php echo $content_bottom; ?>
        <?php echo $column_right; ?>
    </div>

    <script type="text/javascript"><!--
        $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
            $.ajax({
                url: 'index.php?route=product/product/getRecurringDescription',
                type: 'post',
                data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
                dataType: 'json',
                beforeSend: function () {
                    $('#recurring-description').html('');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();
                    if (json['success']) {
                        $('#recurring-description').html(json['success']);
                    }
                }
            });
        });
        //--></script>
    <script type="text/javascript"><!--
        $('#button-cart').on('click', function () {
            $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                dataType: 'json',
                beforeSend: function () {
                    $('#button-cart').button('loading');
                },
                complete: function () {
                    $('#button-cart').button('reset');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();
                    $('.form-group').removeClass('has-error');
                    if (json['error']) {
                        if (json['error']['option']) {
                            for (i in json['error']['option']) {
                                var element = $('#input-option' + i.replace('_', '-'));
                                if (element.parent().hasClass('input-group')) {
                                    element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                } else {
                                    element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                }
                            }
                        }
                        if (json['error']['recurring']) {
                            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                        }
                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    }
                    if (json['success']) {
                        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);
                        $('html, body').animate({scrollTop: 0}, 'slow');
                        $('#cart > ul').load('index.php?route=common/cart/info ul li');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
        //--></script>
    <script type="text/javascript"><!--
        $('.date').datetimepicker({
            pickTime: false
        });
        $('.datetime').datetimepicker({
            pickDate: true,
            pickTime: true
        });
        $('.time').datetimepicker({
            pickDate: false
        });
        $('button[id^=\'button-upload\']').on('click', function () {
            var node = this;
            $('#form-upload').remove();
            $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
            $('#form-upload input[name=\'file\']').trigger('click');
            if (typeof timer != 'undefined') {
                clearInterval(timer);
            }
            timer = setInterval(function () {
                if ($('#form-upload input[name=\'file\']').val() != '') {
                    clearInterval(timer);
                    $.ajax({
                        url: 'index.php?route=tool/upload',
                        type: 'post',
                        dataType: 'json',
                        data: new FormData($('#form-upload')[0]),
                        cache: false,
                        contentType: false,
                        processData: false,
                        beforeSend: function () {
                            $(node).button('loading');
                        },
                        complete: function () {
                            $(node).button('reset');
                        },
                        success: function (json) {
                            $('.text-danger').remove();
                            if (json['error']) {
                                $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                            }
                            if (json['success']) {
                                alert(json['success']);
                                $(node).parent().find('input').attr('value', json['code']);
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            }, 500);
        });
        //--></script>
    <script type="text/javascript"><!--
        $('#review').delegate('.pagination a', 'click', function (e) {
            e.preventDefault();
            $('#review').fadeOut('slow');
            $('#review').load(this.href);
            $('#review').fadeIn('slow');
        });
        $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
        $('#button-review').on('click', function () {
            $.ajax({
                url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                type: 'post',
                dataType: 'json',
                data: $("#form-review").serialize(),
                beforeSend: function () {
                    $('#button-review').button('loading');
                },
                complete: function () {
                    $('#button-review').button('reset');
                },
                success: function (json) {
                    $('.alert-success, .alert-danger').remove();
                    if (json['error']) {
                        $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }
                    if (json['success']) {
                        $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
                        $('input[name=\'name\']').val('');
                        $('textarea[name=\'text\']').val('');
                        $('input[name=\'rating\']:checked').prop('checked', false);
                    }
                }
            });
        });
        $(document).ready(function () {
            $('.thumbnails').magnificPopup({
                type: 'image',
                delegate: 'a',
                gallery: {
                    enabled: true
                }
            });
        });
        //--></script>
    <?php echo $footer; ?>