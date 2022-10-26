console.log('Script Funcionando');

(function sendRequest(){

    url = window.location.search;
    console.log('url:', url)
    const paramsUrl = new URLSearchParams(url);
    let idParam = paramsUrl.get("id");
    console.log(paramsUrl.get("id"));

	const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
	httpRequest.open('GET', '../php/editAbm.php?id='+idParam, true);//Se hace la consulta al archivo php
    console.log('../php/editAbm.php?id='+idParam);
	httpRequest.onreadystatechange= function(){
        if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
            let response = JSON.parse(this.responseText);//Se convierte JSON de respuesta a un arreglo JS
			console.log(response);
            let form = document.getElementById('form');
			let equipo1 = document.getElementById('equipo1');
			let equipo2 = document.getElementById('equipo2');
            let cancha = document.getElementById('cancha');
            let fecha = document.getElementById('fecha');
            let desde = document.getElementById('desde');
            let hasta = document.getElementById('hasta');
            console.log('form.action:', form.action);

            for (const i of response) {
                form.action += '?id='+i[0];
                cancha.value = i[1];
                equipo1.value = i[2];
                equipo2.value = i[3];
                fecha.value = i[4].split(" ")[0];//Se hace un corte porque la fecha viene con hora incluida
                desde.value = i[5]
                hasta.value = i[6]
            }
		}
	}
	httpRequest.send();
})();
