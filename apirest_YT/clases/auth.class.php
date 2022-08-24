<?php
require_once 'conexion/conexion.php';
require_once 'respuestas.class.php';


class auth extends conexion{

    public function login($json){
      
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);
        if(!isset($datos['usuario']) || !isset($datos["password"])){
            // Error con los campos
            return $_respuestas->error_400();
        }else{
            //todo esta bien 
            $usuario = $datos['usuario'];
            $password = $datos['password'];
            $password = parent::encriptar($password);
            $datos = $this->getDatosUsuario($usuario);
            if($datos){
                //verificar si la contraseña es igual
                    if($password == $datos[0]['user_password']){
                            if($datos[0]['user_status'] == "1"){
                                //la contraseña es igual, crear el token
                                $verificar  = $this->insertarToken($datos[0]['user_id']);
                                if($verificar){
                                        // si se guardo
                                        $result = $_respuestas->response;
                                        $result["result"] = array(
                                            "login" => "ok",
                                            "token" => $verificar
                                        );
                                        return $result;
                                }else{
                                        //error al guardar
                                        return $_respuestas->error_500("Error interno, No hemos podido guardar");
                                }
                            }else{
                                //el usuario esta inactivo
                                return $_respuestas->error_login("El usuario esta inactivo");
                            }
                    }else{
                        //la contraseña no es igual
                        return $_respuestas->error_login("El password es invalido");
                    }
            }else{
                //no existe el usuario
                return $_respuestas->error_login("El usuario $usuario no existe. ");
            }
        }
    }



    private function getDatosUsuario($usuario){
        $query = "SELECT * FROM users WHERE user_name = '$usuario'";
        $datos = parent::getDatos($query);
        if(isset($datos[0]["user_id"])){
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