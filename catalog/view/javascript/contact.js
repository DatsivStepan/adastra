$(document).ready(function () {

    ymaps.ready(init);
    var myMap,
        myPlacemark;

    function init(){
        myMap = new ymaps.Map("map", {
            center: [55.702531, 37.928893],
            zoom: 17
        });

        myPlacemark = new ymaps.Placemark([55.702531, 37.928893], {
        });

        myMap.geoObjects
            .add(new ymaps.Placemark([55.702531, 37.928893], {
                iconCaption: 'Покровская улица'
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
                if (!($('#name').val())) {
                    $('#name').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege > .name').show();
                } else {
                    $('#errorMasege > .name').text('');
                    $('#name').css('border', '1px solid green');
                    $('#errorMasege > .name').hide();
                }
                if (!($('#email').val().match(/^([a-z0-9_\.-]+)@([a-z0-9_\.-]+)\.([a-z\.]{2,6})$/i))) {
                    $('#email').css('border', '1px solid red');
                    errorCount++;
                    $('#errorMasege > .email').show();
                } else {
                    $('#errorMasege > .email').text('');
                    $('#email').css('border', '1px solid green');
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
        //console.log($(this).attr('id'));
        checkForm($(this).attr('id'));
    });
    $('#button').on('click', function (even) {
        even.preventDefault();
        if (checkForm()) {
            var res = $('#contact').serializeArray();
            var arr = {};
            $.each(res, function (result) {
                var $index = res[result].name;
                arr[$index] = res[result].value;
                console.log(arr[$index] = res[result].value);
            });
            $.ajax({
                url: 'index.php?route=information/contact/contact',
                type: 'post',
                dataType: 'json',
                data: arr,
                success: function (data) {
                    console.log(data);
                }
            });

            swal(
                'Повідомлення відправлено!',
                '',
                'success'
            );
            $('#contact')[0].reset();
            $('#name').css('border', '1px solid  #322d2d');
            $('#email').css('border', '1px solid  #322d2d');
            $('#enquiry').css('border', '1px solid  #322d2d');

        } else {
            console.log('Incorrectly completed forms');
        }

    });
    $('#products').on('click', function () {
        $('#product_1').toggleClass('fa-angle-up');
        $('#product_1').toggleClass('fa-angle-down');
        $('#products_id').slideToggle("fast");
    });
    $('#products_id_md').on('click', function () {
        console.log('awdwd');
        $('#products_md').slideToggle("fast");
    });
    $("#contact").click(function() {
        $("#myModal").modal('show');
    });

    $("#phone_id").click(function() {
        $('#id_phone').slideToggle("fast");
    });
});