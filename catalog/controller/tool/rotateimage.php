<?php

class ControllerToolrotateimage extends Controller
{
    public function index()
    {
        $this->load->language('tool/upload');

        $json = array();
        $rotate = $this->request->get['rotate'];
        $ext = $this->request->get['ext'];
        $filename = $this->request->get['filename'];
        $filetoken = $this->request->get['filetoken'];

        switch ($rotate) {
            case "left":
                $deg = 90;
                break;
            case "right":
                $deg = -90;
                break;
            default:
                $deg = 0;
        }

        $image = CUSTOM_ROUTE_UPLOAD . $filename;
        $new_token = token(8);
        $new_image = str_replace(".".$ext.".".$filetoken, "", $filename).$new_token.$ext.".".$filetoken;
        $img = imagecreatefromjpeg($image);    // Картинка

        switch ($ext) {
            case "jpg":
                $img = imagecreatefromjpeg($image);
                break;
            case "jpeg":
                $img = imagecreatefromjpeg($image);
                break;
            case "png":
                $img = imagecreatefrompng($image);
                break;
            case "bmp":
                $img = imagecreatefrombmp($image);
                break;
        }

        $imgRotated = imagerotate($img, $deg, 0);
        imagejpeg($imgRotated, $image, $deg);  //  Новая картинка

        var_dump($this->request->get);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput($json);
    }
}