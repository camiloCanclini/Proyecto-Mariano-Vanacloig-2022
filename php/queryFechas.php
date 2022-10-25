<?php
    include('connectionDB.php');
    $enlace = conexionBD();
    $query = 'SELECT * FROM fechas';
    $result = mysqli_query($enlace,$query);
    //mysqli_set_charset($enlace, "utf8"); //formato de datos utf8
    if(!$result){
        die("Query Failed.");
    }
    $rawdata = array(); //creamos un array, que se convertira a JSON
    $i = 0;
    while($row = mysqli_fetch_array($result))//Se recorre el resultado de la consulta
    {
        $rawdata[$i] = $row;//Se guarda en forma de arbol el resultado
        $i++;
    }
    $convertedArray = json_encode($rawdata);//Se convierte array a json
    echo $convertedArray;//Se "envia" a JS en formato JSON
?>