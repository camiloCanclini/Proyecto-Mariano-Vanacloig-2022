<?php
	function conexionBD(){
		$servidor="127.0.0.1:3306";
		$usuario="root";
		$clave="admin";
		$baseDeDatos="Mariano";
		$enlace = new mysqli($servidor, $usuario, $clave, $baseDeDatos);
		if($enlace -> connect_error){
			die("No a sido posible establecer conexión con la base de datos");
		}else{
			//echo "conexion exitosa";
			return $enlace;
		}
	}
	function disconnectDB($enlace){
		$close = mysqli_close($enlace);
			if($close){
				echo 'La desconexion de la base de datos se ha hecho satisfactoriamente <br>';
			}else{
				echo 'Ha sucedido un error inexperado en la desconexion de la base de datos <br>';
			}   
		return $close;
	}

?>