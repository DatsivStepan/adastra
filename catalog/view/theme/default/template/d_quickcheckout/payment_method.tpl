<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/payment_method.tpl 
-->
<div id="payment_method" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="payment_method_template" >
<form id="payment_method_form" <%= parseInt(model.config.display) ? '' : 'class="hidden"' %>>
	<% if (model.error_warning) { %>
		<div class="error"><%= model.error_warning %></div>
	<% } %>
	<% if (model.payment_methods) { %>
		<div class="panel panel-default shipping_bord2" >
			<div class="panel-body">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 panel-heading">
					<div class="img_car_payment">
						<img src="../../../catalog/view/theme/default/image/Shape-2.png" style="">
					</div>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-8" style="margin: -20px 0 0 0;">
					<div class="panel-heading panel-title" style="padding: 0;">
							<span class="active text text_dost"><%= model.config.title %></span>
					</div>
					<div id="payment_method_list" class="<%= parseInt(model.config.display_options) ? '' : 'hidden' %>" style="margin: 0 -29px 0 0!important;">
					<% if(model.config.input_style == 'select') { %>
						<div class="select-input form-group">
							<select name="payment_method" class="form-control payment-method-select" data-refresh="6" >
							<% _.each(model.payment_methods, function(payment_method) { %>
								<% if (payment_method.code == model.payment_method.code) { %>
									<option  value="<%= payment_method.code %>" id="<%= payment_method.code %>" selected="selected" ><%= payment_method.title %> <span class="price"><%= (payment_method.cost) ? payment_method.cost : '' %></span></option>
								<% } else { %>
									<option  value="<%= payment_method.code %>" id="<%= payment_method.code %>" ><%= payment_method.title %> <span class="price"><%= (payment_method.cost) ? payment_method.cost : '' %></span></option>
								<% } %>
							<% }) %>
							</select>
						</div>
					<% }else{ %>
						<% _.each(model.payment_methods, function(payment_method) { %>
						<div class="hidden-xs radio-input radio">
							<label for="<%= payment_method.code %>"class="text_dost1 pai_met_act">
								<% if (payment_method.code == model.payment_method.code) { %>
								<input type="radio" name="payment_method" value="<%= payment_method.code %>" id="<%= payment_method.code %>" checked="checked" class="styled"  data-refresh="6"/>
								<% } else { %>
								<input type="radio" name="payment_method" value="<%= payment_method.code %>" id="<%= payment_method.code %>" class="styled"  data-refresh="6"/>
								<% } %>

								<%= payment_method.title %>
								<span class="price"><%= payment_method.cost ? payment_method.cost : '' %></span>
							</label>
						</div>
						<% if (payment_method.code == model.payment_method.code) { %>
						<div class="hidden-lg hidden-md hidden-sm radio-input radio">
							<label for="<%= payment_method.code %>" class="text_dost4 pai_met_act4" style="padding: 0 0 0 3px;">
								<%= payment_method.title %>
								<span class="price"><%= payment_method.cost ? payment_method.cost : '' %></span>
							</label>
						</div>
						<% }else{ %>
						<div class="hidden-lg hidden-md hidden-sm radio-input radio">
							<label for="<%= payment_method.code %>" class="text_dost pai_met_act" style="padding: 0 0 0 3px;">
								<%= payment_method.title %>
								<span class="price"><%= payment_method.cost ? payment_method.cost : '' %></span>
							</label>
						</div>
						<% }%>

						<% }) %>
					<% } %>
					</div>
			   </div>
			</div>
		</div>

	<% } %>
</form>
</script>
<script>
$(function() {
	qc.paymentMethod = $.extend(true, {}, new qc.PaymentMethod(<?php echo $json; ?>));
	qc.paymentMethodView = $.extend(true, {}, new qc.PaymentMethodView({
		el:$("#payment_method"), 
		model: qc.paymentMethod, 
		template: _.template($("#payment_method_template").html())
	}));
});
</script>