console.log('Script Funcionando');
(function sendRequest(){
	const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
	httpRequest.open('GET', '../php/queryFechas.php', true);//Se hace la consulta al archivo php
	httpRequest.onreadystatechange= function(){
        if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
            let response = JSON.parse(this.responseText);//Se convierte JSON de respuesta a un arreglo JS
			console.log(response);
			//let container = document.querySelector('#container');//Se prepara el contenedor donde se pintara el resultado
			//container.innerHTML = '';
		}
	}
	httpRequest.send();
})();