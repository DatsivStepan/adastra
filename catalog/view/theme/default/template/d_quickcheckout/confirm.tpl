<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/confirm.tpl 
-->

		<div id="confirm_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
		<script type="text/html" id="confirm_template">
			<div id="confirm_wrap">
				<div class="panel panel-default">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-1"></div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-10" style="padding: 0;margin: -53.8px 0 0 0;">
								<div class="panel-body" style="margin-bottom: 15%;">
									<form id="confirm_form" class="form-horizontal">
									</form>
									<button id="qc_confirm_order" class="btn btn-primary btn-lg btn-block border_button" <%= model.show_confirm ? '' : 'disabled="disabled"' %>><?php echo $button_confirm; ?></button>
								</div>
							</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-1"></div>
				</div>
			</div>

		</script>

<script>

$(function() {
	qc.confirm = $.extend(true, {}, new qc.Confirm(<?php echo $json; ?>));
	qc.confirmView = $.extend(true, {}, new qc.ConfirmView({
		el:$("#confirm_view"), 
		model: qc.confirm, 
		template: _.template($("#confirm_template").html())
	}));
});

</script>