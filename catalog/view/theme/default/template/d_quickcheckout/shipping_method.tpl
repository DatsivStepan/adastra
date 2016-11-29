<!-- 
	Ajax Quick Checkout
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/shipping_method.tpl 
-->
<div id="shipping_method" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="shipping_method_template">
<form id="shipping_method_form" <%= parseInt(model.config.display) && model.show_shipping_method ? '' : 'class="hidden"' %>>
	<% if (model.shipping_methods) { %>
		<div class="panel panel-default shipping_bord">
			<div class="panel-body">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-4 panel-heading">
					<div class=" img_car_shipping img_car_shipping2">
						<img src="../../../catalog/view/theme/default/image/Shape-1.png" style="">
					</div>
				</div>
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-8">
					<h4 class="panel-title">
						<span class="text text_dost"><%= model.config.title %></span>
					</h4>
				<% if(model.error){ %>
					<div class="alert alert-danger">
						<i class="fa fa-exclamation-circle"></i> <%= model.error %>
					</div>
				<% } %>
				<div id="shipping_method_list" style="margin: 0 -29px 0 0!important;">

						<% if(model.config.input_style == 'select') { %>
							<div class="select-input form-group">
								<select name="shipping_method" class="form-control shipping-method-select" data-refresh="5" >
								<% _.each(model.shipping_methods, function(shipping_method) { %>
									<% if (parseInt(model.config.display_title)) { %>
										<optgroup label="<%= shipping_method.title %>">
									<% } %>
									<% _.each(shipping_method.quote, function(quote) { %>
										<% if (quote.code == model.shipping_method.code) { %>
											<option  value="<%= quote.code %>" id="<%= quote.code %>" selected="selected" ><%= quote.title %> <span class="price"><%= quote.text %></span></option>
										<% } else { %>
											<option  value="<%= quote.code %>" id="<%= quote.code %>" ><%= quote.title %> <span class="price"><%= quote.text %></span></option>
										<% } %>
									<% }) %>
									<% if (parseInt(model.config.display_title)) { %>
										</optgroup>
									<% } %>
								<% }) %>
								</select>
							</div>


						<% }else{ %>
							<% _.each(model.shipping_methods, function(shipping_method) { %>

								<% if (!shipping_method.error) { %>
									<% _.each(shipping_method.quote, function(quote) { %>
									  <div class="hidden-xs radio-input radio">
									    <label for="<%= quote.code %>">
									    <% if (quote.code == model.shipping_method.code) { %>
									      <input type="radio" name="shipping_method" value="<%= quote.code %>" id="<%= quote.code %>" checked="checked" data-refresh="5" class="styled"/>
									    <% } else { %>
									      <input type="radio" name="shipping_method" value="<%= quote.code %>" id="<%= quote.code %>" data-refresh="5" class="styled"/>
									    <% } %>
									    <span class="text text_dost1"><%= quote.title %></span><span class="price text_dost"><%= quote.text %></span></label>
									  </div>
									<% if (quote.code == model.shipping_method.code) { %>
											<div class="hidden-lg hidden-md hidden-sm radio-input radio ">
												<label class="active pai_met_act4" for="<%= quote.code %>" style="padding: 0 0 0 3px;">
													<span class="text text_dost4"><%= quote.title %></span></label>
											</div>
										<% }else{ %>
											<div class="hidden-lg hidden-md hidden-sm radio-input radio ">
												<label class="active pai_met_act" for="<%= quote.code %>" style="padding: 0 0 0 3px;">
													<span class="text text_dost"><%= quote.title %></span></label>
											</div>
									<% } %>
									<% }) %>
								<% } else { %>
									<div class="error alert alert-error"><%= shipping_method.error %></div>
								<% } %>
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
	qc.shippingMethod = $.extend(true, {}, new qc.ShippingMethod(<?php echo $json; ?>));
	qc.shippingMethodView = $.extend(true, {}, new qc.ShippingMethodView({
		el:$("#shipping_method"),
		model: qc.shippingMethod,
		template: _.template($("#shipping_method_template").html())
	}));
});
</script>