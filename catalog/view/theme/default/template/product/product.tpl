<?php echo $header; ?>
<?

    $MAX_CROPPER_WIDTH  = 50;
    $MAX_CROPPER_HEIGHT = 50;

?>
<div class="container-pc1 container">
    <ul class="breadcrumb_product hidden-xs  col-sm-12 col-md-12 col-lg-12">
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
    <div class="container KP">
        <div class="KP_20_2">
            <?php echo $column_left; ?>
        </div>
        <div class="container KP_80_2">
            <div class="container productContainer">
                <input type="hidden" id="serverName" value="<?php echo(HTTPS_SERVER) ?>">
                <?php
                    $height = 0;
                    $width  = 0;
                    foreach ($attribute_groups as $attribute_group) {
                            foreach ($attribute_group['attribute'] as $attribute) {
                                if(mb_strtolower($attribute['name'])=="высота"){
                                    $height = intval($attribute['text']);
                                }
                                if(mb_strtolower($attribute['name'])=="ширина"){
                                    $width = intval($attribute['text']);
                            }
                        }
                    }
                ?>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-6 col-xl-6">
                    <div class="productDescriptionBox hidden-sm hidden-md hidden-lg hidden-xl">
                        <h1 class="productTitle"><?php echo $heading_title; ?></h1>
                        <h2 style="display: none;"> Автор </h2>
                        <div class="product_description-pc">
                            <div>
                                <?php echo $description; ?>
                            </div>
                        </div>
                    </div>
                    <div class="fixed">
                        <div class="productImageBox">
                            <?php if ($thumb || $images) { ?>
                            <div id="product_image-pc" class="thumbnails">

                                <?php if ($thumb) { ?>
                                <div id="frame">
                                    <div class="n  frameSide">
                                        <div class="nbefore"></div>
                                    </div>
                                    <div class="ne frameSide"></div>
                                    <div class="e  frameSide"></div>
                                    <div class="se frameSide"></div>
                                    <div class="s  frameSide">
                                        <div class="sbefore"></div>
                                    </div>
                                    <div class="sw frameSide"></div>
                                    <div class="w  frameSide"></div>
                                    <div class="nw frameSide"></div>

                                    <div id="picture">
                                        <input type="hidden" value="<?php echo $thumb; ?>">
                                        <img class="main_image" id="image" src="<?php echo $thumb; ?>" realWidth="<?php echo $width; ?>" realHeight="<?php echo $height; ?>">
                                    </div>
                                </div>
                                <?php } ?>

                            </div>
                            <?php } ?>

                            <div class="productDeliveryBox xs-hidden">
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
                                    транспортной компании “Байкал”.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-6 col-xl-6">
                <div class="productDescriptionBox hidden-xs">
                    <h1 class="productTitle"><?php echo $heading_title; ?></h1>
                    <h2 style="display: none;"> Автор </h2>
                    <div class="product_description-pc">
                        <div>
                            <?php echo $description; ?>
                        </div>
                    </div>
                </div>
                <div class="productPriceBox xs-hidden">
                    <?php if ($price) { ?>
                    <div class="list-unstyled">
                        <?php if (!$special) { ?>
                        <h2 class="productPrice">Цена: <?php echo $price; ?></h2>
                        <?php } else { ?>
                        <h2 class="productPrice">Цена: <?php echo $special; ?></h2>
                        <?php } ?>
                    </div>
                    <?php } ?>

                </div>

                <div class="productBuyButtonsBox xs-hidden">
                    <div id="product" style="width: 100%;margin: 25px 0 20px 0;">
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
                </div>

                <!-- OPTIONS HERE-->
                <div class="optionsContainer" id="product">
                    <?php if ($options) { ?>
                    <?php foreach ($options as $option) { ?>
                    <?php if ($option['type'] == 'select') { ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"
                               for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                        <select name="option[<?php echo $option['product_option_id']; ?>]"
                                id="<?php echo $option['name']; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <option value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
                                <?php if ($option_value['price']) { ?>
                                (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
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
                                <label class="underframeMain">Покрытие :</label>
                                <?php
                                    $option_value = $option['product_option_value'][0];
                                    ?>
                                <label class="underframeSecondary">
                                    <input type="radio"
                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-coating="true"
                                    />
                                    <?php echo $option_value['name']; ?>
                                </label>
                                <?php
                                    $option_value = $option['product_option_value'][1];
                                    ?>
                                <label class="underframeSecondary">
                                    <input type="radio"
                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-coating="false"
                                    />
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
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>
                                    <?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
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
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-subframe="none"
                                    />
                                    <?php echo $option_value['name']; ?>
                                </label>
                                <?php
                                    $option_value = $option['product_option_value'][1];
                                    ?>
                                <label class="underframeSecondary">
                                    <input type="radio"
                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-subframe="big"
                                    />
                                    <?php echo $option_value['name']; ?>
                                </label>
                                <?php
                                    $option_value = $option['product_option_value'][2];
                                    ?>
                                <label class="underframeSecondary">
                                    <input type="radio"
                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-subframe="small"
                                    />
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
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>
                                    <?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
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
                    <div tooltip='Цветопередача вашего монитора может отличаться от заявленной'
                         class="colorBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <div class="smallTitleBox">
                            <p>Цвет</p>
                            <p><i class="fa fa-refresh" id="clearFilters" aria-hidden="true"></i></p>
                        </div>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="colorBox">
                                <label class="my-custom-label"
                                       id="<?php echo $option_value['name']; ?>">

                                    <input type="radio" class="colorSelector" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>

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
                            <div class="frameBox frameSelector" txtSrc="<?php echo $option_value['image']; ?>">
                                <label class="my-custom-labelFrame">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           data-frame="true" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>
                                    <span style="background-image: url(<?php echo $option_value['image']; ?>); background-size: cover;"></span>
                                </label>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <?php
                                break;
                            case 'крепление':
                               ?>
                    <div class="frameBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <div style="min-height: 50px;" class="smallTitleBox">Крепления</div>
                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="frameBox">
                                <label class="my-custom-labelFrame">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>
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
                        <div id="input-option<?php echo $option['product_option_id']; ?>"  style="padding: 10px;">
                            <?php
                            $i = 0;
                            foreach ($option['product_option_value'] as $option_value) {
                                if($i == 0){
                                ?>
                            <div class="">
                                <label class="textureSelector"
                                       txtSrc="<?php echo $option_value['image']; ?>">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" checked
                                           data-texture="true"
                                           textureWidth="320"
                                           textureHeight="900"
                                    />
                                    <span><?php echo $option_value['name'] ?></span>
                                </label>
                            </div>

                                <?php
                                }else{
                                ?>
                            <div class="">
                                <label class="textureSelector"
                                       txtSrc="<?php echo $option_value['image']; ?>">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-texture="true"
                                           textureWidth="1000"
                                           textureHeight="2000"
                                    />
                                    <span><?php echo $option_value['name'] ?></span>
                                </label>
                            </div>
                                <?php
                                }


                            ?>
                            <?php
                            $i++;
                            } ?>
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
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"/>
                                    <img src="<?php echo $option_value['image']; ?>"
                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                         class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price']) { ?>
                                    (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>
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
                    <!-- CUSTOM OPTION START (текстура, рама) -->
                    <?php
                    if ($option['type'] == 'custom') { ?>
                    <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'фактура':
                                ?>
                    <div class="textureContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <div class="textureTitle">Фактура</div>
                        <div id="input-option<?php echo $option['product_option_id']; ?>"  style="padding: 10px;">
                            <?php
                            $i = 0;
                            foreach ($option['product_option_value'] as $option_value) {
                                if($i == 0){
                                ?>
                            <div class="">
                                <label class="textureSelector"
                                       txtSrc="<?php echo $option_value['image']; ?>">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>" checked
                                           data-texture="true"
                                           textureWidth="<?php echo $option_value['field1']; ?>"
                                           textureHeight="<?php echo $option_value['field2']; ?>"
                                    />
                                    <span><?php echo $option_value['name'] ?></span>
                                </label>
                            </div>

                            <?php
                                }else{
                                ?>
                            <div class="">
                                <label class="textureSelector"
                                       txtSrc="<?php echo $option_value['image']; ?>">
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                           value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                           data-texture="true"
                                           textureWidth="<?php echo $option_value['field1']; ?>"
                                           textureHeight="<?php echo $option_value['field2']; ?>"
                                    />
                                    <span><?php echo $option_value['name'] ?></span>
                                </label>
                            </div>
                            <?php
                                }


                            ?>
                            <?php
                            $i++;
                            } ?>
                        </div>
                    </div>
                    <?php
                            break;
                            case 'рама':
                            ?>
                    <div class="frameBoxContainer form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <div class="col-lg-1 no-padding">
                            <div style="min-height: 50px;" class="smallTitleBox">Рама</div>
                        </div>
                        <div class="col-lg-11 no-padding"  style="padding-left: 15px">
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="frameBox frameSelector" txtSrc="<?php echo $option_value['image']; ?>">
                                    <label class="my-custom-labelFrame">
                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]"
                                               data-frame="true" value="<?php echo $option_value['product_option_value_id']; ?>" data-points="<?php echo (isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>" data-prefix="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price_value']; ?>"
                                               data-wframe="<?php echo $option_value['field1']; ?>"
                                        />
                                        <span style="background-image: url(<?php echo $option_value['image']; ?>); background-size: cover;"></span>
                                    </label>
                                </div>
                                <?php } ?>
                            </div>
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
                    <div id="product_description-pc">Без стыков <input type="checkbox" id="maxCropperSize"
                                                                 data-height=""
                                                                 data-width="" ><span></span>
                    </div>
                    <div id="hSliderContainer"
                         class="sliderContainer">
                        <div class="product_description-pc">Высота полотна (см):</div>
                        <div id="hSlider"></div>
                        <div class="leftRullerCutter"></div>
                        <div class="leftRullerValue" id="minHeight">1</div>
                        <div class="rightRullerCutter"></div>
                        <div class="rightRullerValue" id="maxHeight"></div>
                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                               id="<?php echo $option['name']; ?>" class="form-control"/>

                        <div id="hHint">

                        </div>
                    </div>
                    <?php
                                break;
                            case 'ширина':
                                ?>
                    <div id="wSliderContainer"
                         class="sliderContainer">
                        <div class="product_description-pc">Ширина полотна (см):</div>
                        <div id="wSlider"></div>
                        <div class="leftRullerCutter"></div>
                        <div class="leftRullerValue" id="minWidth">1</div>
                        <div class="rightRullerCutter"></div>
                        <div class="rightRullerValue" id="maxWidth"></div>
                        <input type="text" style="margin-bottom:15px " name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                               id="<?php echo $option['name']; ?>" class="form-control"/>
                        <div id="wHint">

                        </div>

                    </div>
                    <?php
                                break;
                                case 'вертикальноесмещение':
                                ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                               id="<?php echo $option['name']; ?>" class="form-control"/>
                    </div>
                    <?php
                                break;
                                case 'горизонтальноесмещение':
                                ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]"
                               value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                               id="<?php echo $option['name']; ?>" class="form-control"/>
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
                    <?php
                        switch (mb_strtolower($option['name'])) {
                            case 'фотография':
                    ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
                            <i class="fa fa-upload"></i> Загрузить фото</button>
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                    </div>
                    <?php
                                break;
                            default:
                    ?>
                    <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                        <label class="control-label"><?php echo $option['name']; ?></label>
                        <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                                data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block">
                            <i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                               id="input-option<?php echo $option['product_option_id']; ?>"/>
                    </div>
                    <?php
                             break;
                                }
                    ?>
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
                <div class="productPriceBox sm-hidden" style="margin-top: 10px">
                    <?php if ($price) { ?>
                    <div class="list-unstyled">
                        <?php if (!$special) { ?>
                        <h2 class="productPrice">Цена: <?php echo $price; ?></h2>
                        <?php } else { ?>
                        <h2 class="productPrice">Цена: <?php echo $special; ?></h2>
                        <?php } ?>
                    </div>
                    <?php } ?>
                </div>

                <div class="productBuyButtonsBox sm-hidden">
                    <div id="product" style="width: 100%;margin: 25px 0 20px 0;">
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
                </div>

                <div class="productDeliveryBox sm-hidden">
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
                        транспортной компании “Байкал”.</p>
                </div>

            </div>
        </div>
    </div>
    <div class="stopFixed">
        <div class="row no-margin">
            <?php echo $content_top; ?>
        </div>
        <div class="row no-margin">
            <?php echo $content_bottom; ?>
        </div>
        <div class="row no-margin">
            <?php echo $column_right; ?>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    $(document).ready(function () {
        console.log($(window).width());

      if($(window).width() >= 768 ){
        var offset = $('.fixed').offset();
        var stopOffset = $('.stopFixed').offset();
        var topPadding = -20;
        $(window).scroll(function() {
            if ($(window).scrollTop() > offset.top && $(window).scrollTop() <= stopOffset.top - 680) {
                $('.fixed').stop().animate({marginTop: $(window).scrollTop() - offset.top + topPadding});
            }
            else if($(window).scrollTop() < offset.top){
                $('.fixed').stop().animate({marginTop: 0});
            }else if($(window).scrollTop() > stopOffset.top - 680){
                $('.fixed').stop().animate({marginTop: stopOffset.top - 680});
            }
        });
      }
    });
--></script>
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
<script type="text/javascript"><!--
function price_format(price)
{ 
    c = <?php echo (empty($autocalc_currency['decimals']) ? "0" : $autocalc_currency['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo str_replace("'", "\'", $autocalc_currency['symbol_left']); ?>';
    s_right = '<?php echo str_replace("'", "\'", $autocalc_currency['symbol_right']); ?>';
    n = price * <?php echo $autocalc_currency['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text = s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right; 
    
    <?php if (!empty($autocalc_currency2)) { ?>
    c = <?php echo (empty($autocalc_currency2['decimals']) ? "0" : $autocalc_currency2['decimals'] ); ?>;
    d = '<?php echo $autocalc_currency2['decimal_point']; ?>'; // decimal separator
    t = '<?php echo $autocalc_currency2['thousand_point']; ?>'; // thousands separator
    s_left = '<?php echo str_replace("'", "\'", $autocalc_currency2['symbol_left']); ?>';
    s_right = '<?php echo str_replace("'", "\'", $autocalc_currency2['symbol_right']); ?>';
    n = price * <?php echo $autocalc_currency2['value']; ?>;
    i = parseInt(n = Math.abs(n).toFixed(c)) + ''; 
    j = ((j = i.length) > 3) ? j % 3 : 0; 
    price_text += '  <span class="currency2">(' + s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right + ')</span>'; 
    <?php } ?>
    
    return price_text;
}

function calculate_tax(price)
{
    <?php // Process Tax Rates
      if (isset($tax_rates) && $tax) {
         foreach ($tax_rates as $tax_rate) {
           if ($tax_rate['type'] == 'F') {
             echo 'price += '.$tax_rate['rate'].';';
           } elseif ($tax_rate['type'] == 'P') {
             echo 'price += (price * '.$tax_rate['rate'].') / 100.0;';
           }
         }
      }
    ?>
    return price;
}

function process_discounts(price, quantity)
{
    <?php
      foreach ($dicounts_unf as $discount) {
        echo 'if ((quantity >= '.$discount['quantity'].') && ('.$discount['price'].' < price)) price = '.$discount['price'].';'."\n";
      }
    ?>
    return price;
}


animate_delay = 20;

main_price_final = calculate_tax(<?php echo $price_value; ?>);
main_price_start = calculate_tax(<?php echo $price_value; ?>);
main_step = 0;
main_timeout_id = 0;

function animateMainPrice_callback() {
    main_price_start += main_step;
    
    if ((main_step > 0) && (main_price_start > main_price_final)){
        main_price_start = main_price_final;
    } else if ((main_step < 0) && (main_price_start < main_price_final)) {
        main_price_start = main_price_final;
    } else if (main_step == 0) {
        main_price_start = main_price_final;
    }
    
    $('.autocalc-product-price').html( price_format(main_price_start) );
    
    if (main_price_start != main_price_final) {
        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
    }
}

function animateMainPrice(price) {
    main_price_start = main_price_final;
    main_price_final = price;
    main_step = (main_price_final - main_price_start) / 10;
    
    clearTimeout(main_timeout_id);
    main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
}


<?php if ($special) { ?>
special_price_final = calculate_tax(<?php echo $special_value; ?>);
special_price_start = calculate_tax(<?php echo $special_value; ?>);
special_step = 0;
special_timeout_id = 0;

function animateSpecialPrice_callback() {
    special_price_start += special_step;
    
    if ((special_step > 0) && (special_price_start > special_price_final)){
        special_price_start = special_price_final;
    } else if ((special_step < 0) && (special_price_start < special_price_final)) {
        special_price_start = special_price_final;
    } else if (special_step == 0) {
        special_price_start = special_price_final;
    }
    
    $('.autocalc-product-special').html( price_format(special_price_start) );
    
    if (special_price_start != special_price_final) {
        special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
    }
}

function animateSpecialPrice(price) {
    special_price_start = special_price_final;
    special_price_final = price;
    special_step = (special_price_final - special_price_start) / 10;
    
    clearTimeout(special_timeout_id);
    special_timeout_id = setTimeout(animateSpecialPrice_callback, animate_delay);
}
<?php } ?>


function recalculateprice()
{
    var main_price = <?php echo (float)$price_value; ?>;
    var input_quantity = Number($('input[name="quantity"]').val());
    var special = <?php echo (float)$special_value; ?>;
    var tax = 0;
    discount_coefficient = 1;
    
    if (isNaN(input_quantity)) input_quantity = 0;
    
    <?php if ($special) { ?>
        special_coefficient = <?php echo ((float)$price_value/(float)$special_value); ?>;
    <?php } else { ?>
        <?php if (empty($autocalc_option_discount)) { ?>
            main_price = process_discounts(main_price, input_quantity);
            tax = process_discounts(tax, input_quantity);
        <?php } else { ?>
            if (main_price) discount_coefficient = process_discounts(main_price, input_quantity) / main_price;
        <?php } ?>
    <?php } ?>
    
    
    var option_price = 0;
    
    <?php if ($points) { ?>
      var points = <?php echo (float)$points_value; ?>;
      $('input:checked,option:selected').each(function() {
          if ($(this).data('points')) points += Number($(this).data('points'));
      });
      $('.autocalc-product-points').html(points);
    <?php } ?>
    
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '=') {
        option_price += Number($(this).data('price'));
        main_price = 0;
        special = 0;
      }
    });
	
    var frame_height = parseInt(document.querySelector("input#Высота").value);
	var frame_width = parseInt(document.querySelector("input#Ширина").value);
	var frame_size = (frame_height + frame_width)*2;
	var texture_size = frame_height*frame_width;
	
    $('input:checked,option:selected').each(function() {
      if ($(this).data('prefix') == '+') {
	  
        if($(this).data('frame')){
			option_price += (frame_size + 8*Number($(this).data('wframe')) )/100 * Number($(this).data('price'));
		}else if($(this).data('subframe')){
			switch($(this).data('subframe')){
				case "big":
					option_price += frame_size/100 * Number($(this).data('price'));
				break;
				case "small":
					option_price += frame_size/100 * Number($(this).data('price'));
				break;
			}
		}else if($(this).data('texture')){
			option_price += frame_height*frame_width/10000 * Number($(this).data('price'));
		}else{
			option_price += Number($(this).data('price'));
		}
		if($(this).data('coating')){
			option_price += main_price * 0.2;
		}
		
      }
      if ($(this).data('prefix') == '-') {
        option_price -= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == 'u') {
        pcnt = 1.0 + (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == 'd') {
        pcnt = 1.0 - (Number($(this).data('price')) / 100.0);
        option_price *= pcnt;
        main_price *= pcnt;
        special *= pcnt;
      }
      if ($(this).data('prefix') == '*') {
        option_price *= Number($(this).data('price'));
        main_price *= Number($(this).data('price'));
        special *= Number($(this).data('price'));
      }
      if ($(this).data('prefix') == '/') {
        option_price /= Number($(this).data('price'));
        main_price /= Number($(this).data('price'));
        special /= Number($(this).data('price'));
      }
    });
    
    special += option_price;
    main_price += option_price;

    <?php if ($special) { ?>
      <?php if (empty($autocalc_option_special))  { ?>
        main_price = special * special_coefficient;
      <?php } else { ?>
        special = main_price / special_coefficient;
      <?php } ?>
      tax = special;
    <?php } else { ?>
      <?php if (!empty($autocalc_option_discount)) { ?>
          main_price *= discount_coefficient;
      <?php } ?>
      tax = main_price;
    <?php } ?>
    
    // Process TAX.
    main_price = calculate_tax(main_price);
    special = calculate_tax(special);
    
    <?php if (!$autocalc_not_mul_qty) { ?>
    main_price *= input_quantity;
    special *= input_quantity;
    tax *= input_quantity;
    <?php } ?>

    // Display Main Price
    animateMainPrice(main_price);
      
    <?php if ($special) { ?>
      animateSpecialPrice(special);
    <?php } ?>
}

$(document).ready(function() {
    $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
    $('input[type="radio"]').bind('change', function() { recalculateprice(); });
    $('select').bind('change', function() { recalculateprice(); });
    
    $quantity = $('input[name="quantity"]');
    $quantity.data('val', $quantity.val());
    (function() {
        if ($quantity.val() != $quantity.data('val')){
            $quantity.data('val',$quantity.val());
            recalculateprice();
        }
        setTimeout(arguments.callee, 250);
    })();

    <?php if ($autocalc_select_first) { ?>
    $('select[name^="option"] option[value=""]').remove();
    last_name = '';
    $('input[type="radio"][name^="option"]').each(function(){
        if ($(this).attr('name') != last_name) $(this).prop('checked', true);
        last_name = $(this).attr('name');
    });
    <?php } ?>
    
    recalculateprice();
});

//--></script>

<div class="row no-margin" style="margin-top: 25px !important;">
    <?php echo $footer; ?>
</div>