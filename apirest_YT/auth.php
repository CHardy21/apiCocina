<?php 

require_once 'clases/auth.class.php';
require_once 'clases/respuestas.class.php';

$_auth = new auth;
$_respuestas = new respuestas;

// Para inicar session en la app y tener acceso a la api se deben enviar el USUARIO y su PASWORD
// a traves del PostBody en formato JSON a la direccion:
// http://http://url.com/apirest/auth
//
//      POST /auth
//      {
//          "usuario" :"", -> REQUERIDO
//          "password": "" -> REQUERIDO
//      }

if($_SERVER['REQUEST_METHOD'] == "POST"){

    // Recibiendo los datos
    $postBody = file_get_contents("php://input");

    // Enviamos los datos al manejador
    $datosArray = $_auth->login($postBody);

    // Devolvemos una respuesta
    header('Content-Type: application/json');
    if(isset($datosArray["detail"]["id"])){
        $responseCode = $datosArray["detail"]["id"];
        http_response_code($responseCode);
    }else{
        http_response_code(200);
    }
    echo json_encode($datosArray);


}else{
    header('Content-Type: application/json');
    $datosArray = $_respuestas->error_405();
    echo json_encode($datosArray);

}


?>