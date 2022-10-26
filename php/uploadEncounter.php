<?php
    //echo 'holaaa'; 
    include('connectionDB.php');
    $enlace = conexionBD();
    mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

    if (isset($_POST['ingresoDatos'])) {
        
        $equipo1 = $_POST['equipo1'];
        $equipo2 = $_POST['equipo2'];
        $cancha = $_POST['cancha'];
        $fecha = $_POST['fecha'];
        $desde = $_POST['desde'];
        $hasta = $_POST['hasta'];
        //echo $_POST['desde'];

        $query = "INSERT INTO `fechas`(`fk_idCancha`,`fecha`, `fk_idEquipo 1`, `fk_idEquipo2`, `desde_hs`, `hasta_hs`) VALUES ('$cancha','2022-10-13', '1', '2', '23:55', '22:30');";
        //echo $query;
        
        $result = mysqli_query($enlace, $query);
        /*
        if(!$result) {
           
            die("Query Failed.");
        }
        
        echo $query;
        //$_SESSION['message'] = 'Task Saved Successfully';
        //$_SESSION['message_type'] = 'success';
        //header('Location: ../pages/abm.html');
*/
    }
    
?>

