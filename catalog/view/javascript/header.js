$(document).ready(function () {
	$('#products').on('click', function () {
		$('#product_1').toggleClass('fa-angle-up');
		$('#product_1').toggleClass('fa-angle-down');
        $('#products_id').slideToggle("fast");
	});
	$('#products_id_md').on('click', function () {

		$('#products_md').slideToggle("fast");
	});
/*	$("#contact").click(function() {
		$("#myModal").modal('show');
	});
*/
	$("#phone_id").click(function() {
		$('#id_phone').slideToggle("fast");
	});


	function checkForm(id) {
		if(typeof id != 'undefined'){
			if($('#'+id).val() == ''){
				return 0;
			}
		}
		switch (id) {
			case 'name':
				if (!($('#' + id).val().match(/^[a-zA-Zа-яА-Я]+$/)) || ($('#name').val().length < 3)) {
					$('#errorMasege > .' + id).text('Некоректно заполнено Имя пользователя');
					$('#' + id).css('border', '1px solid red');
					$('#errorMasege > .' + id).show();
				} else {
					$('#errorMasege > .' + id).text('');
					$('#' + id).css('border', '1px solid green');
					$('#errorMasege > .' + id).hide();
				}
				break;
			case 'email':
				if (!($('#' + id).val().match(/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i))) {
					$('#errorMasege > .' + id).text('Некоректно заполнено Email');
					$('#' + id).css('border', '1px solid red');
					$('#errorMasege > .' + id).show();
				} else {
					$('#errorMasege > .' + id).text('');
					$('#' + id).css('border', '1px solid green');
					$('#errorMasege > .' + id).hide();
				}
				break;
			case 'message':
				if (!($('#' + id).val().length >= 10)) {
					$('#errorMasege > .' + id).text('Минимальная длина сообщения десеть знаков');
					$('#' + id).css('border', '1px solid red')
					$('#errorMasege > .' + id).show();
				} else {
					$('#errorMasege > .' + id).text('');
					$('#' + id).css('border', '1px solid green');
					$('#errorMasege > .' + id).hide();
				}
				break;
			default:
				var errorCount = 0;
				if (!($('#name').val().match(/^[a-zA-Zа-яА-Я]+$/))) {
					$('#name').css('border', '1px solid red');
					errorCount++;
					$('#errorMasege > .name').show();
				} else {
					$('#errorMasege > .name').text('');
					$('#name').css('border', '1px solid green');
					$('#errorMasege > .name').hide();
				}
				if (!($('#email').val().match(/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i))) {
					$('#email').css('border', '1px solid red');
					errorCount++;
					$('#errorMasege > .email').show();
				} else {
					$('#errorMasege > .email').text('');
					$('#email').css('border', '1px solid green');
					$('#errorMasege > .email').hide();
				}
				if (!($('#message').val().length >= 10)) {
					$('#message').css('border', '1px solid red');
					errorCount++;
					$('#errorMasege > .message').show();
				} else {
					$('#errorMasege > .message').text('');
					$('#message').css('border', '1px solid green');
					$('#errorMasege > .message').hide();
				}
				if (errorCount == 0) {
					return true;
				} else {
					return false;
				}
				break;
		}
	}

	$('.contactItem').on('blur', function () {
		checkForm($(this).attr('id'));
	});

	$('#sendMessage').on('click', function (even) {
		even.preventDefault();
		if (checkForm()) {
			var res = $('#contactForm').serializeArray();

			var arr = {};
			$.each(res, function (result) {
				var $index = res[result].name;
				arr[$index] = res[result].value;
			});
			$('#name').val('');
			$('#email').val('');
			$('#message').val('');
			swal("Сообщение отправлено", "", "success");
			$('#contactForm_en').removeClass('in');
			$('.modal-backdrop').removeClass('in');
			$.ajax({
				url: 'index.php?route=common/header/contactForm',
				type: 'post',
				dataType: 'json',
				data: arr,
				success: function (data) {
				}
			});
		} else {
			console.log('Incorrectly completed forms');
		}
	});
  
      function checkFormRu(id) {
        if(typeof id != 'undefined'){
            if($('#'+id).val() == ''){
                return 0;
            }
        }
        switch (id) {
            case 'name_ru':
                if (!($('#' + id).val().match(/^[a-zA-Zа-яА-Я]+$/)) || ($('#name_ru').val().length < 3)) {
                    $('#errorMasege_ru > .' + id).text('Некоректно заполнено Имя пользователя');
                    $('#' + id).css('border', '1px solid red');
                    $('#errorMasege_ru > .' + id).show();
                } else {
                    $('#errorMasege_ru > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege_ru > .' + id).hide();
                }
                break;
            case 'email_ru':
                if (!($('#' + id).val().match(/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i))) {
                    $('#errorMasege_ru > .' + id).text('Некоректно заполнено Email');
                    $('#' + id).css('border', '1px solid red');
                    $('#errorMasege_ru > .' + id).show();
                } else {
                    $('#errorMasege_ru > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege_ru > .' + id).hide();
                }
                break;
            case 'message_ru':
                if (!($('#' + id).val().length >= 10)) {
                    $('#errorMasege_ru > .' + id).text('Минимальная длина сообщения десеть знаков');
                    $('#' + id).css('border', '1px solid red')
                    $('#errorMasege_ru > .' + id).show();
                } else {
                    $('#errorMasege_ru > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege_ru > .' + id).hide();
                }
                break;
            default:
                var errorCount = 0;
                if (!($('#name_ru').val().match(/^[a-zA-Zа-яА-Я]+$/))) {
                    $('#name_ru').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege_ru > .name_ru').show();
                } else {
                    $('#errorMasege_ru > .name_ru').text('');
                    $('#name_ru').css('border', '1px solid green');
                    $('#errorMasege_ru > .name_ru').hide();
                }
                if (!($('#email_ru').val().match(/^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i))) {
                    $('#email_ru').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege_ru > .email_ru').show();
                } else {
                    $('#errorMasege_ru > .email_ru').text('');
                    $('#email_ru').css('border', '1px solid green');
                    $('#errorMasege_ru > .email_ru').hide();
                }
                if (!($('#message_ru').val().length >= 10)) {
                    $('#message_ru').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege_ru > .message_ru').show();
                } else {
                    $('#errorMasege_ru > .message_ru').text('');
                    $('#message_ru').css('border', '1px solid green');
                    $('#errorMasege_ru > .message_ru').hide();
                }
                if (errorCount == 0) {
                    return true;
                } else {
                    return false;
                }
                break;
        }
    }

    $('.contactItem_ru').on('blur', function () {
        checkFormRu($(this).attr('id'));
    });

    $('#sendMessage_ru').on('click', function (even) {
        even.preventDefault();
        console.log('wqdwqd');
        if (checkFormRu()) {
            var res = $('#contactForm_ru').serializeArray();

            var arr = {};
            $.each(res, function (result) {
                var $index = res[result].name;
                arr[$index] = res[result].value;
            });
            $('#name_ru').val('');
            $('#email_ru').val('');
            $('#message_ru').val('');
            swal("Сообщение отправлено", "", "success");
            $('#contactForm_ru').removeClass('in');
            $('.modal-backdrop').removeClass('in');
            $.ajax({
                url: 'index.php?route=common/header/contactFormRu',
                type: 'post',
                dataType: 'json',
                data: arr,
                success: function (data) {
                }
            });
        } else {
            console.log('Incorrectly completed forms');
        }
    });



    $('#sendMessage_card').on('click', function (even) {
		even.preventDefault();
			var res = $('#contact_c_card').serializeArray();
			var arr = {};
			$.each(res, function (result) {
				var $index = res[result].name;
				arr[$index] = res[result].value;
			});
			swal("Сообщение отправлено", "", "success");
			$.ajax({
				url: 'index.php?route=product/product/contactFormCard',
				type: 'post',
				dataType: 'json',
				data: arr,
				success: function (data) {
				}
			});
	});


});