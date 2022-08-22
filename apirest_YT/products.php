<?php
require_once 'clases/respuestas.class.php';
require_once 'clases/products.class.php';

$_respuestas = new respuestas;
$_productos = new products;


if($_SERVER['REQUEST_METHOD'] == "GET"){

    //   * Esta solicitud devuelve el detalle del producto indicado segun su ID
    //     http://url.com/apirest/products?id=1

    if(isset($_GET['id'])){
        $productoid = $_GET['id'];
        $datosProducto = $_productos->getProduct($productoid);
        header("Content-Type: application/json");
        echo json_encode($datosProducto);
        http_response_code(200);
    }

    // Aqui vamos a listar los productos en base a los PARAMETROS enviados desde la app
    //  * Esta solicitud devuelve la pagina solicitada con un cantidad de registros indicada en pageSize
    //    Si pageSize no es enviada su valor por defecto es 10.
    //    http://url.com/apirest/products?page=1&pageSize=10

    //    http://url.com/apirest/products?categ=1&page=1&pageSize=10

    if(isset($_GET["categ"])){
        $categoria = $_GET["categ"];
    } else {
        $categoria=0;
    }


    if(isset($_GET["page"])){
        $pagina = $_GET["page"];
        if(isset($_GET["pageSize"])){ 
            $cantidad = $_GET["pageSize"];
        } else {
            $cantidad = 10;
        }
        $listaProductos = $_productos->getProductsList($pagina, $cantidad);
        header("Content-Type: application/json");
        echo json_encode($listaProductos);
        http_response_code(200);
    }
    
}else if($_SERVER['REQUEST_METHOD'] == "POST"){
    //recibimos los datos enviados
    $postBody = file_get_contents("php://input");
    //enviamos los datos al manejador
    $datosArray = $_pacientes->post($postBody);
    //delvovemos una respuesta 
     header('Content-Type: application/json');
     if(isset($datosArray["result"]["error_id"])){
         $responseCode = $datosArray["result"]["error_id"];
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