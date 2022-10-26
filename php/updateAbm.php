
<?php
    include('connectionDB.php');
    $enlace = conexionBD();
    mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

    if (isset($_POST['actualizar'])) {
        
        $id = $_GET['id'];
        $equipo1 = $_POST['equipo1'];
        $equipo2 = $_POST['equipo2'];
        $cancha = $_POST['cancha'];
        $fecha = $_POST['fecha'];
        $desde = $_POST['desde'];
        $hasta = $_POST['hasta'];

        $query = "UPDATE `fechas` SET `fk_idEquipo1` = '$equipo1', `fk_idEquipo2` = '$equipo2', `fk_idCancha` = '$cancha', `fecha` = '$fecha', `desde_hs` = '$desde', `hasta_hs` = '$hasta' WHERE `id` = '$id';";

        //echo $query;
        $result = mysqli_query($enlace, $query);

        if(!$result) {
           
            die("Query Failed.");
        }
        //$_SESSION['message'] = 'Task Saved Successfully';
        //$_SESSION['message_type'] = 'success';
        header('Location: ../pages/abm.html');

    }
    
?>