/**
 * Created by lexlazzy on 24.11.2016.
 */

function ready() {

    var wSliderRealMinValue = parseInt(document.getElementById('minWidth').innerHTML);
    var wSliderRealMaxValue = parseInt(document.getElementById('maxWidth').innerHTML);

    var hSliderRealMinValue = parseInt(document.getElementById('minHeight').innerHTML);
    var hSliderRealMaxValue = parseInt(document.getElementById('maxHeight').innerHTML);

    var image = document.getElementById('image');

    var wSliderMinValue = 0;
    var wSliderMaxValue = image.offsetWidth + 2;

    var hSliderMinValue = 0;
    var hSliderMaxValue = image.offsetHeight + 2;

    //id опций

    //COLOR OPTIONS ID
    var CONTRAST_MIN50_ID = "contrast(0.5)";
    var CONTRAST_MIN25_ID = "contrast(0.75)";
    var CONTRAST_0_ID = "clear";
    var CONTRAST_PLUS25_ID = "contrast(1.25)";
    var CONTRAST_PLUS50_ID = "contrast(1.5)";
    var GRAYSCALECOLD_ID = "cold_grey";
    var GRAYSCALEWARM_ID = "warm_grey";
    var SEPIA_ID = "sepia";
    var BROWN_ID = "brown";
    var OCHRE_ID = "ochre";

    //SIZE OPTIONS ID
    var WIDTH_ID = "Ширина";
    var HEIGHT_ID = "Высота";
    var WIDTH_OFFSET_ID = "горизонтальноеСмещение";
    var HEIGHT_OFFSET_ID = "вертикальноеСмещение";

    //CROPPER CUSTOM OPTIONS
    var CROPPER_ASPECT_RATIO = .8;


    var cropperSize = {
        "left": ((wSliderMaxValue - wSliderMaxValue * CROPPER_ASPECT_RATIO) / 2),
        "top": ((hSliderMaxValue - hSliderMaxValue * CROPPER_ASPECT_RATIO) / 2),
        "width": wSliderMaxValue * CROPPER_ASPECT_RATIO,
        "height": hSliderMaxValue * CROPPER_ASPECT_RATIO
    };

    var MAX_CROPPER_SIZE_ID = "maxCropperSize";

    var MAX_CROPPER_SIZE = document.getElementById(MAX_CROPPER_SIZE_ID);

    //ELEMENTS DEFINITION
    var heightInput = document.querySelector("input#" + HEIGHT_ID);
    var widthInput = document.querySelector("input#" + WIDTH_ID);

    var frameWidth = wSliderMaxValue + 60;
    var frameHeight = hSliderMaxValue + 60;

    document.styleSheets[0].addRule('#frame', 'height: ' + frameHeight + 'px; width: ' + frameWidth + 'px');
    document.styleSheets[0].insertRule('#frame { height: ' + frameHeight + 'px; width: ' + frameWidth + 'px }', 0);

    var setSliderLabels = function (width, height) {

        //var width = wSlider.noUiSlider.get()*1;
        cropperSize = cropper.getCropBoxData();

        var wOffset = Math.round(cropperSize.left * wSliderRealMaxValue / wSliderMaxValue);
        var w = Math.round(width * wSliderRealMaxValue / wSliderMaxValue);

        document.styleSheets[0].addRule('#wSlider .noUi-handle:before', 'content: "' + w + '"');
        document.styleSheets[0].insertRule('#wSlider .noUi-handle:before { content: "' + w + '" }', 0);
        //ширина
        widthInput.value = w;
        //горизонтальное смещение
        document.querySelector("input#" + WIDTH_OFFSET_ID).value = wOffset;

        //var height = hSlider.noUiSlider.get()*1;
        cropperSize = cropper.getCropBoxData();

        var h = Math.round(height * hSliderRealMaxValue / hSliderMaxValue);
        var hOffset = Math.round(cropperSize.top * hSliderRealMaxValue / hSliderMaxValue);

        document.styleSheets[0].addRule('#hSlider .noUi-handle:before', 'content: "' + h + '"');
        document.styleSheets[0].insertRule('#hSlider .noUi-handle:before { content: "' + h + '" }', 0);

        //высота
        heightInput.value = h;
        //вертикальное смещение
        document.querySelector("input#" + HEIGHT_OFFSET_ID).value = hOffset;
    };

    var cropperReadyFunc = function (e) {
        document.querySelector("div.cropper-canvas > img").src = "";
        document.querySelector("span.cropper-view-box > img").src = "";

        document.querySelector("div.cropper-canvas > img").style.backgroundImage = "url(" + image.src + ")";
        document.querySelector("div.cropper-canvas > img").style.backgroundBlendMode = "multiply";
        document.querySelector("div.cropper-canvas > img").style.backgroundSize = "contain";
        document.querySelector("div.cropper-canvas > img").style.size = "100% 100%";

        document.querySelector("span.cropper-view-box > img").style.backgroundImage = "url(" + image.src + ")";
        document.querySelector("span.cropper-view-box > img").style.backgroundBlendMode = "multiply";
        document.querySelector("span.cropper-view-box > img").style.backgroundSize = "contain";
        document.querySelector("span.cropper-view-box > img").style.size = "100% 100%";

        cropper.setCropBoxData(cropperSize);

        var tmp = cropper.getCropBoxData();

        setSliderLabels(tmp.width, tmp.height);

    };

    var options = {
        //aspectRatio: 16 / 9,
        //Enable to move the image
        movable: false,
        //Enable to rotate the image.
        rotatable: false,
        //Enable to scale the image.
        scalable: false,
        //Enable to zoom the image.
        zoomable: false,
        //Enable to zoom the image by dragging touch.
        zoomOnTouch: false,
        //Enable to zoom the image by wheeling mouse.
        zoomOnWheel: false,
        autoCropArea: CROPPER_ASPECT_RATIO,
        viewMode: 3,
        ready: cropperReadyFunc,
        cropstart: function () {

        },
        cropend: function () {

        },
        cropmove: function (e) {
            var d = cropper.getCropBoxData();
            setSliderLabels(d.width, d.height);
            hSlider.noUiSlider.set(d.height);
            wSlider.noUiSlider.set(d.width);
        },
        crop: function () {

        }
    };

    var cropper = new Cropper(image, options);

    var wSlider = document.getElementById('wSlider');

    noUiSlider.create(wSlider, {
        start: wSliderMaxValue * CROPPER_ASPECT_RATIO,
        connect: [true, false],
        animate: false,
        range: {
            'min': wSliderMinValue,
            'max': wSliderMaxValue
        }
    });
    wSlider.noUiSlider.on('slide', function () {
        var height = hSlider.noUiSlider.get() * 1;
        var width = wSlider.noUiSlider.get() * 1;
        setSliderLabels(width, height);
    });
    wSlider.noUiSlider.on('slide', function () {
        var height = hSlider.noUiSlider.get() * 1;
        var width = wSlider.noUiSlider.get() * 1;
        cropperSize = cropper.getCropBoxData();
        var difWidth = cropperSize.width - width;
        cropperSize.width = width;
        cropperSize.left = cropperSize.left + difWidth / 2;

        setSliderLabels(width, height);
        cropper.setCropBoxData({
            "left": (cropperSize.left + difWidth / 2),
            "top": cropperSize.top,
            "width": width,
            "height": cropperSize.height
        });
    });

    var hSlider = document.getElementById('hSlider');

    noUiSlider.create(hSlider, {
        start: hSliderMaxValue * CROPPER_ASPECT_RATIO,
        connect: [true, false],
        animate: false,
        range: {
            'min': hSliderMinValue,
            'max': hSliderMaxValue
        }
    });
    hSlider.noUiSlider.on('slide', function () {
        var height = hSlider.noUiSlider.get() * 1;
        var width = wSlider.noUiSlider.get() * 1;
        setSliderLabels(width, height);
    });
    hSlider.noUiSlider.on('slide', function () {
        var height = hSlider.noUiSlider.get() * 1;
        var width = wSlider.noUiSlider.get() * 1;
        cropperSize = cropper.getCropBoxData();
        var difHeight = cropperSize.height - height;
        cropperSize.height = height;
        cropperSize.top = cropperSize.top + difHeight / 2;

        setSliderLabels(width, height);
        cropper.setCropBoxData({
            "left": cropperSize.left,
            "top": (cropperSize.top + difHeight / 2),
            "width": cropperSize.width,
            "height": height
        });
    });

    VMasker(widthInput).maskNumber();
    widthInput.addEventListener("onKeyDown", function () {

        var width = parseInt(this.value);
        if (width > wSliderRealMaxValue) {
            width = wSliderRealMaxValue;
            this.value = wSliderRealMaxValue;
        }

        wSlider.noUiSlider.set(Math.round(width * wSliderMaxValue / wSliderRealMaxValue));
    });

    VMasker(heightInput).maskNumber();
    heightInput.addEventListener("onKeyDown", function () {

        var height = parseInt(this.value);
        if (height > hSliderRealMaxValue) {
            height = hSliderRealMaxValue;
            this.value = hSliderRealMaxValue;
        }

        hSlider.noUiSlider.set(Math.round(height * hSliderMaxValue / hSliderRealMaxValue));
    });
    setSliderLabels(wSliderMaxValue * CROPPER_ASPECT_RATIO, hSliderMaxValue * CROPPER_ASPECT_RATIO);

    MAX_CROPPER_SIZE.addEventListener("click", function () {
        cropperSize = cropper.getCropBoxData();

        if (MAX_CROPPER_SIZE.checked) {

            var height = MAX_CROPPER_SIZE.getAttribute('att_height') * 1;
            var width = MAX_CROPPER_SIZE.getAttribute('att_width') * 1;

            hSlider.noUiSlider.set(height);
            wSlider.noUiSlider.set(width);

            var difHeight = cropperSize.height - height;
            var difWidth = cropperSize.width - width;

            cropperSize.height = height;
            cropperSize.width = width;

            cropperSize.top = cropperSize.top + difHeight / 2;
            cropperSize.left = cropperSize.left + difWidth / 2;

            // To disable
            hSlider.setAttribute('disabled', true);
            wSlider.setAttribute('disabled', true);

            widthInput.value = Math.round(width * wSliderRealMaxValue / wSliderMaxValue);
            heightInput.value = Math.round(height * hSliderRealMaxValue / hSliderMaxValue);

            heightInput.disabled = true;
            widthInput.disabled = true;

            options["cropBoxResizable"] = false;

            cropper.destroy();
            cropper = new Cropper(image, options);
        } else {
            // To re-enable
            hSlider.removeAttribute('disabled');
            wSlider.removeAttribute('disabled');

            heightInput.disabled = false;
            widthInput.disabled = false;

            options["cropBoxResizable"] = true;
            cropper.destroy();
            cropper = new Cropper(image, options);
        }
    });

    var contrast_min50 = document.getElementById(CONTRAST_MIN50_ID);
    if (contrast_min50) {
        contrast_min50.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(50%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(50%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_min25 = document.getElementById(CONTRAST_MIN25_ID);
    if (contrast_min25) {
        contrast_min25.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(75%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(75%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_0 = document.getElementById(CONTRAST_0_ID);
    if (contrast_0) {
        contrast_0.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(100%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(100%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var contrast_plus25 = document.getElementById(CONTRAST_PLUS25_ID);
    if (contrast_plus25) {
        contrast_plus25.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(125%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(125%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_plus50 = document.getElementById(CONTRAST_PLUS50_ID);
    if (contrast_plus50) {
        contrast_plus50.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(150%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(150%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleCold = document.getElementById(GRAYSCALECOLD_ID);
    if (grayscaleCold) {
        grayscaleCold.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "grayscale(100%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "grayscale(100%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleWarm = document.getElementById(GRAYSCALEWARM_ID);
    if (grayscaleWarm) {
        grayscaleWarm.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "grayscale(90%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "grayscale(90%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var sepia = document.getElementById(SEPIA_ID);
    if (sepia) {
        sepia.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "sepia(100%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "sepia(100%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(255, 255, 255,0)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var brown = document.getElementById(BROWN_ID);
    if (brown) {
        brown.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(100%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(100%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(65,43,22,0.4)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(65,43,22,0.4)";

        });
    }

    var ochre = document.getElementById(OCHRE_ID);
    if (ochre) {
        ochre.addEventListener("click", function () {
            document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(100%)";
            document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(100%)";

            document.querySelector("div.cropper-canvas > img").style.backgroundColor = "rgba(210,114,27,0.4)";
            document.querySelector("span.cropper-view-box > img").style.backgroundColor = "rgba(210,114,27,0.4)";
        });
    }


    var classname = document.getElementsByClassName("textureSelector");

    var setTexture = function () {
        var txtSrc = this.getAttribute("txtSrc");

        document.querySelector("div.cropper-canvas > img").style.backgroundImage = "url(" + image.src + "), url(" + txtSrc + ")";
        document.querySelector("div.cropper-canvas > img").style.backgroundBlendMode = "multiply";
        document.querySelector("div.cropper-canvas > img").style.size = "100% 100%";

        document.querySelector("span.cropper-view-box > img").style.backgroundImage = "url(" + image.src + "), url(" + txtSrc + ")";
        document.querySelector("span.cropper-view-box > img").style.backgroundBlendMode = "multiply";
        document.querySelector("span.cropper-view-box > img").style.size = "100% 100%";
    };

    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', setTexture, false);
    }

    /*FRAME START*/
    var classname = document.getElementsByClassName("frameSelector");


    var frameWidth = wSliderMaxValue + 60;
    var frameHeight = hSliderMaxValue + 60;

    document.styleSheets[0].addRule('#frame', 'height: ' + frameHeight + 'px; width: ' + frameWidth + 'px');
    document.styleSheets[0].insertRule('#frame { height: ' + frameHeight + 'px; width: ' + frameWidth + 'px }', 0);

    var showFrame = function(){
        document.styleSheets[0].addRule('.frameSide', 'display: block; ');
        document.styleSheets[0].insertRule('.frameSide { display: block }', 0);
    }
    var hideFrame = function(){
        document.styleSheets[0].addRule('.frameSide', 'display: none; ');
        document.styleSheets[0].insertRule('.frameSide { display: none }', 0);
    }


    var setFrame = function () {
        var frameName_corner = this.getAttribute("txtSrc");

        var frameName_line = frameName_corner.replace("_corner.png", "_line.png");
        var serverName = document.getElementById("serverName").value;

        var tmp_image = document.getElementById('picture');
        var imageWidth  = tmp_image.offsetWidth + 2;
        var imageHeight = tmp_image.offsetHeight + 2;

        //n
        document.styleSheets[0].addRule('#frame .n:before', 'background: url("' + serverName + frameName_line + '"); height:' + (imageWidth - 42) + 'px; left: ' + ((imageWidth - 32) / 2 + 20) + 'px; top:' + ((((imageWidth - 32) / 2 + 20) - 50) * (-1)) + 'px;');
        document.styleSheets[0].insertRule('#frame .n:before { background: url("' + serverName + frameName_line + '"); height:' + (imageWidth - 42) + 'px; left: ' + ((imageWidth - 32) / 2 + 20) + 'px; top:' + ((((imageWidth - 32) / 2 + 20) - 50) * (-1)) + 'px;}', 0);

        //ne
        document.styleSheets[0].addRule('#frame .ne', 'background: url("' + serverName + frameName_corner + '"); left:' + (imageWidth + 8) + 'px;');
        document.styleSheets[0].insertRule('#frame .ne { background: url("' + serverName + frameName_corner + '"); left:' + (imageWidth + 8) + 'px; }', 0);

        //e
        document.styleSheets[0].addRule('#frame .e', 'background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight - 40) + 'px; left:' + (imageWidth + 8) + 'px;');
        document.styleSheets[0].insertRule('#frame .e { background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight - 40) + 'px; left:' + (imageWidth + 8) + 'px; }', 0);

        //se
        document.styleSheets[0].addRule('#frame .se', 'background: url("' + serverName + frameName_corner + '"); left:' + (imageWidth + 8) + 'px; top:' + (imageHeight + 8) + 'px;');
        document.styleSheets[0].insertRule('#frame .se { background: url("' + serverName + frameName_corner + '"); left:' + (imageWidth + 8) + 'px; top:' + (imageHeight + 8) + 'px; }', 0);

        //s
        document.styleSheets[0].addRule('#frame .s', 'top:' + (imageHeight + 10) + 'px;');
        document.styleSheets[0].insertRule('#frame .s { top:' + (imageHeight + 10) + 'px; }', 0);

        document.styleSheets[0].addRule('#frame .s:before', 'background: url("' + serverName + frameName_line + '"); height:' + (imageWidth - 42) + 'px; left: ' + ((imageWidth - 32) / 2 + 20) + 'px; top:' + ((((imageWidth - 32) / 2 + 20) - 50) * (-1) - 2) + 'px;');
        document.styleSheets[0].insertRule('#frame .s:before { background: url("' + serverName + frameName_line + '"); height:' + (imageWidth - 42) + 'px; left: ' + ((imageWidth - 32) / 2 + 20) + 'px; top:' + ((((imageWidth - 32) / 2 + 20) - 50) * (-1) - 2) + 'px;}', 0);

        //sw
        document.styleSheets[0].addRule('#frame .sw', 'background: url("' + serverName + frameName_corner + '"); top:' + (imageHeight + 8) + 'px; ');
        document.styleSheets[0].insertRule('#frame .sw { background: url("' + serverName + frameName_corner + '"); top:' + (imageHeight + 8) + 'px;  }', 0);

        //w
        document.styleSheets[0].addRule('#frame .w', 'background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight - 40) + 'px;');
        document.styleSheets[0].insertRule('#frame .w { background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight - 40) + 'px; }', 0);

        //nw
        document.styleSheets[0].addRule('#frame .nw', 'background: url("' + serverName + frameName_corner + '")');
        document.styleSheets[0].insertRule('#frame .nw { background: url("' + serverName + frameName_corner + '") }', 0);

        showFrame();
    };

    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', setFrame, false);
    }


    /*FRAME END*/

    /*FILE START*/
    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;
        $('#form-upload').remove();
        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" accept="image/jpeg,image/png,image/gif"/></form>');
        $('#form-upload input[name=\'file\']').trigger('click');
        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }
        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();
                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }
                        if (json['success']) {
                            alert(json['success']);
                            $(node).parent().find('input').attr('value', json['code']);

                            /*CUSTOM CODE START*/

                            document.getElementById('image').src = json['new_file'];
                            cropper.destroy();
                            cropper = new Cropper(image, options);

                            wSliderMaxValue = image.offsetWidth + 2;
                            hSliderMaxValue = image.offsetHeight + 2;


                            hSlider.noUiSlider.updateOptions({
                                range: {
                                    'min': hSliderMinValue,
                                    'max': hSliderMaxValue
                                }
                            });
                            wSlider.noUiSlider.updateOptions({
                                range: {
                                    'min': wSliderMinValue,
                                    'max': wSliderMaxValue
                                }
                            });

                            var loaded = false;
                             var img = document.createElement('img');

                             img.onload = function () { loaded = true; };
                             img.src = json['new_file'];

                             var wait = setInterval(function () {
                             if (loaded) {
                             clearInterval(wait);
                             } else {
                                console.log(img.naturalWidth, img.naturalHeight);
                                var tmp = document.getElementById('picture');
                                 frameWidth  = tmp.naturalWidth + 60;
                                 frameHeight = tmp.naturalHeight + 60;

                                 document.styleSheets[0].addRule('#frame', 'height: ' + frameHeight + 'px; width: ' + frameWidth + 'px');
                                 document.styleSheets[0].insertRule('#frame { height: ' + frameHeight + 'px; width: ' + frameWidth + 'px }', 0);
                                 hideFrame();

                                 /*classname = document.getElementsByClassName("frameSelector");
                                 for (var i = 0; i < classname.length; i++) {
                                     classname[i].children[0].children[0].checked = false;
                                     classname[i].addEventListener('click', setFrame, false);
                                 }*/
                             }
                             }, 0);



                            //document.querySelector("div.cropper-canvas > img").style.backgroundImage = "url(" + json['new_file'] + ")";
                            //document.querySelector("span.cropper-view-box > img").style.backgroundImage = "url(" + json['new_file'] + ")";
                            /*CUSTOM CODE END*/
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    /*FILE END*/

}

document.addEventListener("DOMContentLoaded", ready);