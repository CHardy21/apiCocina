<?php

require_once "conexion/conexion.php";
require_once "respuestas.class.php";


class foodMenu extends conexion {

    // private $table = "products";
    // private $productoId= "";
    // private $productoNombre = "";
    // private $productoNombreBuscaar = "";
    // private $productoImagen = "";
    // private $productoCategoria = "";
    // private $productoUnidad = "";
    // private $productoCosto = "";
    // private $productoImportaCosto = "";
    // private $productoPrecio = "";
    // private $productoProductoPrecioNegativo = "";
    // private $productoInventario = "";
    // private $productoInvetarioInfinito = "";
    // private $productoDescripcion = "";
    // private $productoSucursal = "";
    // private $productoIncluyeImpuesto = "";
    // private $productoActivo = "";
    // private $productoUpdateAt = "";
    // private $productoUpdateUsuario = "";
    // private $token = "";
    

    public function getFoodMenuList()
    {
//
// SELECT products.prod_name, products.prod_description,categorie_name 
// FROM products 
// INNER JOIN categories categorie_name 
// ON prod_categ=categorie_id;
        $query ="SELECT 
                    categorie_name,
                    prod_img, 
                    prod_name,
                    prod_description, 
                    prod_price
                FROM " . $this->table ."
                INNER JOIN categories categorie_name
                ON prod_categ=categorie_id ORDER BY categorie_viewMenu"; // ORDER BY categorie_viewMenu

        //print_r($query);
        $query2 = "SELECT * FROM " . $this->table ;
        //print_r($query2);
        $datos = parent::getDatos($query);
        $totalResults = parent::nonQuery($query2);
        $datos = parent::formatData("ok", $totalResults, $datos);
        return ($datos);
    }
}

?>