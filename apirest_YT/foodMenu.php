<?php
require_once 'clases/respuestas.class.php';
require_once 'clases/foodMenu.class.php';

$_respuestas = new respuestas;
$_foodMenu = new foodMenu;


if ($_SERVER['REQUEST_METHOD'] == "GET") {
    //   * Esta solicitud devuelve el cartilla o menu de Productos 
    //     http://url.com/apirest/foodMenu

        $listaMenu = $_foodMenu->getFoodMenuList();
        header("Content-Type: application/json");
        echo json_encode($listaMenu);
        http_response_code(200);

}
?>