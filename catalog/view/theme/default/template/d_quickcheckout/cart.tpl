<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/cart.tpl 
-->
<div id="cart_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>

<script type="text/html" id="cart_template">

	<div class="chekoutdiv <%= model.config.display ? '' : 'hidden' %>">

		<div class="cont_text fix_p cb mw clf" >
			<div class="hidden-sm hidden-md hidden-xs it_section_name bw clf">
				<div class="sect_name clf"><?php echo $column_name; ?></div>
				<div class="sect_price clf"><?php echo $column_price; ?></div>
				<div class="sect_keywrd clf"><?php echo $column_quantity; ?></div>
				<div class="sect_sum clf"><?php echo $column_total; ?></div>
			</div>


			<div class="baskr_item_wr  mw clf" style="color: black;">
				<% i=0; %>
				<%  _.each(model.products, function(product) { %>

				<div class="baskr_item_box mw clf" <%= product.stock ? '' : 'class="stock"' %> style="<% if(i%2){ %>    background-color: #f5f1e9; <%  } i++; %>position:relative;">

				<div class="itm_img fl clf">

							<% if(product.thumb != ''){ %>
							<img src="<%= product.thumb %>" alt="img">
							<% }else{ %>
							<img src="../../../image/catalog/mag/bask2.jpg" alt="img">
							<% } %>
				</div>

				<div class="itm_name fl clf">
					<a href="<%= product.href %>" <%=  model.config.columns.image ? '' : 'rel="popup" data-help=\'<img src="' + product.image + '"/>\'' %>>
					<%= product.name %> <%= product.stock ? '' : '<span class="out-of-stock">***</span>' %>
					</a>
					<% _.each(product.option, function(option) { %>
					<div> &nbsp;<small><%= option.name %>: <span style="float: right;"><%= option.value %></span></small> </div>
					<% }) %>
					<% if(parseInt(model.config.columns.model)){ %>
					<div class="qc-name-model visible-xs-block"><small><span class="title"><?php echo $column_model; ?>:</span> <span class="text"><%= product.model %></span></small></div>
					<% } %>
					<% if(parseInt(model.config.columns.price) && model.show_price){ %>
					<div class="qc-name-price visible-xs-block "><small><span class="title"><?php echo $column_price; ?>:</span> <span class="text"><%= product.price %></span></small></div>
					<% } %>
					<% if (product.reward) { %>
					<div><small><%= product.reward %></small></div>
					<% } %>
					<% if (product.recurring) { %>
					<div><span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><%= product.recurring %></small></div>
					<% } %>
				</div>

				<div class="hidden-xs itm_price fl clf" style="color: #2f0000;">
					<%= product.price %>
				</div>

				<div class="itm_nuumber fl clf">
					<div class="namber_box section number-plus-minus fr clf">
						<div class="jq-number">
							<div class="jq-number__field" style="    width: 110px; border: 0px!important;">

                               	<span class="input-group-btn" style="    float: left;    width: 25px;">
									<button style="border: 1px solid #ccc;" id="min<%= product.id %>" class="btn btn-link decrease minus " data-product="<%= product.key %>">-</button>
								</span>
								<input id="inp<%= product.id %>" style="    font-weight: bold!important;
    font-family: 'System';
    font-size: 16px;
    color: #2f0000;
								padding: 0px; float: left; border-top: 1px solid #dedddd !important;
    border-bottom: 1px solid #dedddd !important;    width: 48px; height: 38px!important;" min="0" type="text" data-mask="9?999999999999999" value="<%= product.quantity %>" class="qc-product-qantity form-control text-center" name="cart.<%= product.key %>"  data-refresh="2"/>
								<span class="input-group-btn" style="    float: left;    width: 25px;">
									<button style="border: 1px solid #ccc;" class="btn btn-link increase plus" data-product="<%= product.key %>"></button>

								</span>
							</div></div>
					</div>
				</div>

				<div class="itm_sum fl clf" style="color: #2f0000;">
				<p class="visible-xs" style="    display: inline!important;">Сумма: </p>		
					<%= product.total %>
				</div>

			</div>



			<% }) %>
		</div>




	</div>


	</div>
	</div>

	<% if(model.show_price){ %>
	<div class="form-horizontal qc-totals" style="top: 330px; position: relative;">
	

		<div class="row text-right" style="font-family: 'Times New Roman';
    font-size: 30px;
    color: #322d2d!important;
	    border-top: none;
		font-weight: bold!important;">
			
			Сумма: <%= model.totals[2]['value'] %> руб.
		</div>

	</div>
	<% } %>
	<div class="preloader row"><img class="icon" src="image/<%= config.general.loader %>" /></div>

</script>
<script>
$(function() {
	qc.cart = $.extend(true, {}, new qc.Cart(<?php echo $json; ?>));
	qc.cartView = $.extend(true, {}, new qc.CartView({
		el:$("#cart_view"), 
		model: qc.cart, 
		template: _.template($("#cart_template").html())
	}));

});

</script>