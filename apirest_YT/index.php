<!DOCTYPE html>
<html lang="es-ES">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Rest - CHardy v1.0</title>
    <link rel="stylesheet" href="assets/estilo.css" type="text/css">
</head>
<body>

<div  class="container">
    <h1>API REST - CHardy v1.0</h1>
    <div class="divbody">
        <h3>Auth - login</h3>
        <p>Para inicar session en la app y tener acceso a la api se deben enviar el USUARIO y su PASSWORD a traves del PostBody en formato JSON a la direccion:<br />
            http://your-URL.com/apirest/auth
        </p>
        <code>
           POST  /auth
           <br>
           {
               <br>
               "usuario" :"",  -> REQUERIDO
               <br>
               "password": "" -> REQUERIDO
               <br>
            }
        
        </code>
    </div>      
    <div class="divbody">   
        <h3>Pacientes</h3>
        <code>
           GET  /pacientes?page=$numeroPagina
           <br>
           GET  /pacientes?id=$idPaciente
        </code>

        <code>
           POST  /pacientes
           <br> 
           {
            <br> 
               "nombre" : "",               -> REQUERIDO
               <br> 
               "dni" : "",                  -> REQUERIDO
               <br> 
               "correo":"",                 -> REQUERIDO
               <br> 
               "codigoPostal" :"",             
               <br>  
               "genero" : "",        
               <br>        
               "telefono" : "",       
               <br>       
               "fechaNacimiento" : "",      
               <br>         
               "token" : ""                 -> REQUERIDO        
               <br>       
           }

        </code>
        <code>
           PUT  /pacientes
           <br> 
           {
            <br> 
               "nombre" : "",               
               <br> 
               "dni" : "",                  
               <br> 
               "correo":"",                 
               <br> 
               "codigoPostal" :"",             
               <br>  
               "genero" : "",        
               <br>        
               "telefono" : "",       
               <br>       
               "fechaNacimiento" : "",      
               <br>         
               "token" : "" ,                -> REQUERIDO        
               <br>       
               "pacienteId" : ""   -> REQUERIDO
               <br>
           }

        </code>
        <code>
           DELETE  /pacientes
           <br> 
           {   
               <br>    
               "token" : "",                -> REQUERIDO        
               <br>       
               "pacienteId" : ""   -> REQUERIDO
               <br>
           }

        </code>
    </div>


</div>
    
</body>
</html>

