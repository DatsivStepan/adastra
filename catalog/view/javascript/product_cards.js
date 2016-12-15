/**
 * Created by lexlazzy on 24.11.2016.
 */

function ready() {

    var setFrame = function () {};
    var checkTooltip = function(){};

    var image = document.getElementById('image');
    var picture =  document.getElementById('picture');
    var imageContainer = document.getElementById('product_image-pc');
    var imageContainerWidth = imageContainer.offsetWidth;
    imageContainer.style.height = imageContainer.offsetWidth+"px";
    var frameWidth     = imageContainerWidth;
    var imageMaxWidth  = frameWidth - 60;

    var calcFrameBox = function(){

        picture.style.width = "100%";
        picture.style.maxWidth = (frameWidth - 60)+"px";

        image.style.width = "100%";
        image.style.maxWidth = (frameWidth - 60)+"px";

        document.styleSheets[0].addRule('#frame', 'height: ' + (image.offsetHeight + 60) + 'px; width: ' + frameWidth + 'px');
        document.styleSheets[0].insertRule('#frame { height: ' + (image.offsetHeight + 60) + 'px; width: ' + frameWidth + 'px }', 0);
    };
    calcFrameBox();

    //document.getElementById('product_image-pc').style.height = (image.offsetHeight + 60) + 'px';

    picture.style.background = "url("+image.src+")";
    picture.style.backgroundSize = "contain";

    picture.style.height = image.offsetHeight+"px";
    image.style.display = "none";

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

    //потом
    var MAX_CROPPER_SIZE_ID = "maxCropperSize";

    var MAX_CROPPER_SIZE = document.getElementById(MAX_CROPPER_SIZE_ID);

    //ELEMENTS DEFINITION
    var frameName_corner = "";


    var heightInput = document.querySelector("input#" + HEIGHT_ID);
    var widthInput = document.querySelector("input#" + WIDTH_ID);
    widthInput.onChange = function(){};
    heightInput.onChange = function(){};

    var wSliderRealMinValue = 1;
    var wSliderRealMaxValue = 2;

    var hSliderRealMinValue = 1;
    var hSliderRealMaxValue = 2;

    var classname = document.getElementsByClassName("textureSelector");

    var setTexture = function () {
        var txtSrc = this.getAttribute("txtSrc");

        picture.style.backgroundImage = "url(" + image.src + "), url(" + txtSrc + ")";
        picture.style.backgroundBlendMode = "multiply";
        picture.style.background = "url('" + image.src + "') 0% 0% / contain, url('"+ txtSrc +"') 100% 100% / cover";

        textureWidth   = parseInt(this.children[0].getAttribute('textureWidth'));
        textureHeight  = parseInt(this.children[0].getAttribute('textureHeight'));

        if(MAX_CROPPER_SIZE.checked){
            MAX_CROPPER_SIZE.dispatchEvent(new Event("click"));
        }
        checkTooltip();
        /*var event = new Event("change");
        widthInput.dispatchEvent(event);
        heightInput.dispatchEvent(event);*/
    };

    var textureWidth  = 0;
    var textureHeight = 0;
    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', setTexture, false);
        if(classname[i].children[0].checked){
            textureWidth  = parseInt(classname[i].children[0].getAttribute("textureWidth"));
            textureHeight = parseInt(classname[i].children[0].getAttribute("textureHeight"));
        }
        checkTooltip();
    }
    classname[0].click();

    var pictureRealHeight = parseInt(image.getAttribute('realheight'));
    var pictureRealWidth  = parseInt(image.getAttribute('realwidth'));

    var checkSliderSize = function(){
        if(pictureRealWidth <= textureWidth){
            wSliderRealMaxValue = textureWidth;
        }else{
            wSliderRealMaxValue = Math.ceil(pictureRealWidth/textureWidth)*textureWidth;
        }

        if(pictureRealHeight <= textureHeight){
            hSliderRealMaxValue = textureHeight;
        }else{
            hSliderRealMaxValue = Math.ceil(pictureRealHeight/textureHeight)*textureHeight;
        }
    }
    checkSliderSize();

    document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
    document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

    var wSliderMinValue = 0;
    var wSliderMaxValue = picture.offsetWidth;

    var hSliderMinValue = 0;
    var hSliderMaxValue = picture.offsetHeight;

    var hStart = hSliderMaxValue*pictureRealHeight/hSliderRealMaxValue;
    var wStart = wSliderMaxValue*pictureRealWidth/wSliderRealMaxValue;

    heightInput.value = pictureRealHeight;
    widthInput.value = pictureRealWidth;
    var setSliderLabels = function (width, height) {

        var w = Math.round(width * wSliderRealMaxValue / wSliderMaxValue);

        document.styleSheets[0].addRule('#wSlider .noUi-handle:before', 'content: "' + w + '"');
        document.styleSheets[0].insertRule('#wSlider .noUi-handle:before { content: "' + w + '" }', 0);
        //ширина
        widthInput.value = w;

        var h = Math.round(height * hSliderRealMaxValue / hSliderMaxValue);

        document.styleSheets[0].addRule('#hSlider .noUi-handle:before', 'content: "' + h + '"');
        document.styleSheets[0].insertRule('#hSlider .noUi-handle:before { content: "' + h + '" }', 0);

        //высота
        heightInput.value = h;
    };

    var wSlider = document.getElementById('wSlider');
    var hSlider = document.getElementById('hSlider');

    noUiSlider.create(wSlider, {
        start: wStart,
        connect: [true, false],
        animate: false,
        range: {
            'min': wSliderMinValue,
            'max': wSliderMaxValue
        }
    });
    noUiSlider.create(hSlider, {
        start: hStart,
        connect: [true, false],
        animate: false,
        range: {
            'min': hSliderMinValue,
            'max': hSliderMaxValue
        }
    });

    wSlider.noUiSlider.on('update', function () {
        setSliderLabels(wSlider.noUiSlider.get() * 1, hSlider.noUiSlider.get() * 1);

        var height = parseFloat(heightInput.value);
        var width  = parseFloat(widthInput.value);

        var aspectRatio = imageContainer.offsetWidth/imageContainer.offsetHeight;

        var frame = document.getElementById('frame');
        //var frameHeight = imageContainer.offsetHeight - 60;
        //var frameWidth  = imageContainer.offsetWidth - 20;

        var w, h;
        if(width > height){
            w = (imageContainer.offsetWidth-60);

            h = (imageContainer.offsetHeight-60)*(height/width);
        }else{
            w = width/height*(imageContainer.offsetWidth-60);

            h = imageContainer.offsetHeight - 60;
        }


        picture.style.maxWidth = (w)+"px";
        picture.style.height = (h)+"px";

        document.styleSheets[0].addRule('#frame', 'height: ' + (h+60) + 'px; width: ' + (w+60) + 'px');
        document.styleSheets[0].insertRule('#frame { height: ' + (h+60) + 'px; width: ' + (w+60) + 'px }', 0);


        setFrame(frameName_corner);
        checkTooltip();
        recalculateprice();
    });

    hSlider.noUiSlider.on('update', function () {
        setSliderLabels(wSlider.noUiSlider.get() * 1, hSlider.noUiSlider.get() * 1);

        var height = parseFloat(heightInput.value);
        var width  = parseFloat(widthInput.value);

        var aspectRatio = imageContainer.offsetWidth/imageContainer.offsetHeight;

        var frame = document.getElementById('frame');
        //var frameHeight = imageContainer.offsetHeight - 60;
        //var frameWidth  = imageContainer.offsetWidth - 20;

        var w, h;
        if(width > height){
            w = (imageContainer.offsetWidth-60);

            h = (imageContainer.offsetHeight-60)*(height/width);
        }else{
            w = width/height*(imageContainer.offsetWidth-60);

            h = imageContainer.offsetHeight - 60;
        }

        w = w < 40 ? 40 : w;
        h = h < 20 ? 20 : h;
        picture.style.maxWidth = (w)+"px";
        picture.style.height = (h)+"px";

        document.styleSheets[0].addRule('#frame', 'height: ' + (h+60) + 'px; width: ' + (w+60) + 'px');
        document.styleSheets[0].insertRule('#frame { height: ' + (h+60) + 'px; width: ' + (w+60) + 'px }', 0);


        setFrame(frameName_corner);
        checkTooltip();
        recalculateprice();
    });

    setSliderLabels(wSlider.noUiSlider.get() * 1, hSlider.noUiSlider.get() * 1);

    VMasker(widthInput).maskNumber();
    widthInput.addEventListener("change", function () {

        if(parseInt(this.value) > 10000){
            this.value = 10000;
        }

        if(MAX_CROPPER_SIZE.checked){
            if(parseInt(this.value) > textureWidth){
                this.value = textureWidth;
            }
        }
        wSliderRealMaxValue = Math.ceil(this.value/textureWidth)*textureWidth;

        document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;

        var w = this.value * wSliderMaxValue / wSliderRealMaxValue;

        wSlider.noUiSlider.set([w, null]);

        setSliderLabels(w, hSlider.noUiSlider.get() * 1);
        checkTooltip();
    });

    VMasker(heightInput).maskNumber();
    heightInput.addEventListener("change", function () {

        if(parseInt(this.value) > 10000){
            this.value = 10000;
        }
        if(MAX_CROPPER_SIZE.checked){
            if(parseInt(this.value) > textureHeight){
                this.value = textureHeight;
            }
        }

        hSliderRealMaxValue = Math.ceil(this.value/textureHeight)*textureHeight;

        document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

        var h = this.value * hSliderMaxValue / hSliderRealMaxValue;

        hSlider.noUiSlider.set([h, null]);

        setSliderLabels(wSlider.noUiSlider.get() * 1, h);
        checkTooltip();
    });

    //setSliderLabels(wSliderMaxValue * CROPPER_ASPECT_RATIO, hSliderMaxValue * CROPPER_ASPECT_RATIO);

    MAX_CROPPER_SIZE.addEventListener("click", function () {
        if(this.checked){
            var classname = document.getElementsByClassName("textureSelector");
            for (var i = 0; i < classname.length; i++) {
                classname[i].addEventListener('click', setTexture, false);
                if(classname[i].children[0].checked){
                    var textureWidth  = parseInt(classname[i].children[0].getAttribute("textureWidth"));
                    var textureHeight = parseInt(classname[i].children[0].getAttribute("textureHeight"));
                }
            }

            hSliderRealMaxValue = textureHeight;
            wSliderRealMaxValue = textureWidth;

            document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;
            document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;

            if(parseInt(heightInput.value) > textureHeight){
                var h = hSliderMaxValue;
            }else{
                var h = hSlider.noUiSlider.get()*1;
            }

            if(parseInt(widthInput.value) > textureWidth){
                var w = wSliderMaxValue;
            }else{
                var w = wSlider.noUiSlider.get()*1;
            }
            hSlider.noUiSlider.set([h, null]);
            wSlider.noUiSlider.set([w, null]);

            setSliderLabels(w, h);
        }
        checkTooltip();
    });

    var contrast_min50 = document.getElementById(CONTRAST_MIN50_ID);
    if (contrast_min50) {
        contrast_min50.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(50%)";
            picture.style.webkitFilter = "contrast(50%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_min25 = document.getElementById(CONTRAST_MIN25_ID);
    if (contrast_min25) {
        contrast_min25.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(75%)";
            picture.style.webkitFilter = "contrast(75%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_0 = document.getElementById(CONTRAST_0_ID);
    if (contrast_0) {
        contrast_0.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var contrast_plus25 = document.getElementById(CONTRAST_PLUS25_ID);
    if (contrast_plus25) {
        contrast_plus25.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(125%)";
            picture.style.webkitFilter = "contrast(125%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_plus50 = document.getElementById(CONTRAST_PLUS50_ID);
    if (contrast_plus50) {
        contrast_plus50.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(150%)";
            picture.style.webkitFilter = "contrast(150%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleCold = document.getElementById(GRAYSCALECOLD_ID);
    if (grayscaleCold) {
        grayscaleCold.addEventListener("click", function () {
            picture.style.webkitFilter = "grayscale(100%)";
            picture.style.webkitFilter = "grayscale(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleWarm = document.getElementById(GRAYSCALEWARM_ID);
    if (grayscaleWarm) {
        grayscaleWarm.addEventListener("click", function () {
            picture.style.webkitFilter = "grayscale(90%)";
            picture.style.webkitFilter = "grayscale(90%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var sepia = document.getElementById(SEPIA_ID);
    if (sepia) {
        sepia.addEventListener("click", function () {
            picture.style.webkitFilter = "sepia(100%)";
            picture.style.webkitFilter = "sepia(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var brown = document.getElementById(BROWN_ID);
    if (brown) {
        brown.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(65,43,22,0.4)";
            picture.style.backgroundColor = "rgba(65,43,22,0.4)";

        });
    }

    var ochre = document.getElementById(OCHRE_ID);
    if (ochre) {
        ochre.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(210,114,27,0.4)";
            picture.style.backgroundColor = "rgba(210,114,27,0.4)";
        });
    }




    /*FRAME START*/
    var classname = document.getElementsByClassName("frameSelector");

    var showFrame = function(){
        document.styleSheets[0].addRule('.frameSide', 'display: block; ');
        document.styleSheets[0].insertRule('.frameSide { display: block }', 0);
    }
    var hideFrame = function(){
        document.styleSheets[0].addRule('.frameSide', 'display: none; ');
        document.styleSheets[0].insertRule('.frameSide { display: none }', 0);
    }


    setFrame = function (frameName_corner) {
        //var frameName_corner = this.getAttribute("txtSrc");

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
        document.styleSheets[0].addRule('#frame .e', 'background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight + 28) + 'px; left:' + (imageWidth + 8) + 'px;');
        document.styleSheets[0].insertRule('#frame .e { background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight + 28) + 'px; left:' + (imageWidth + 8) + 'px; }', 0);

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
        document.styleSheets[0].addRule('#frame .w', 'background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight +28) + 'px;');
        document.styleSheets[0].insertRule('#frame .w { background: url("' + serverName + frameName_line + '"); height: ' + (imageHeight +28) + 'px; }', 0);

        //nw
        document.styleSheets[0].addRule('#frame .nw', 'background: url("' + serverName + frameName_corner + '")');
        document.styleSheets[0].insertRule('#frame .nw { background: url("' + serverName + frameName_corner + '") }', 0);

        showFrame();
    };

    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', function(){
            frameName_corner = this.getAttribute("txtSrc");
            setFrame(frameName_corner);
        }, false);
    }

    /*FRAME END*/

    checkTooltip = function(){
        if(parseInt(widthInput.value) > textureWidth){
            var wHint = "Выбранное значение превышает ширину текстуры ("+textureWidth+"см). Картина будет с вертикальным(и) стыком";
            document.getElementById('wHint').innerHTML = wHint;
            document.getElementById('wHint').style.display = "block";
        }else{
            document.getElementById('wHint').style.display = "none";
        }
        if(parseInt(heightInput.value) > textureHeight){
            var hHint = "Выбранное значение превышает высоту текстуры ("+textureHeight+"см). Картина будет с горизонтальным(и) стыком";
            document.getElementById('hHint').innerHTML = hHint;
            document.getElementById('hHint').style.display = "block";
        }else{
            document.getElementById('hHint').style.display = "none";
        }
    };
    checkTooltip();

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

                            var loaded = false;
                            var img = document.createElement('img');

                            img.onload = function () { loaded = true; };
                            img.src = json['new_file'];

                            var wait = setInterval(function () {
                                if (loaded) {
                                    clearInterval(wait);

                                    console.log(img.naturalWidth, img.naturalHeight);
                                    var tmp = document.getElementById('picture');

                                    var classname = document.getElementsByClassName("textureSelector");
                                    for (var i = 0; i < classname.length; i++) {
                                        classname[i].addEventListener('click', setTexture, false);
                                        if(classname[i].children[0].checked){
                                            var textureSrc  = classname[i].getAttribute("txtSrc");
                                        }
                                        checkTooltip();
                                    }

                                    document.getElementById('image').src = json['new_file'];
                                    document.getElementById('picture').style.background = "url("+json['new_file']+") 0% 0% / contain, url("+textureSrc+") 100% 100% / cover";

                                    frameWidth  = tmp.naturalWidth + 60;
                                    frameHeight = tmp.naturalHeight + 60;

                                    document.styleSheets[0].addRule('#frame', 'height: ' + frameHeight + 'px; width: ' + frameWidth + 'px');
                                    document.styleSheets[0].insertRule('#frame { height: ' + frameHeight + 'px; width: ' + frameWidth + 'px }', 0);
                                    hideFrame();
                                } else {

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

    var classname = document.getElementsByClassName("textureSelector");
    classname[1].dispatchEvent(new Event("click"));
    classname[0].dispatchEvent(new Event("click"));
}

//document.addEventListener("DOMContentLoaded", ready);

window.onload = ready;