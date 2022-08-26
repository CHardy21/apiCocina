<?php 

class respuestas{

    public  $response = [
        'status' => "ok",
        "detail" => array()
    ];

    // public  $response = [
    //     'status' => "ok",
    //     "code" => "",
    //     "message" => ""
    // ];

    public function error_login($msg){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => 403,
            "code" => "Bad Login",
            "message" => $msg
        );
        return $this->response;
    }

    public function error_400(){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => 400,
            "code" => "Bad request",
            "message" => "Solicitud no aceptada. Datos enviados incompletos o con formato incorrecto."
        );
        return $this->response;
    }

    public function error_401($valor = "No autorizado"){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => "401",
            "error_msg" => $valor
        );
        return $this->response;
    }

    public function error_405(){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => 405,
            "code" => "Method Not Allowed",
            "message" => "Metodo no permitido o desabilitado."
        );
        return $this->response;
    }

    public function error_200($valor = "Datos incorrectos"){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => "200",
            "code" => "200",
            "message" => $valor
        );
        return $this->response;
    }



    public function error_500($valor = "Error interno del servidor"){
        $this->response['status'] = "error";
        $this->response['detail'] = array(
            "id" => 500,
            "code" => "500",
            "error_msg" => $valor
        );
        return $this->response;
    }



    
    

}

?>