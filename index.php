<?php
ob_start();
include 'bd/BD.php';

header('Access-Control-Allow-Origin: *');

// Metodo GET - Consulta de registros
if($_SERVER['REQUEST_METHOD']=='GET'){
    if(isset($_GET['id'])){
        $query="SELECT * from ch_gestion_products where prod_id=".$_GET['id'];
        $resultado=metodoGet($query);
        echo json_encode($resultado->fetch(PDO::FETCH_ASSOC));
    }else{
        $query="SELECT * from ch_gestion_products";
        $resultado=metodoGet($query);
        echo json_encode($resultado->fetchAll()); 
    }

    header("HTTP/1.1 200 OK");
    exit();
}


header("HTTP/1.1 400 Bad Request");
ob_end_flush(); 
?>