<?php

require_once "conexion/conexion.php";
require_once "respuestas.class.php";


class foodMenu extends conexion {

    private $table = "products";
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

        $query_totalResults = "SELECT * FROM " . $this->table ;
        $datos = parent::getDatos($query);
        $totalResults = parent::nonQuery($query_totalResults);

        // $query_categ = "SELECT * FROM categories";
        // $categ = parent::getDatos($query_categ);
        // $datos = $categ;

        $datos = parent::formatData("ok", $totalResults, $datos);
        //$datos = formatDataMenu($datos);
        return ($datos);
    }
}

function formatDataMenu($items)
{
    
    return($result);
}

?>