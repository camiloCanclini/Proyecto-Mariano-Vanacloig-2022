<?php
header("Content-Type: application/json; charset=utf-8");
include('connectionDB.php');
$enlace = conexionBD();
$query = 'SELECT id,canchas.direccion, fecha, t2.nombreEquipo, t3.nombreEquipo, desde_hs, hasta_hs FROM fechas LEFT OUTER JOIN canchas ON fechas.fk_idCancha = canchas.idCancha LEFT OUTER JOIN equipos t2 ON fechas.fk_idEquipo1 = t2.idEquipo LEFT OUTER JOIN equipos t3 ON fechas.fk_idEquipo2 = t3.idEquipo;';
$result = mysqli_query($enlace, $query);
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8
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