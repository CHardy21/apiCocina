<?php
require_once 'conexion/conexion.php';
require_once 'respuestas.class.php';


class auth extends conexion{

    public function login($json){
      
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);
        if(!isset($datos['usuario']) || !isset($datos["password"])){
            //error con los campos
            return $_respuestas->error_400();
        }else{
            //todo esta bien 
            $usuario = $datos['usuario'];
            $password = $datos['password'];
            $password = parent::encriptar($password);
            $datos = $this->obtenerDatosUsuario($usuario);
            if($datos){
                //verificar si la contraseña es igual
                    if($password == $datos[0]['userPassword']){
                            if($datos[0]['userStatus'] == "1"){
                                //crear el token
                                $verificar  = $this->insertarToken($datos[0]['userId']);
                                if($verificar){
                                        // si se guardo
                                        $result = $_respuestas->response;
                                        $result["result"] = array(
                                            "token" => $verificar
                                        );
                                        return $result;
                                }else{
                                        //error al guardar
                                        return $_respuestas->error_500("Error interno, No hemos podido guardar");
                                }
                            }else{
                                //el usuario esta inactivo
                                return $_respuestas->error_200("El usuario esta inactivo");
                            }
                    }else{
                        //la contraseña no es igual
                        return $_respuestas->error_200("El password es invalido");
                    }
            }else{
                //no existe el usuario
                return $_respuestas->error_200("El usuaro $usuario  no existe ");
            }
        }
    }



    private function obtenerDatosUsuario($usuario){
        $query = "SELECT userId,userName,userPassword,userStatus FROM users WHERE userName = '$usuario'";
        $datos = parent::obtenerDatos($query);
        if(isset($datos[0]["userId"])){
            return $datos;
        }else{
            return 0;
        }
    }


    private function insertarToken($usuarioid){
        $val = true;
        $token = bin2hex(openssl_random_pseudo_bytes(16,$val));
        $date = date("Y-m-d H:i");
        $estado = "1";
        //$query = "INSERT INTO users_token (tokenUserId,Token,tokenStatus,Fecha)VALUES('$usuarioid','$token','$estado','$date')";
        $query = "INSERT INTO users_tokens (tokenId, tokenUserId, token, tokenStatus, tokenCreateAt)VALUES(NULL,'$usuarioid','$token','$estado',current_timestamp()	)";

        $verifica = parent::nonQuery($query);
        
        if($verifica){
            return $token;
        }else{
            return 0;
        }
    }


}




?>