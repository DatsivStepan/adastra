$(document).ready(function () {

    ymaps.ready(init);
    var myMap,
        myPlacemark;

    function init(){
        myMap = new ymaps.Map("map", {
            center: [55.757648, 37.682655],
            zoom: 17
        });

        myPlacemark = new ymaps.Placemark([55.757648, 37.682655], {
        });

        myMap.geoObjects
            .add(new ymaps.Placemark([55.757648, 37.682655], {
                iconCaption: 'Слободской переулок, д.6'
            }, {
                preset: 'islands#greenDotIconWithCaption',
                iconColor: '#ed4543'
            }))
    }




    function checkForm(id) {
        if(typeof id != 'undefined'){
            if($('#'+id).val() == ''){
                return 0;
            }
        }
        switch (id) {
            case 'name':
                if (!($('#'+id).val().length > 3)){
                    $('#errorMasege > .' + id).text('Некоректно вказано имя');
                    $('#' + id).css('border', '1px solid red');
                    $('#errorMasege > .' + id).show();
                } else {
                    $('#errorMasege > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege > .' + id).hide();
                }
                break;
            case 'email':
                if (!($( '#'+id).val().match(/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/i))) {
                    $('#errorMasege > .' + id).text('Некоректно вказана електроная почта');
                    $('#' + id).css('border', '1px solid red');
                    $('#errorMasege > .' + id).show();
                } else {
                    $('#errorMasege > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege > .' + id).hide();
                }
                break;
            case 'enquiry':
                if (!($('#'+id).val().length > 3)){
                    $('#errorMasege > .' + id).text('Некоректно задан вопрос');
                    $('#' + id).css('border', '1px solid red');
                    $('#errorMasege > .' + id).show();
                } else {
                    $('#errorMasege > .' + id).text('');
                    $('#' + id).css('border', '1px solid green');
                    $('#errorMasege > .' + id).hide();
                }
                break;
            default:
                var errorCount = 0;
                if (!($('#name_c').val())) {
                    $('#name_c').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege > .name').show();
                } else {
                    $('#errorMasege > .name').text('');
                    $('#name_c').css('border', '1px solid green');
                    $('#errorMasege > .name').hide();
                }
                if (!($('#email_c').val().match(/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/i))) {
                    $('#email_c').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege > .email').show();
                } else {
                    $('#errorMasege > .email').text('');
                    $('#email_c').css('border', '1px solid green');
                    $('#errorMasege > .email').hide();
                }
                if (!($('#enquiry').val())) {
                    $('#enquiry').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege > .enquiry').show();
                } else {
                    $('#errorMasege > .enquiry').text('');
                    $('#enquiry').css('border', '1px solid green');
                    $('#errorMasege > .enquiry').hide();
                }
                if (errorCount == 0) {
                    return true;
                } else {
                    return false;
                }
                break;
        }
    }
    $('.text').on('blur', function () {
        checkForm($(this).attr('id'));
    });
    $('#button').on('click', function (even) {
        even.preventDefault();
         if (checkForm()) {
            var res = $('#contact_c').serializeArray();
            var arr = {};
            $.each(res, function (result) {
                var $index = res[result].name;
                arr[$index] = res[result].value;
            });
            $.ajax({
                url: 'index.php?route=information/contact/contact',
                type: 'post',
                dataType: 'json',
                data: arr,
                success: function (data) {
                }
            });

            swal(
                'Повідомлення відправлено!',
                '',
                'success'
            );
            $('#contact_c')[0].reset();
            $('#name_c').css('border', '1px solid  #322d2d');
            $('#email_c').css('border', '1px solid  #322d2d');
            $('#enquiry').css('border', '1px solid  #322d2d');

        } else {
            console.log('Incorrectly completed forms');
        }

    });
});