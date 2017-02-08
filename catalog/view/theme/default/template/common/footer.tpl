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
                <span class="footer-bottom-text-style footer-bottom-text-padding_20">&#169; 2008-2016. Галерея Адастра Все права защищены.</span>
            </div>
            <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 footer-bottom-text-padding" style="text-align: right;">
                <a class="footer-bottom-text-style" href="http	://adtherapy.ru">Разработано в <span style="text-decoration: underline">Рекламотерапия</span></a>
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
                        <span class="footer-bottom-text-style">&#169; 2016. Галерея Адастра Все права защищены.</span>
                    </div>
                    <div class=" footer-bottom-text-padding">
                        <span class="">Разработано в <span style="text-decoration: underline">Рекламотерапия</span></span>
                    </div>
                </div>
        </div>
    </div>

</footer>
<div id="toTop"><i class="fa fa-arrow-up" aria-hidden="true" style="font-size: 18px;"></i> В НАЧАЛО</div>
</body></html>

				<?php if ($buyoneclick_status) { ?>
					<div id="order" class="request-popup">
						<header class="fancy_heading">
							<h3 class="b1c_title"></h3>
						</header>
						<form id="order-form" class="request-form" action="send-order.php">
							<fieldset>
								<div style="display:none">
									<input id="order_admin_email" type="text" name="admin_email" value="<?php echo $buyoneclick_admin_email; ?>">
								</div>				
								<div style="display:none">
									<input id="order_product" type="text" name="product">
								</div>
								<?php if ($buyoneclick_field1_status) { ?>
									<div class="fancy_form_row">
										<input id="order_popup_name" type="text" name="name" placeholder="<?php echo $buyoneclick_field1_title; ?>" <?php if ($buyoneclick_field1_required) { echo 'class="required"';} ?> >
									</div>
								<?php } ?>
								<?php if ($buyoneclick_field2_status) { ?>
									<div class="fancy_form_row">
										<input id="order_popup_phone" type="tel" name="phone" placeholder="<?php echo $buyoneclick_field2_title; ?>" <?php if ($buyoneclick_field2_required) { echo 'class="required"';} ?> >
									</div>
								<?php } ?>		
								<?php if ($buyoneclick_field3_status) { ?>
									<div class="fancy_form_row">
										<input id="order_popup_email" type="email" name="email" placeholder="<?php echo $buyoneclick_field3_title; ?>" <?php if ($buyoneclick_field3_required) { echo 'class="required"';} ?> >
									</div>
								<?php } ?>	
								<?php if ($buyoneclick_field4_status) { ?>
									<div class="fancy_form_row">
										<textarea id="order_popup_message" name="message" rows="3" placeholder="<?php echo $buyoneclick_field4_title; ?>" <?php if ($buyoneclick_field4_required) { echo 'class="required"';} ?> ></textarea>
									</div>
								<?php } ?>
								<div class="fancy_form_row fancy_form_submit">
									<input type="submit" value="<?php echo $buyoneclick_button_order; ?>" data-wait-text="Sending">
								</div>
							</fieldset>
						</form>
					</div>
					<div class="popup-holder">
						<div class="success-popup">
							<div class="fancy_form_row">
								<p><?php echo $buyoneclick_success; ?></p>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function() {
							//console.log($("#in_stock").text());
							if ($("#in_stock").text() > 0) {
								$("#button-cart").after('<a href="#order" <?php if ($buyoneclick_yandex_status) {echo addslashes('onclick="yaCounter' . $buyoneclick_ya_counter . '.reachGoal(\'' . $buyoneclick_ya_identificator . '\'); return true;"');} ?> class="clickToBuy popup-btn order " style="margin-left:0px"><p>Заказать в<br>один клик</p></a>');
							} else {
								$("#button-cart").after('<a href="#order" <?php if ($buyoneclick_yandex_status) {echo addslashes('onclick="yaCounter' . $buyoneclick_ya_counter . '.reachGoal(\'' . $buyoneclick_ya_identificator . '\'); return true;"');} ?> class="clickToBuy popup-btn order btn " style="margin-left:0px"><p>Заказать в<br>один клик</p></a>');
							}
							$(".popup-btn.order").click(function(){
								$("#order").find("h3").text($("#mainTitle").text());
								$("#order").find('input[name="product"]').val("<a href='" + window.location.href + "'>" + $("#mainTitle").html() + "</a>");
								//console.log($("h1").html());
							});			
						});
					</script>
				<?php } ?>	
            