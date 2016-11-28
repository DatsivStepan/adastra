/**
 * Created by lexlazzy on 24.11.2016.
 */

function ready() {

    var wSliderRealMinValue = parseInt( document.getElementById('minWidth').innerHTML );
    var wSliderRealMaxValue = parseInt( document.getElementById('maxWidth').innerHTML );

    var hSliderRealMinValue = parseInt( document.getElementById('minHeight').innerHTML );
    var hSliderRealMaxValue = parseInt( document.getElementById('maxHeight').innerHTML );

    var image = document.getElementById('image');

    var wSliderMinValue = 0;
    var wSliderMaxValue = image.offsetWidth;

    var hSliderMinValue = 0;
    var hSliderMaxValue = image.offsetHeight;

    var cropper = new Cropper(image, {
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
        autoCropArea: 1,
        viewMode: 3,
        ready: function(e){


            document.querySelector("div.cropper-canvas > img").src="";
            document.querySelector("span.cropper-view-box > img").src="";

            document.querySelector("div.cropper-canvas > img").style.backgroundImage = "url("+image.src+")";
            document.querySelector("div.cropper-canvas > img").style.backgroundBlendMode = "multiply";
            document.querySelector("div.cropper-canvas > img").style.size = "100% 100%";

            document.querySelector("span.cropper-view-box > img").style.backgroundImage = "url("+image.src+")";
            document.querySelector("span.cropper-view-box > img").style.backgroundBlendMode = "multiply";
            document.querySelector("span.cropper-view-box > img").style.size = "100% 100%";


            //ширина
            document.querySelector("input#input-option243").value = wSliderRealMaxValue;
            //горизонтальное смещение
            document.querySelector("input#input-option242").value = 'нет';

            //высота
            document.querySelector("input#input-option241").value = hSliderRealMaxValue;
            //вертикальное смещение
            document.querySelector("input#input-option240").value = 'нет';

        },
        crop: function (e) {
            var data = e.detail;

            hSlider.noUiSlider.set(data.height);
            wSlider.noUiSlider.set(data.width);

            //e.target.width;
            var h = Math.round(data.height*hSliderRealMaxValue/(hSliderMaxValue+1)*((hSliderMaxValue+1)/e.target.height));
            var w = Math.round(data.width*wSliderRealMaxValue/(wSliderMaxValue+2)*((wSliderMaxValue+2)/e.target.width));

            var hOffset = Math.round(data.y*hSliderRealMaxValue/(hSliderMaxValue+1)*((hSliderMaxValue+1)/e.target.height));
            var wOffset = Math.round(data.x*wSliderRealMaxValue/(wSliderMaxValue+2)*((wSliderMaxValue+2)/e.target.width));

            document.styleSheets[0].addRule('#hSlider .noUi-handle:before','content: "'+h+'"');
            document.styleSheets[0].insertRule('#hSlider .noUi-handle:before { content: "'+h+'" }', 0);

            document.styleSheets[0].addRule('#wSlider .noUi-handle:before','content: "'+w+'"');
            document.styleSheets[0].insertRule('#wSlider .noUi-handle:before { content: "'+w+'" }', 0);

            //ширина
            document.querySelector("input#input-option243").value = w;
            //горизонтальное смещение
            document.querySelector("input#input-option242").value = wOffset;

            //высота
            document.querySelector("input#input-option241").value = h;
            //вертикальное смещение
            document.querySelector("input#input-option240").value = hOffset;

        }
    });

    var wSlider = document.getElementById('wSlider');

    noUiSlider.create(wSlider, {
        start: wSliderMaxValue/2,
        connect: [true, false],
        //orientation: "vertical",
        animate: false,
        range: {
            'min': wSliderMinValue,
            'max': wSliderMaxValue
        }
    });
    wSlider.noUiSlider.on('slide', function(){
        var width = wSlider.noUiSlider.get()*1;
        var cropperSize = cropper.getCropBoxData();
        var difWidth = cropperSize.width - width;
        cropperSize.width = width;
        cropperSize.left = cropperSize.left+difWidth/2;
        //cropper.setCropBoxData({"left":0,"top":0,"width":width,"height":100});
        cropper.setCropBoxData(cropperSize);
    });

    var hSlider = document.getElementById('hSlider');

    noUiSlider.create(hSlider, {
        start: hSliderMaxValue/2,
        connect: [true, false],
        //orientation: "vertical",
        animate: false,
        range: {
            'min': hSliderMinValue,
            'max': hSliderMaxValue
        }
    });
    hSlider.noUiSlider.on('slide', function(){
        var height = hSlider.noUiSlider.get()*1;
        var cropperSize = cropper.getCropBoxData();
        var difHeight = cropperSize.height - height;
        cropperSize.height = height;
        cropperSize.top = cropperSize.top+difHeight/2;
        //cropper.setCropBoxData({"left":0,"top":0,"width":width,"height":100});
        cropper.setCropBoxData(cropperSize);
    });

    var contrast_min50 = document.getElementById('option[29]');
    contrast_min50.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(50%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(50%)";

    });
    var contrast_min25 = document.getElementById('option[30]');
    contrast_min25.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(75%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(75%)";

    });

    var contrast_0 = document.getElementById('option[34]');
    contrast_0.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(100%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(100%)";

    });

    var contrast_plus25 = document.getElementById('option[35]');
    contrast_plus25.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(125%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(125%)";

    });
    var contrast_plus50 = document.getElementById('option[36]');
    contrast_plus50.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "contrast(150%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "contrast(150%)";

    });

    var grayscaleCold = document.getElementById('option[37]');
    grayscaleCold.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "grayscale(100%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "grayscale(100%)";

    });
    var grayscaleWarm = document.getElementById('option[38]');
    grayscaleWarm.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "grayscale(90%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "grayscale(90%)";

    });
    var sepia = document.getElementById('option[39]');
    sepia.addEventListener("click", function(){
        document.querySelector("div.cropper-canvas > img").style.webkitFilter = "sepia(100%)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "sepia(100%)";

    });

    var brown = document.getElementById('option[40]');
    brown.addEventListener("click", function(){
        /*document.querySelector("div.cropper-canvas > img").style.webkitFilter = "url(mona.png)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "url(mona.png)";*/

    });
    var ochre  = document.getElementById('option[41]');
    ochre .addEventListener("click", function(){
        /*document.querySelector("div.cropper-canvas > img").style.webkitFilter = "url(mona.png)";
        document.querySelector("span.cropper-view-box > img").style.webkitFilter = "url(mona.png)";*/

    });

    var classname = document.getElementsByClassName("textureSelector");

    var myFunction = function() {
        var txtSrc = this.getAttribute("txtSrc");
        console.log(txtSrc);

        document.querySelector("div.cropper-canvas > img").style.backgroundImage = "url("+image.src+"), url("+txtSrc+")";
        document.querySelector("div.cropper-canvas > img").style.backgroundBlendMode = "multiply";
        document.querySelector("div.cropper-canvas > img").style.size = "100% 100%";

        document.querySelector("span.cropper-view-box > img").style.backgroundImage = "url("+image.src+"), url("+txtSrc+")";
        document.querySelector("span.cropper-view-box > img").style.backgroundBlendMode = "multiply";
        document.querySelector("span.cropper-view-box > img").style.size = "100% 100%";
    };

    for (var i = 0; i < classname.length; i++) {
        classname[i].addEventListener('click', myFunction, false);
    }

}

document.addEventListener("DOMContentLoaded", ready);