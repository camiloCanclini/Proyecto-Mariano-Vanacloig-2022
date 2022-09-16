<?php
	function conexionBD(){
		$servidor="localhost";
		$usuario="root";
		$clave="admin";
		$baseDeDatos="mariano";
		$enlace = new mysqli($servidor, $usuario, $clave, $baseDeDatos);
		if($enlace -> connect_error ){
	
			die("No a sido posible establecer conexión con la bsae de datos");
		}
		return $enlace;
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