<?php

include('connectionDB.php');
$enlace = conexionBD();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

if  (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "DELETE FROM `fechas` WHERE `id` = '$id';";
    $result = mysqli_query($enlace, $query);
    if(!$result){
        die("Query Failed.");
    }
    echo 0;
}

?>