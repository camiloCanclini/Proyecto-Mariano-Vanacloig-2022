<?php

include('connection.php');
$enlace = conexionBD();
if (isset($_POST['crear'])) {

  $nombre = $_POST['nombre'];
  $marca = $_POST['marca'];
  $cantidad = $_POST['cantidad'];
  $precio = $_POST['precio'];
  $imagen = $_POST['srcimagen'];
  $categoria = $_POST['categoria'];
  $especificaciones = $_POST['especificaciones'];

  $query = "INSERT INTO stock(nombre, marca, cantidad, precio, imagen, categoria, especificaciones) VALUES ('$nombre', '$marca', '$cantidad', '$precio', '$imagen', '$categoria', '$especificaciones');";
  $result = mysqli_query($enlace, $query);
  if(!$result) {
    die("Query Failed.");
  }

  $_SESSION['message'] = 'Task Saved Successfully';
  $_SESSION['message_type'] = 'success';
  header('Location: abmmain.php');

}

?>