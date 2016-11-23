<?php echo $header; ?>
<div class="container ">
    <div class="container_breadcrumb hidden-xs">
        <ul class="breadcrumb_contact hidden-xs  col-sm-12 col-md-12 col-lg-12" style="padding: 0">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if ($breadcrumb ['href']==('')){ ?>
            <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
            <?php }else{ ?>
            <li class="breadcrumb_text"
            ><a class="text" href="<?php echo $breadcrumb['href']; ?>" style="padding-right: 12px; background: url('../../../catalog/view/theme/default/image/strilka.png') right center no-repeat;"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <div class="row" style="    margin-bottom: 30%;"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="'col-xs-12 col-sm-12 col-md-12 col-lg-12"><?php echo $content_top; ?>
            <h1 class="heading_title"><?php echo $heading_title; ?></h1>

            <div class="row col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="row" style="    margin-bottom: 30px;">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><strong class="text"><?php echo $text_address; ?></strong></div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><p class="address"><?php echo $address; ?></p></div>

                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><strong class="text"><?php echo $text_telephone; ?></strong></div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><p class="telephone"><?php echo $telephone; ?></p>
                    <p class="telephone"><?php echo $telephone2; ?></p></div>

                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><strong class="text"><?php echo $text_email; ?></strong></div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><p class="config_email"><?php echo $config_email; ?></p></div>

                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><strong class="text"><?php echo $text_open; ?></strong></div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><p class="open"><?php echo $open; ?></p></div>
                </div>
                <div class="row">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg=8"><h1 class="text_comment"><?php echo $comment; ?></h1></div>
                </div>
                <div class="row">
                <form action="" method="post" id="contact" class="email_adminy">
                    <h1 class="vopros"><?php echo $text_contact; ?></h1>
                    <div class="form-group required">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="name"
                                   class="form-control_style text" placeholder="<?php echo $entry_name; ?>"/>
                            <ul id="errorMasege" style="padding-left: 15px">
                                <code style="display: none" class="name error-style">Некоректно вказана електроная почта</code>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="email"
                                   class="form-control_style text" placeholder="<?php echo $entry_email; ?>"/>
                            <ul id="errorMasege" style="padding-left: 15px">
                                <code style="display: none" class="email error-style">Некоректно вказана електроная почта</code>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group required">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <textarea name="enquiry" id="enquiry"
                                          class="form-control_style text" placeholder="<?php echo $entry_enquiry; ?>"></textarea>
                            <ul id="errorMasege" style="padding-left: 15px">
                                <code style="display: none" class="enquiry error-style">Некоректно задан вопрос </code>
                            </ul>
                        </div>
                    </div>
                    <div class="buttons">
                        <div class="center-block">
                            <input id="button" name="button" class="btn_otpravutu" type="button" value="<?php echo $button_submit; ?>"/>
                        </div>
                    </div>
                </form>
            </div>
            </div>
            <div class="map col-xs-12 col-sm-5 col-md-5 col-lg-5" id="map" style=""></div>
        </div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>