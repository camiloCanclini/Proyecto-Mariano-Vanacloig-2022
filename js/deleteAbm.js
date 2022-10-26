console.log('Script Funcionando');

function borrarFecha(idParam){
    if(confirm("Realmente desea borrar este registro?")){

        const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
        httpRequest.open('GET', '../php/deleteAbm.php?id='+idParam, true);//Se hace la consulta al archivo php
        console.log('../php/deleteAbm.php?id='+idParam);
        httpRequest.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
                if(this.responseText == 0){
                    alert("Registro Borrado Exitósamente");
                    location.reload();
                }
            }
        }
        httpRequest.send();
    }
    
}
