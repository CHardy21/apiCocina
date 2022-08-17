<?php
$pdo=null;

date_default_timezone_set ('America/Argentina/Buenos_Aires');

////// HOST REMOTO /////
$db_host 	= "localhost";
$db_name 	= "cocin23_2197";
$db_user	= "cocin23_chardy";
$db_pass 	= "T3nk@nH0_21";
$db_type 	= "MySQL";
$db_charset = "UTF8";

function conectar(){
    try{
        $GLOBALS['pdo']=new PDO("mysql:host=".$GLOBALS['db_host'].";dbname=".$GLOBALS['db_name']."", $GLOBALS['db_user'], $GLOBALS['db_pass']);
        $GLOBALS['pdo']->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch (PDOException $e){
        print "Error!: No se pudo conectar a la bd ".$db_name."<br/>";
        print "\nError!: ".$e."<br/>";
        die();
    }
}

function desconectar() {
    $GLOBALS['pdo']=null;
}

function metodoGet($query){
    try{
        conectar();
        $sentencia=$GLOBALS['pdo']->prepare($query);
        $sentencia->setFetchMode(PDO::FETCH_ASSOC);
        $sentencia->execute();
        desconectar();
        return $sentencia;
    }catch(Exception $e){
        die("Error: ".$e);
    }
}

function metodoPost($query, $queryAutoIncrement){
    try{
        conectar();
        $sentencia=$GLOBALS['pdo']->prepare($query);
        $sentencia->execute();
        $idAutoIncrement=metodoGet($queryAutoIncrement)->fetch(PDO::FETCH_ASSOC);
        $resultado=array_merge($idAutoIncrement, $_POST);
        $sentencia->closeCursor();
        desconectar();
        return $resultado;
    }catch(Exception $e){
        die("Error: ".$e);
    }
}


function metodoPut($query){
    try{
        conectar();
        $sentencia=$GLOBALS['pdo']->prepare($query);
        $sentencia->execute();
        $resultado=array_merge($_GET, $_POST);
        $sentencia->closeCursor();
        desconectar();
        return $resultado;
    }catch(Exception $e){
        die("Error: ".$e);
    }
}

function metodoDelete($query){
    try{
        conectar();
        $sentencia=$GLOBALS['pdo']->prepare($query);
        $sentencia->execute();
        $sentencia->closeCursor();
        desconectar();
        return $_GET['id'];
    }catch(Exception $e){
        die("Error: ".$e);
    }
}

?>