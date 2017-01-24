/**
 * Created by lexlazzy on 24.11.2016.
 */
var global_img;
var orientation = true;
var tmp_imageClientWidth = 0;
var tmp_imageClientHeight = 0;
var PICTURE_ASPECT_RATIO = 1;
var CROPPER_ASPECT_RATIO = 1;
var frameName_corner = "";
function ready() {

    var setFrame = function () {
    };
    var checkTooltip = function () {
    };

    var image = document.getElementById('image');
    var imageClientWidth  = image.clientWidth;
    var imageClientHeight = image.clientHeight;
    var picture = document.getElementById('picture');
    var imageContainer = document.getElementById('product_image-pc');
    var imageContainerWidth = imageContainer.offsetWidth;
    imageContainer.style.height = imageContainer.offsetWidth + "px";
    var frameWidth = imageContainerWidth;
    var imageMaxWidth = frameWidth - 60;

    var calcFrameBox = function () {
        var cont_a_r = imageClientWidth/imageClientHeight;
        var cont_w = 0;
        var cont_h = 0;

        if(imageClientWidth > imageClientHeight){
            var cont_w = 500;
            var cont_h = (500 / cont_a_r).toFixed();
        }else{
            var cont_h = 500;
            var cont_w = (500 * cont_a_r).toFixed();
        }

        picture.style.width = "100%";
        //picture.style.maxWidth = (frameWidth - 60) + "px";
        picture.style.maxWidth  = cont_w + "px";
        picture.style.maxHeight = cont_h + "px";

        image.style.width = "100%";
        image.style.maxWidth = (frameWidth - 60) + "px";

        $('#frame').css({"height": (image.offsetHeight + 60) + 'px', "width": frameWidth + 'px'});
    };
    calcFrameBox();


    picture.style.background = "url(" + image.src + ")";
    picture.style.backgroundSize = "contain";

    picture.style.height = image.offsetHeight + "px";
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

    var DIGITAL_WIDTH_ID  = "цифровая_ширина";
    var DIGITAL_HEIGHT_ID = "цифровая_высота";
    var HORIZONTAL_DISPLACEMENT_ID = "горизонтальное_смещение";
    var VERTICAL_DISPLACEMENT_ID   = "вертикальное_смещение";

    var DIGITAL_WIDTH  = document.getElementById(DIGITAL_WIDTH_ID);
    var DIGITAL_HEIGHT = document.getElementById(DIGITAL_HEIGHT_ID);
    var HORIZONTAL_DISPLACEMENT = document.getElementById(HORIZONTAL_DISPLACEMENT_ID);
    var VERTICAL_DISPLACEMENT   = document.getElementById(VERTICAL_DISPLACEMENT_ID);

    //потом
    var MAX_CROPPER_SIZE_ID = "maxCropperSize";
    var PHOTO_ON_ID = "photoOn";

    var PHOTO_ON = document.getElementById(PHOTO_ON_ID);

    var MAX_CROPPER_SIZE = document.getElementById(MAX_CROPPER_SIZE_ID);

    //ELEMENTS DEFINITION
     frameName_corner = "";


    var heightInput = document.querySelector("input#" + HEIGHT_ID);
    var widthInput = document.querySelector("input#" + WIDTH_ID);
    widthInput.onChange = function () {
    };
    heightInput.onChange = function () {
    };

    var wSliderRealMinValue = 1;
    var wSliderRealMaxValue = 2;

    var hSliderRealMinValue = 1;
    var hSliderRealMaxValue = 2;

    var classname = document.getElementsByClassName("textureSelector");

    var setTexture = function () {
        var txtSrc = this.getAttribute("txtSrc");

        picture.style.backgroundImage = "url(" + image.src + "), url(" + txtSrc + ")";
        picture.style.backgroundBlendMode = "multiply";
        picture.style.background = "url('" + image.src + "'), url('" + txtSrc + "')";
        picture.style.backgroundSize = "100% 100%";

        textureWidth = parseInt(this.children[0].getAttribute('textureWidth'));
        textureHeight = parseInt(this.children[0].getAttribute('textureHeight'));


        //if (MAX_CROPPER_SIZE.checked) {
            MAX_CROPPER_SIZE.dispatchEvent(new Event("click"));
        //}
        checkTooltip();
    };

    var textureWidth = 0;
    var textureHeight = 0;
    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', setTexture, false);
        if (classname[i].children[0].checked) {
            textureWidth = parseInt(classname[i].children[0].getAttribute("textureWidth"));
            textureHeight = parseInt(classname[i].children[0].getAttribute("textureHeight"));
        }
        checkTooltip();
    }
    if (classname[0]) {
        classname[0].click();
    }

    var pictureRealHeight = parseInt(image.getAttribute('realheight'));
    var pictureRealWidth = parseInt(image.getAttribute('realwidth'));

    var checkSliderSize = function () {
        if (pictureRealWidth <= textureWidth) {
            wSliderRealMaxValue = textureWidth;
        } else {
            wSliderRealMaxValue = Math.ceil(pictureRealWidth / textureWidth) * textureWidth;
        }

        if (pictureRealHeight <= textureHeight) {
            hSliderRealMaxValue = textureHeight;
        } else {
            hSliderRealMaxValue = Math.ceil(pictureRealHeight / textureHeight) * textureHeight;
        }
    }
    checkSliderSize();

    document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
    document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

    var wSliderMinValue = 0;
    var wSliderMaxValue = picture.offsetWidth;

    var hSliderMinValue = 0;
    var hSliderMaxValue = picture.offsetHeight;

    var hStart = hSliderMaxValue * pictureRealHeight / hSliderRealMaxValue;
    var wStart = wSliderMaxValue * pictureRealWidth / wSliderRealMaxValue;

    PICTURE_ASPECT_RATIO = pictureRealWidth/pictureRealHeight;
    CROPPER_ASPECT_RATIO = 1;

    heightInput.value = pictureRealHeight;
    widthInput.value = pictureRealWidth;
    var setSliderLabels = function (width, height) {

        var w = Math.round(width * wSliderRealMaxValue / wSliderMaxValue);

        document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
        //ширина
        widthInput.value = w;

        var h = Math.round(height * hSliderRealMaxValue / hSliderMaxValue);

        document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

        //высота
        heightInput.value = h;
    };

    var wSlider = document.getElementById('wSlider');
    var hSlider = document.getElementById('hSlider');

    /*
     если заданы все 4 вспомогательные опции кропика инициализируем необходимые обьекты
     в противном случае только пропорционально меняем высоту и ширину
     */
    if (DIGITAL_WIDTH && DIGITAL_HEIGHT && HORIZONTAL_DISPLACEMENT && VERTICAL_DISPLACEMENT) {
        //var image = document.getElementById('image');

        var cropper = new Cropper(image, {
            viewMode:3,
            zoomable: false,
            ready: function(e){
                var crop_container = cropper.getContainerData();
                var c_side = 0;
                if(crop_container.width > crop_container.height){
                    c_side = (crop_container.height/2).toFixed();
                }else{
                    c_side = (crop_container.width/2).toFixed();
                }

                var x = (crop_container.width/2  - c_side/2).toFixed();
                var y = (crop_container.height/2 - c_side/2).toFixed();
                var data = cropper.getCropBoxData();
                data.left = x*1;
                data.top = y*1;
                data.width = c_side*1;
                data.height = c_side*1;
                cropper.setCropBoxData(data);
            },
            crop: function(e) {

                DIGITAL_WIDTH.value  = Math.round(e.detail.width);
                DIGITAL_HEIGHT.value = Math.round(e.detail.height);
                HORIZONTAL_DISPLACEMENT.value = Math.round(e.detail.x);
                VERTICAL_DISPLACEMENT.value   = Math.round(e.detail.y);

                CROPPER_ASPECT_RATIO = (DIGITAL_WIDTH.value/DIGITAL_HEIGHT.value).toFixed(2);
            },
            cropend: function(e){
                var c_r_width  = widthInput.value;
                var c_r_height = heightInput.value;

                var w = c_r_width;
                var h = (c_r_width/CROPPER_ASPECT_RATIO).toFixed();

                wSliderRealMaxValue = Math.ceil(w / textureWidth) * textureWidth;
                hSliderRealMaxValue = Math.ceil(h / textureHeight) * textureHeight;

                document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
                document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

                wSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': wSliderRealMaxValue
                    }
                });
                hSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': hSliderRealMaxValue
                    }
                });

                wSlider.noUiSlider.set([w, null]);
                hSlider.noUiSlider.set([h, null]);

                widthInput.value  = w;
                heightInput.value = h;

                document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
                document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

                checkTooltip();
                recalculateprice();
            }
        });

        noUiSlider.create(wSlider, {
            start: pictureRealWidth,
            connect: [true, false],
            animate: false,
            tooltips: true,
            step: 1,
            range: {
                'min': 0,
                'max': wSliderRealMaxValue
            }
        });
        noUiSlider.create(hSlider, {
            start: pictureRealHeight,
            connect: [true, false],
            animate: false,
            tooltips: true,
            step: 1,
            range: {
                'min': 0,
                'max': hSliderRealMaxValue
            }
        });
        document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(pictureRealWidth);
        document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(pictureRealHeight);

        wSlider.noUiSlider.on('slide', function () {
            var pre_height = parseFloat(heightInput.value);
            var pre_width = parseFloat(widthInput.value);

            var c_width  = wSlider.noUiSlider.get() * 1;
            var c_height = hSlider.noUiSlider.get() * 1;

            var w = c_width;
            var h = pre_height;

            h = Math.round(c_width/CROPPER_ASPECT_RATIO);

            if(h <= 1 || h > hSliderRealMaxValue){
                h = pre_height;
                w = pre_width;

                wSlider.noUiSlider.set(w);
                hSlider.noUiSlider.set(h);
            }else{
                hSlider.noUiSlider.set(h);
            }

            heightInput.value = h;
            widthInput.value = w;

            document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
            document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

            checkTooltip();
            recalculateprice();
        });

        hSlider.noUiSlider.on('slide', function () {
            var pre_height = parseFloat(heightInput.value);
            var pre_width = parseFloat(widthInput.value);

            var c_width  = wSlider.noUiSlider.get() * 1;
            var c_height = hSlider.noUiSlider.get() * 1;

            var w = pre_width;
            var h = c_height;

            w = Math.round(c_height*CROPPER_ASPECT_RATIO);

            if(w <= 1 || w > wSliderRealMaxValue){
                h = pre_height;
                w = pre_width;

                wSlider.noUiSlider.set(w);
                hSlider.noUiSlider.set(h);
            }else{
                wSlider.noUiSlider.set(w);
            }

            heightInput.value = h;
            widthInput.value = w;

            document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
            document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

            checkTooltip();
            recalculateprice();
        });

        VMasker(widthInput).maskNumber();
        widthInput.addEventListener("change", function () {
            MAX_CROPPER_SIZE.checked = false;
            var pre_height = hSlider.noUiSlider.get() * 1;
            var pre_width  = wSlider.noUiSlider.get() * 1;

            if (parseInt(this.value) > 10000) {
                this.value = 10000;
            }

            if (MAX_CROPPER_SIZE.checked) {
                if (parseInt(this.value) > textureWidth) {
                    this.value = textureWidth;
                }
            }

            var h = Math.round(this.value/CROPPER_ASPECT_RATIO);

            heightInput.value = h;
            if(h <= 1){
                h = pre_height;
                w = pre_width;

                widthInput.value  = w;
                heightInput.value = h;
            }

            wSliderRealMaxValue = Math.ceil(this.value / textureWidth) * textureWidth;
            hSliderRealMaxValue = Math.ceil(h / textureHeight) * textureHeight;

            document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
            document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

            wSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': wSliderRealMaxValue
                }
            });
            hSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': hSliderRealMaxValue
                }
            });

            wSlider.noUiSlider.set([this.value, null]);
            hSlider.noUiSlider.set([h, null]);



            checkTooltip();
            recalculateprice();
        });

        VMasker(heightInput).maskNumber();
        heightInput.addEventListener("change", function () {
            MAX_CROPPER_SIZE.checked = false;
            var pre_height = hSlider.noUiSlider.get() * 1;
            var pre_width  = wSlider.noUiSlider.get() * 1;

            if (parseInt(this.value) > 10000) {
                this.value = 10000;
            }

            if (MAX_CROPPER_SIZE.checked) {
                if (parseInt(this.value) > textureHeight) {
                    this.value = textureHeight;
                }
            }

            var w = Math.round(this.value*CROPPER_ASPECT_RATIO);

            widthInput.value = w;
            if(w <= 1){
                h = pre_height;
                w = pre_width;

                widthInput.value  = w;
                heightInput.value = h;
            }

            wSliderRealMaxValue = Math.ceil(w / textureWidth) * textureWidth;
            hSliderRealMaxValue = Math.ceil(this.value / textureHeight) * textureHeight;

            document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
            document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

            wSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': wSliderRealMaxValue
                }
            });
            hSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': hSliderRealMaxValue
                }
            });

            wSlider.noUiSlider.set([w, null]);
            hSlider.noUiSlider.set([this.value, null]);

            checkTooltip();
            recalculateprice();
        });

        MAX_CROPPER_SIZE.addEventListener("click", function () {
            if (this.checked) {
                var classname = document.getElementsByClassName("textureSelector");
                for (var i = 0; i < classname.length; i++) {
                    classname[i].addEventListener('click', setTexture, false);
                    if (classname[i].children[0].checked) {
                        var textureWidth = parseInt(classname[i].children[0].getAttribute("textureWidth"));
                        var textureHeight = parseInt(classname[i].children[0].getAttribute("textureHeight"));
                    }
                }

                hSliderRealMaxValue = textureHeight;
                wSliderRealMaxValue = textureWidth;

                document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;
                document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;

                var h = 0;
                var w = 0;
                if(pictureRealHeight < pictureRealWidth){
                    if(pictureRealWidth > textureWidth){
                        w = textureWidth;
                    }else{
                        w = pictureRealWidth;
                    }
                    h = Math.round(w / CROPPER_ASPECT_RATIO);
                    if(h > textureHeight){
                        h = textureHeight;
                    }
                    w = Math.round(h*CROPPER_ASPECT_RATIO);
                }else{
                    if(pictureRealHeight > textureHeight){
                        h = textureHeight;
                    }else{
                        h = pictureRealHeight;
                    }
                    w = Math.round(h * CROPPER_ASPECT_RATIO);
                    if(w > textureWidth){
                        w = textureWidth;
                    }
                    h = Math.round(w/CROPPER_ASPECT_RATIO);
                }

                wSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': wSliderRealMaxValue
                    }
                });
                hSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': hSliderRealMaxValue
                    }
                });

                hSlider.noUiSlider.set([h, null]);
                wSlider.noUiSlider.set([w, null]);

                widthInput.value  = w;
                heightInput.value = h;

                document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
                document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);
            }
            checkTooltip();
            recalculateprice();
        });

    }
    else
        {
        noUiSlider.create(wSlider, {
            start: pictureRealWidth,
            connect: [true, false],
            animate: false,
            tooltips: true,
            step: 1,
            range: {
                'min': 0,
                'max': wSliderRealMaxValue
            }
        });
        noUiSlider.create(hSlider, {
            start: pictureRealHeight,
            connect: [true, false],
            animate: false,
            tooltips: true,
            step: 1,
            range: {
                'min': 0,
                'max': hSliderRealMaxValue
            }
        });
        document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(pictureRealWidth);
        document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(pictureRealHeight);

        wSlider.noUiSlider.on('slide', function () {
            var pre_height = parseFloat(heightInput.value);
            var pre_width = parseFloat(widthInput.value);

            var c_width  = wSlider.noUiSlider.get() * 1;
            var c_height = hSlider.noUiSlider.get() * 1;

            var w = c_width;
            var h = pre_height;

            h = Math.round(c_width/PICTURE_ASPECT_RATIO);

            if(h <= 1 || h > hSliderRealMaxValue){
                h = pre_height;
                w = pre_width;

                wSlider.noUiSlider.set(w);
                hSlider.noUiSlider.set(h);
            }else{
                hSlider.noUiSlider.set(h);
            }

            heightInput.value = h;
            widthInput.value = w;

            document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
            document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

            checkTooltip();
            recalculateprice();
        });

        hSlider.noUiSlider.on('slide', function () {
            var pre_height = parseFloat(heightInput.value);
            var pre_width = parseFloat(widthInput.value);

            var c_width  = wSlider.noUiSlider.get() * 1;
            var c_height = hSlider.noUiSlider.get() * 1;

            var w = pre_width;
            var h = c_height;

            w = Math.round(c_height*PICTURE_ASPECT_RATIO);

            if(w <= 1 || w > wSliderRealMaxValue){
                h = pre_height;
                w = pre_width;

                wSlider.noUiSlider.set(w);
                hSlider.noUiSlider.set(h);
            }else{
                wSlider.noUiSlider.set(w);
            }

            heightInput.value = h;
            widthInput.value = w;

            document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
            document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);

            checkTooltip();
            recalculateprice();
        });

        VMasker(widthInput).maskNumber();
        widthInput.addEventListener("change", function () {
            MAX_CROPPER_SIZE.checked = false;
            var pre_height = hSlider.noUiSlider.get() * 1;
            var pre_width  = wSlider.noUiSlider.get() * 1;

            if (parseInt(this.value) > 10000) {
                this.value = 10000;
            }

            if (MAX_CROPPER_SIZE.checked) {
                if (parseInt(this.value) > textureWidth) {
                    this.value = textureWidth;
                }
            }

            var h = Math.round(this.value/PICTURE_ASPECT_RATIO);

            heightInput.value = h;
            if(h <= 1){
                h = pre_height;
                w = pre_width;

                widthInput.value  = w;
                heightInput.value = h;
            }

            wSliderRealMaxValue = Math.ceil(this.value / textureWidth) * textureWidth;
            hSliderRealMaxValue = Math.ceil(h / textureHeight) * textureHeight;

            document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
            document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

            wSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': wSliderRealMaxValue
                }
            });
            hSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': hSliderRealMaxValue
                }
            });

            wSlider.noUiSlider.set([this.value, null]);
            hSlider.noUiSlider.set([h, null]);



            checkTooltip();
            recalculateprice();
        });

        VMasker(heightInput).maskNumber();
        heightInput.addEventListener("change", function () {
            MAX_CROPPER_SIZE.checked = false;
            var pre_height = hSlider.noUiSlider.get() * 1;
            var pre_width  = wSlider.noUiSlider.get() * 1;

            if (parseInt(this.value) > 10000) {
                this.value = 10000;
            }

            if (MAX_CROPPER_SIZE.checked) {
                if (parseInt(this.value) > textureHeight) {
                    this.value = textureHeight;
                }
            }

            var w = Math.round(this.value*PICTURE_ASPECT_RATIO);

            widthInput.value = w;
            if(w <= 1){
                h = pre_height;
                w = pre_width;

                widthInput.value  = w;
                heightInput.value = h;
            }

            wSliderRealMaxValue = Math.ceil(w / textureWidth) * textureWidth;
            hSliderRealMaxValue = Math.ceil(this.value / textureHeight) * textureHeight;

            document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;
            document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;

            wSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': wSliderRealMaxValue
                }
            });
            hSlider.noUiSlider.updateOptions({
                range: {
                    'min': 0,
                    'max': hSliderRealMaxValue
                }
            });

            wSlider.noUiSlider.set([w, null]);
            hSlider.noUiSlider.set([this.value, null]);

            checkTooltip();
            recalculateprice();
        });

        MAX_CROPPER_SIZE.addEventListener("click", function () {
            if (this.checked) {
                var classname = document.getElementsByClassName("textureSelector");
                for (var i = 0; i < classname.length; i++) {
                    classname[i].addEventListener('click', setTexture, false);
                    if (classname[i].children[0].checked) {
                        var textureWidth = parseInt(classname[i].children[0].getAttribute("textureWidth"));
                        var textureHeight = parseInt(classname[i].children[0].getAttribute("textureHeight"));
                    }
                }

                hSliderRealMaxValue = textureHeight;
                wSliderRealMaxValue = textureWidth;

                document.getElementById('maxHeight').innerHTML = hSliderRealMaxValue;
                document.getElementById('maxWidth').innerHTML = wSliderRealMaxValue;

                var h = 0;
                var w = 0;
                if(pictureRealHeight < pictureRealWidth){
                    if(pictureRealWidth > textureWidth){
                        w = textureWidth;
                    }else{
                        w = pictureRealWidth;
                    }
                    h = Math.round(w / PICTURE_ASPECT_RATIO);
                    if(h > textureHeight){
                        h = textureHeight;
                    }
                    w = Math.round(h*PICTURE_ASPECT_RATIO);
                }else{
                    if(pictureRealHeight > textureHeight){
                        h = textureHeight;
                    }else{
                        h = pictureRealHeight;
                    }
                    w = Math.round(h * PICTURE_ASPECT_RATIO);
                    if(w > textureWidth){
                        w = textureWidth;
                    }
                    h = Math.round(w/PICTURE_ASPECT_RATIO);
                }

                wSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': wSliderRealMaxValue
                    }
                });
                hSlider.noUiSlider.updateOptions({
                    range: {
                        'min': 0,
                        'max': hSliderRealMaxValue
                    }
                });

                hSlider.noUiSlider.set([h, null]);
                wSlider.noUiSlider.set([w, null]);

                widthInput.value  = w;
                heightInput.value = h;

                document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(w);
                document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(h);
            }
            checkTooltip();
            recalculateprice();
        });
    }

    var contrast_min50 = document.getElementById(CONTRAST_MIN50_ID);
    if (contrast_min50) {
        contrast_min50.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(50%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_min25 = document.getElementById(CONTRAST_MIN25_ID);
    if (contrast_min25) {
        contrast_min25.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(75%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_0 = document.getElementById(CONTRAST_0_ID);
    if (contrast_0) {
        contrast_0.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var contrast_plus25 = document.getElementById(CONTRAST_PLUS25_ID);
    if (contrast_plus25) {
        contrast_plus25.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(125%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var contrast_plus50 = document.getElementById(CONTRAST_PLUS50_ID);
    if (contrast_plus50) {
        contrast_plus50.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(150%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleCold = document.getElementById(GRAYSCALECOLD_ID);
    if (grayscaleCold) {
        grayscaleCold.addEventListener("click", function () {
            picture.style.webkitFilter = "grayscale(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var grayscaleWarm = document.getElementById(GRAYSCALEWARM_ID);
    if (grayscaleWarm) {
        grayscaleWarm.addEventListener("click", function () {
            picture.style.webkitFilter = "grayscale(90%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }

    var sepia = document.getElementById(SEPIA_ID);
    if (sepia) {
        sepia.addEventListener("click", function () {
            picture.style.webkitFilter = "sepia(100%)";

            picture.style.backgroundColor = "rgba(255, 255, 255,0)";
        });
    }


    var brown = document.getElementById(BROWN_ID);
    if (brown) {
        brown.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(65,43,22,0.4)";

        });
    }

    var ochre = document.getElementById(OCHRE_ID);
    if (ochre) {
        ochre.addEventListener("click", function () {
            picture.style.webkitFilter = "contrast(100%)";

            picture.style.backgroundColor = "rgba(210,114,27,0.4)";
        });
    }


    /*FRAME START*/
    var classname = document.getElementsByClassName("frameSelector");

    var showFrame = function () {
        $('.frameSide').css({"display": 'block'});

    }
    var hideFrame = function () {
        $('.frameSide').css({"display": 'none'});
    }


    setFrame = function (frameName_corner) {
        var frameName_line = frameName_corner.replace("_corner.png", "_line.png");
        var serverName = document.getElementById("serverName").value;

        var tmp_image = document.getElementById('picture');
        var imageWidth = tmp_image.offsetWidth + 2;
        var imageHeight = tmp_image.offsetHeight + 2;

        //n
        document.getElementsByClassName('nbefore')[0].style.backgroundImage = 'url("' + serverName + frameName_line + '")';
        document.getElementsByClassName('nbefore')[0].style.height = (imageWidth - 2) + 'px';
        document.getElementsByClassName('nbefore')[0].style.left = ((imageWidth - 32) / 2 + 20) + 'px';
        document.getElementsByClassName('nbefore')[0].style.top = ((((imageWidth - 32) / 2 + 40) - 50) * (-1)) + 'px';

        //ne
        document.getElementsByClassName('ne')[0].style.backgroundImage = 'url("' + serverName + frameName_corner + '")';
        document.getElementsByClassName('ne')[0].style.left = (imageWidth + 8) + 'px';

        //e
        document.getElementsByClassName('e')[0].style.backgroundImage = 'url("' + serverName + frameName_line + '")';
        document.getElementsByClassName('e')[0].style.height = (imageHeight + 28) + 'px';
        document.getElementsByClassName('e')[0].style.left = (imageWidth + 8) + 'px';

        //se
        document.getElementsByClassName('se')[0].style.backgroundImage = 'url("' + serverName + frameName_corner + '")';
        document.getElementsByClassName('se')[0].style.left = (imageWidth + 8) + 'px';
        document.getElementsByClassName('se')[0].style.top = (imageHeight + 8) + 'px';

        //s
        document.getElementsByClassName('s')[0].style.top = (imageHeight + 10) + 'px';

        document.getElementsByClassName('sbefore')[0].style.backgroundImage = 'url("' + serverName + frameName_line + '")';
        document.getElementsByClassName('sbefore')[0].style.height = (imageWidth - 2) + 'px';
        document.getElementsByClassName('sbefore')[0].style.left = ((imageWidth - 32) / 2 + 20) + 'px';
        document.getElementsByClassName('sbefore')[0].style.top = ((((imageWidth - 32) / 2 + 40) - 50) * (-1) - 2) + 'px';

        //sw
        document.getElementsByClassName('sw')[0].style.backgroundImage = 'url("' + serverName + frameName_corner + '")';
        document.getElementsByClassName('sw')[0].style.top = (imageHeight + 8) + 'px';

        //w
        document.getElementsByClassName('w')[0].style.backgroundImage = 'url("' + serverName + frameName_line + '")';
        document.getElementsByClassName('w')[0].style.height = (imageHeight + 28) + 'px';

        //nw
        document.getElementsByClassName('nw')[0].style.backgroundImage = 'url("' + serverName + frameName_corner + '")';

        showFrame();
    };

    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', function () {
            frameName_corner = this.getAttribute("txtSrc");
            setFrame(frameName_corner);
        }, false);
    }

    /*FRAME END*/

    checkTooltip = function () {
        if (parseInt(widthInput.value) > textureWidth) {
            var wHint = "Выбранное значение превышает ширину текстуры (" + textureWidth + "см). Картина будет с вертикальным(и) стыком";
            document.getElementById('wHint').innerHTML = wHint;
            document.getElementById('wHint').style.display = "block";
        } else {
            document.getElementById('wHint').style.display = "none";
        }
        if (parseInt(heightInput.value) > textureHeight) {
            var hHint = "Выбранное значение превышает высоту текстуры (" + textureHeight + "см). Картина будет с горизонтальным(и) стыком";
            document.getElementById('hHint').innerHTML = hHint;
            document.getElementById('hHint').style.display = "block";
        } else {
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

                            img.onload = function () {
                                loaded = true;
                            };
                            img.src = json['new_file'];

                            var wait = setInterval(function () {
                                if (loaded) {
                                    clearInterval(wait);

                                    //console.log(img.naturalWidth, img.naturalHeight);
                                    var tmp = document.getElementById('picture');

                                    var classname = document.getElementsByClassName("textureSelector");
                                    for (var i = 0; i < classname.length; i++) {
                                        classname[i].addEventListener('click', setTexture, false);
                                        if (classname[i].children[0].checked) {
                                            var textureSrc = classname[i].getAttribute("txtSrc");
                                        }
                                        checkTooltip();
                                    }

                                    document.getElementById('image').src = json['new_file'];
                                    document.getElementById('picture').style.background = "url(" + json['new_file'] + "), url(" + textureSrc + ")";
                                    document.getElementById('picture').style.backgroundSize = "100% 100%";


                                    $("#image").attr("uploadFileExt", json['file_extension']);
                                    console.log($("#image").attr("uploadFileExt"));

                                    $("#image").attr("uploadFileName", json['file_name']);
                                    console.log($("#image").attr("uploadFileName"));

                                    $("#image").attr("uploadFileToken", json['file_token']);
                                    console.log($("#image").attr("uploadFileName"));

                                    frameWidth = tmp.naturalWidth + 60;
                                    frameHeight = tmp.naturalHeight + 60;

                                    global_img = document.createElement('img');

                                    global_img.src = json['new_file'];
                                    tmp_imageClientWidth  = global_img.naturalWidth;
                                    tmp_imageClientHeight = global_img.naturalHeight;
                                   PICTURE_ASPECT_RATIO = tmp_imageClientWidth/tmp_imageClientHeight;
                                    var cont_w = 0;
                                    var cont_h = 0;

                                    if(tmp_imageClientWidth > tmp_imageClientHeight){
                                        var cont_w = 500;
                                        var cont_h = (500 / PICTURE_ASPECT_RATIO).toFixed();
                                    }else{
                                        var cont_h = 500;
                                        var cont_w = (500 * PICTURE_ASPECT_RATIO).toFixed();
                                    }



                                    picture.style.width = "100%";
                                    //picture.style.maxWidth = (frameWidth - 60) + "px";
                                    picture.style.maxWidth  = cont_w + "px";
                                    picture.style.maxHeight = cont_h + "px";

                                    widthInput.dispatchEvent(new Event("change"));

                                    try {
                                        document.styleSheets[0].addRule('#frame', 'height: ' + frameHeight + 'px; width: ' + frameWidth + 'px');
                                    } catch (e) {
                                    }
                                    document.styleSheets[0].insertRule('#frame { height: ' + frameHeight + 'px; width: ' + frameWidth + 'px }', 0);
                                    hideFrame();
                                } else {

                                }
                                $('.frameSide').css({"display": 'none'});
                            }, 0);

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

    $('.btnPhotoRotateLeft').on('click', function () {
                //console.log('index.php?route=tool/rotateImage&rotate=left&ext='+$("#image").attr("uploadFileExt")+"&filename="+$("#image").attr("uploadFileName"));
                $.ajax({
                    url: 'index.php?route=tool/rotateImage&rotate=left&ext='+$("#image").attr("uploadFileExt")+"&filename="+$("#image").attr("uploadFileName")+"&filetoken"+$("#image").attr("uploadFileToken"),
                    type: 'post',
                    //dataType: 'json',
                    data: "",
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        //$(node).button('loading');
                    },
                    complete: function () {
                        //$(node).button('reset');
                    },
                    success: function (json) {
                        orientation = !orientation;
                        if(orientation){
                            PICTURE_ASPECT_RATIO = tmp_imageClientWidth/tmp_imageClientHeight;
                        }else{
                            PICTURE_ASPECT_RATIO = tmp_imageClientHeight/tmp_imageClientWidth;
                        }
                        var classname = document.getElementsByClassName("textureSelector");
                        for (var i = 0; i < classname.length; i++) {
                            classname[i].addEventListener('click', setTexture, false);
                            if (classname[i].children[0].checked) {
                                var textureSrc = classname[i].getAttribute("txtSrc");
                            }
                            checkTooltip();
                        }

                        var tmp_src = document.getElementById('image').src;
                        global_img = document.createElement('img');

                        var cont_w = tmp_imageClientWidth;
                        var cont_h = tmp_imageClientHeight;

                        /*if(tmp_imageClientWidth < tmp_imageClientHeight){
                            cont_w = 500;
                            cont_h = (500 / PICTURE_ASPECT_RATIO).toFixed();
                        }else{
                            cont_h = 500;
                            cont_w = (500 * PICTURE_ASPECT_RATIO).toFixed();
                        }*/

                        picture.style.width = "100%";
                        //picture.style.maxWidth = (frameWidth - 60) + "px";
                        if(orientation){
                            picture.style.maxWidth  = cont_w + "px";
                            picture.style.maxHeight = cont_h + "px";
                        }else{
                            picture.style.maxWidth  = cont_h + "px";
                            picture.style.maxHeight = cont_w + "px";
                        }

                        document.getElementById('image').src = "";
                        document.getElementById('image').src = tmp_src;


                        document.getElementById('picture').style.background = "url(" + tmp_src + "?"+ Math.random()+"), url(" + textureSrc + ")";
                        document.getElementById('picture').style.backgroundSize = "100% 100%";

                        widthInput.dispatchEvent(new Event("change"));
                        hideFrame();
                        document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(widthInput.value);
                        document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(heightInput.value);
                        setFrame(frameName_corner);
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

    });
    $('.btnPhotoRotateRight').on('click', function () {
        //console.log('index.php?route=tool/rotateImage&rotate=left&ext='+$("#image").attr("uploadFileExt")+"&filename="+$("#image").attr("uploadFileName"));
        $.ajax({
            url: 'index.php?route=tool/rotateImage&rotate=right&ext='+$("#image").attr("uploadFileExt")+"&filename="+$("#image").attr("uploadFileName")+"&filetoken"+$("#image").attr("uploadFileToken"),
            type: 'post',
            //dataType: 'json',
            data: "",
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function () {
                //$(node).button('loading');
            },
            complete: function () {
                //$(node).button('reset');
            },
            success: function (json) {
                orientation = !orientation;
                if(orientation){
                    PICTURE_ASPECT_RATIO = tmp_imageClientWidth/tmp_imageClientHeight;
                }else{
                    PICTURE_ASPECT_RATIO = tmp_imageClientHeight/tmp_imageClientWidth;
                }
                var classname = document.getElementsByClassName("textureSelector");
                for (var i = 0; i < classname.length; i++) {
                    classname[i].addEventListener('click', setTexture, false);
                    if (classname[i].children[0].checked) {
                        var textureSrc = classname[i].getAttribute("txtSrc");
                    }
                    checkTooltip();
                }

                var tmp_src = document.getElementById('image').src;
                global_img = document.createElement('img');

                var cont_w = tmp_imageClientWidth;
                var cont_h = tmp_imageClientHeight;

                /*if(tmp_imageClientWidth > tmp_imageClientHeight){
                    var cont_w = 500;
                    var cont_h = (500 / PICTURE_ASPECT_RATIO).toFixed();
                }else{
                    var cont_h = 500;
                    var cont_w = (500 * PICTURE_ASPECT_RATIO).toFixed();
                }*/

                picture.style.width = "100%";
                //picture.style.maxWidth = (frameWidth - 60) + "px";
                if(orientation){
                    picture.style.maxWidth  = cont_w + "px";
                    picture.style.maxHeight = cont_h + "px";
                    //PICTURE_ASPECT_RATIO = tmp_imageClientWidth/tmp_imageClientHeight;
                }else{
                    picture.style.maxWidth  = cont_h + "px";
                    picture.style.maxHeight = cont_w + "px";
                    //PICTURE_ASPECT_RATIO = tmp_imageClientHeight/tmp_imageClientWidth;
                }

                document.getElementById('image').src = "";
                document.getElementById('image').src = tmp_src;


                document.getElementById('picture').style.background = "url(" + tmp_src + "?"+ Math.random()+"), url(" + textureSrc + ")";
                document.getElementById('picture').style.backgroundSize = "100% 100%";

                widthInput.dispatchEvent(new Event("change"));
                hideFrame();
                document.querySelector("#wSlider .noUi-tooltip").innerHTML = Math.round(widthInput.value);
                document.querySelector("#hSlider .noUi-tooltip").innerHTML = Math.round(heightInput.value);
                setFrame(frameName_corner);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    });
    /*FILE END*/

    var classname = document.getElementsByClassName("textureSelector");
    if (classname[0]) {
        classname[1].dispatchEvent(new Event("click"));
        classname[0].dispatchEvent(new Event("click"));
    }
    $(".radioSelector").each(function() {
        $(this).click(function() {
            $(".radioSelector").each(function() {
                if(this.children[0].checked){
                    $(this).addClass("option-checked-style");
                }else{
                    $(this).removeClass("option-checked-style");
                }
            })
        });
    });

    $(".textureSelector").each(function() {
        $(this).click(function() {
            $(".textureSelector").each(function() {
                if(this.children[0].checked){
                    $(this).addClass("option-checked-style");
                }else{
                    $(this).removeClass("option-checked-style");
                }
            })
        });
    });
        $(MAX_CROPPER_SIZE).click(function() {
                if(MAX_CROPPER_SIZE.checked){
                    $("#sizeLockLabel").addClass("option-checked-style");
                }else{
                    $("#sizeLockLabel").removeClass("option-checked-style");
                }
        });

    $("#clearFilters").click(function () {
        picture.style.webkitFilter = "contrast(100%)";
        picture.style.backgroundColor = "rgba(255, 255, 255,0)";

        var tmp = document.getElementsByClassName("colorSelector");
        for (var i = 0; i < tmp.length; i++) {
            $(tmp[i]).prop('checked', false);
        }

    });

}

//document.addEventListener("DOMContentLoaded", ready);

window.onload = ready;