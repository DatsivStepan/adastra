$(document).ready(function() {
	
	$(".popup-btn").fancybox({
		'padding': 0,
		'overlayOpacity': 0.87,
		'overlayColor': '#000',
		'transitionIn': 'none',
		'transitionOut': 'none',
		'titlePosition': 'inside',
		'maxWidth': 500,
		'autoDimensions': true
		
	});

	/*
    $("#popup_phone").mask('+7 (000) 000-00-00');
	$("#order_popup_phone").mask('+7 (000) 000-00-00');
	*/
	
	$("input").focus(function(){
		$(this).removeClass("error");
		console.log("removeClass!");
	});
	
    $("#order-form").submit(function(event) {
		
		if(!formValidation(event.target)){return false;}

		var action = $(this).attr("action");
		var sendingForm = $(this);
		var submit_btn = $(this).find("input[type=submit]");
		var value_text = $(submit_btn).attr("value");
		console.log($(event.target).serializeArray());
		var waiting_text = $(submit_btn).attr("data-wait-text");
		$.ajax({
			type: "POST",
			url: action,
			data: $(event.target).serializeArray(),
			beforeSend:function(){
				$(submit_btn).prop( "disabled", true );
				$(submit_btn).addClass("waiting").val("Sending");
			},
			success: function(msg,status){
				$(sendingForm).trigger('reset');
				$(submit_btn).removeClass("waiting");
				$(submit_btn).val(value_text);
				$(submit_btn).prop( "disabled", false );
				parent.$.fancybox.close();
				$(".popup-holder").slideDown( 300 ).delay( 3000 ).slideUp( 300 );
			},
			error: function(){
				$(submit_btn).prop( "disabled", false );
				$(submit_btn).removeClass("waiting").val("Error");
			}

		});
		event.preventDefault();

    });	

});
function formValidation(formElem){
	var elements = $(formElem).find(".required");
	var errorCounter = 0;
	
	$(elements).each(function(indx,elem){
		var placeholder = $(elem).attr("placeholder");
		if($(elem).val() == "" || $(elem).val() == placeholder){
			$(elem).addClass("error");
			errorCounter++;
		}
		else{
			$(elem).removeClass("error");
		}
	});
	
	
	$('input[name="phone"]').each(function() {
		var pattern = new RegExp(/^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$/);
		console.log($(this).val());
		console.log(pattern);
		console.log(pattern.test($(this).val()));

		if(!pattern.test($(this).val())){
			console.log('NON valid phone!');
			$('input[name="phone"]').addClass("error");
			errorCounter++;
		}

	});	
	
	if (errorCounter > 0) {
		$(".fancy_form_error_text").show();
		return false;
	} else {
		$(".fancy_form_error_text").hide();
		return true;
	}
}