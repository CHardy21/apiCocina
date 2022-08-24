<?php 

class respuestas{

    public  $response = [
        'status' => "ok",
        "result" => array()
    ];

    // public  $response = [
    //     'status' => "ok",
    //     "code" => "",
    //     "message" => ""
    // ];

    public function error_login($msg){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => 403,
            "code" => "Bad Login",
            "message" => $msg
        );
        return $this->response;
    }

    public function error_400(){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => 400,
            "code" => "Bad request",
            "message" => "Solicitud no aceptada. Datos enviados incompletos o con formato incorrecto."
        );
        return $this->response;
    }

    public function error_401($valor = "No autorizado"){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => "401",
            "error_msg" => $valor
        );
        return $this->response;
    }

    public function error_405(){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => 405,
            "code" => "Method Not Allowed",
            "message" => "Metodo no permitido o desabilitado."
        );
        return $this->response;
    }

    public function error_200($valor = "Datos incorrectos"){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => "200",
            "error_msg" => $valor
        );
        return $this->response;
    }



    public function error_500($valor = "Error interno del servidor"){
        $this->response['status'] = "error";
        $this->response['result'] = array(
            "error_id" => "500",
            "error_msg" => $valor
        );
        return $this->response;
    }



    
    

}

?>