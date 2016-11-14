<?php echo $header; ?>
<div class="container">
    <div class="container_breadcrumb">
        <ul class="breadcrumb_contact col-lg-12">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if ($breadcrumb ['href']==('')){ ?>
            <li class="breadcrumb_text"><?php echo $breadcrumb['text']; ?></li>
            <?php }else{ ?>
            <li class="breadcrumb_text"
            ><a class="text" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h1 class="heading_title"><?php echo $heading_title; ?></h1>
            <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div><strong><?php echo $text_address; ?></strong>
                    <p class="address"><?php echo $address; ?></p>
                </div>
                <div><strong><?php echo $text_telephone; ?></strong>
                    <p class="telephone"><?php echo $telephone; ?></p>
                </div>
                <div><strong><?php echo $text_email; ?></strong>
                    <p class=$config_email"><?php echo $config_email; ?></p>
                </div>
                <div><strong><?php echo $text_open; ?></strong>
                    <p class=open"><?php echo $open; ?></p>
                </div>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                  class="form-horizontal col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <fieldset>
                    <h3><?php echo $text_contact; ?></h3>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name"
                                   class="form-control"/>
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email"
                                   class="form-control"/>
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                        <div class="col-sm-10">
                            <textarea name="enquiry" rows="10" id="input-enquiry"
                                      class="form-control"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                </fieldset>
                <div class="buttons">
                    <div class="pull-right">
                        <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>"/>
                    </div>
                </div>
            </form>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>