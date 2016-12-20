<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
	/* Осуществляем проверку вводимых данных и их защиту от враждебных скриптов */
	$product = "Вам пришёл заказ на ";
	$product .= strip_tags($_POST["product"]);
	$product_body = "Вам пришёл заказ на ";
	$product_body .= $_POST["product"];
	$post_name = htmlspecialchars($_POST["name"]);
	$name = mb_convert_encoding($post_name, 'utf-8', mb_detect_encoding($post_name));
	$email = htmlspecialchars($_POST["email"]);
	$phone = htmlspecialchars($_POST["phone"]);
	$message = htmlspecialchars($_POST["message"]);
	/* Устанавливаем e-mail адресата */
	$myemail = $_POST["admin_email"];
	/* Создаем from email */
	$from_email = 'zakaz@' . $_SERVER['SERVER_NAME'];
	/* Создаем заголовок */
	$headers = 'Content-type: text/html; charset=utf-8' . " \r\n" . 'From:' . $from_email . " \r\n"; //Заголовок для отправки писем без файла
	/* Создаем новую переменную, присвоив ей значение */
	$message_to_myemail = "Здравствуйте! <br /><br />
	Вашей контактной формой было отправлено сообщение: <br /><br />
	$product_body<br /><br />
	Имя отправителя: $name <br />
	Телефон: $phone <br />";
	if ($email=='') {
		$message_to_myemail .= "<br />";
	}
	else {
		$message_to_myemail .= "E-mail: $email";
	}
	if ($message=='') {
		$message_to_myemail .= "<br />Удачных продаж!!!";
	}
	else {
		$message_to_myemail .= "Сообщение: $message <br /><br />Удачных продаж!!!";
	}
	/* Отправляем сообщение, используя mail() функцию */
	mail($myemail, $product, $message_to_myemail, $headers);
	
}else{ 
	die('spam!');
}

?>