<?php
require_once 'clases/respuestas.class.php';
require_once 'clases/sections.class.php';

$_respuestas = new respuestas;
$_secciones = new sections;


if($_SERVER['REQUEST_METHOD'] == "GET"){

    //   * Esta solicitud devuelve el detalle de la seccion indicada segun su ID
    //     http://url.com/apirest/sections?id=1
    if(isset($_GET['id'])){
        $sectionid = $_GET['id'];
        $datosSection = $_secciones->getSection($sectionid);
        header("Content-Type: application/json");
        header("Access-Control-Allow-Origin: *");
        echo json_encode($datosSection);
        http_response_code(200);

    // Aqui vamos a listar las secciones en base a los PARAMETROS enviados desde la app
    // Esta solicitud devuelve la pagina solicitada con una cantidad de registros indicada en pageSize.
    //   * Si active no es enviada su valor por defecto es 'all' 
    //      active = all: se listan todas las secciones,
    //      active = 1  : se listan las secciones activas,
    //      active = 0  : se listan secciones desactivadas.
    //   * Si page no es enviada su valor por defecto en 1.
    //   * Si pageSize no es enviada su valor por defecto es 10.
 

    //    http://url.com/apirest/sections?page=1&pageSize=10

    }else {
        $active = 'all';
        $pagina = 1;
        $cantidad = 10;

        if(isset($_GET["active"])){ $active = $_GET["active"]; }
        if(isset($_GET["page"])){ $pagina = $_GET["page"]; }
        if(isset($_GET["pageSize"])){ $cantidad = $_GET["pageSize"]; }

        $listaSecciones = $_secciones->getSectionsList( $active, $pagina, $cantidad );
        header("Content-Type: application/json");
        header("Access-Control-Allow-Origin: *");
        echo json_encode($listaSecciones);
        http_response_code(200);

        }
    

/// REVISADO HASTA AQUI *********************************

}else if($_SERVER['REQUEST_METHOD'] == "POST"){
    //recibimos los datos enviados
    $postBody = file_get_contents("php://input");
    //enviamos los datos al manejador
    $datosArray = $_pacientes->post($postBody);
    //delvovemos una respuesta 
     header('Content-Type: application/json');
     if(isset($datosArray["detail"]["id"])){
         $responseCode = $datosArray["detail"]["id"];
         http_response_code($responseCode);
     }else{
         http_response_code(200);
     }
     echo json_encode($datosArray);
    
}else if($_SERVER['REQUEST_METHOD'] == "PUT"){
      //recibimos los datos enviados
      $postBody = file_get_contents("php://input");
      //enviamos datos al manejador
      $datosArray = $_pacientes->put($postBody);
        //delvovemos una respuesta 
     header('Content-Type: application/json');
     if(isset($datosArray["result"]["error_id"])){
         $responseCode = $datosArray["result"]["error_id"];
         http_response_code($responseCode);
     }else{
         http_response_code(200);
     }
     echo json_encode($datosArray);

}else if($_SERVER['REQUEST_METHOD'] == "DELETE"){

        $headers = getallheaders();
        if(isset($headers["token"]) && isset($headers["pacienteId"])){
            //recibimos los datos enviados por el header
            $send = [
                "token" => $headers["token"],
                "pacienteId" =>$headers["pacienteId"]
            ];
            $postBody = json_encode($send);
        }else{
            //recibimos los datos enviados
            $postBody = file_get_contents("php://input");
        }
        
        //enviamos datos al manejador
        $datosArray = $_pacientes->delete($postBody);
        //delvovemos una respuesta 
        header('Content-Type: application/json');
        if(isset($datosArray["result"]["error_id"])){
            $responseCode = $datosArray["result"]["error_id"];
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