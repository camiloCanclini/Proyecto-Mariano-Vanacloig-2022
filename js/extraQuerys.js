console.log('Script Funcionando');
function sendRequestQuery1(){
    const valueQuery1 = document.getElementById("valueQuery1").value;
	const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
	httpRequest.open('GET', '../php/queryAbm1.php?id='+valueQuery1, true);//Se hace la consulta al archivo php
	httpRequest.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
            let response = JSON.parse(this.responseText);//Se convierte JSON de respuesta a un arreglo JS
			console.log(response);
			const query1Container = document.getElementById('query1Container');//Se prepara el contenedor donde se pintara el resultado
            const cartelResultado = document.getElementById('resultadoQuery1');
            cartelResultado.removeAttribute("hidden");
			console.log('query1Container:', query1Container)
			query1Container.innerHTML = "";
			for (const i of response){

				//<==Creacion de Elementos==>

				let divContainer = document.createElement("DIV");
				let idDiv = document.createElement("DIV");
				let equipo1Div = document.createElement("DIV");
				let equipo2Div = document.createElement("DIV");
				let nombreCanchaDiv = document.createElement("DIV");
				let fechaDiv = document.createElement("DIV");
				let desdeDiv = document.createElement("DIV");
				let hastaDiv = document.createElement("DIV");
				let botonEditar = document.createElement("A");
				let botonEditarIco = document.createElement("I");
				let botonEliminar = document.createElement("A");
				let botonEliminarIco = document.createElement("I");

				//<==Seteo Elementos Fijos==>
				divContainer.classList.add("format-table");
				botonEditar.classList.add("edit");
				botonEditar.href = "editAbm.html?id="+i[0];
				botonEditarIco.classList.add("fas");
				botonEditarIco.classList.add("fa-edit");
				botonEliminar.classList.add("delete");
				botonEliminar.setAttribute("onclick","borrarFecha("+i[0]+");");
				botonEliminarIco.classList.add("fa-solid");
				botonEliminarIco.classList.add("fa-square-minus");
				//botonEditar.addEventListener()

				console.log('i:', i);
				idDiv.textContent = i[0];
				equipo1Div.textContent = i[1];
				equipo2Div.textContent = i[2];
				nombreCanchaDiv.textContent = i[3];
				fechaDiv.textContent = i[4];
				desdeDiv.textContent = i[5];
				hastaDiv.textContent = i[6];

				divContainer.appendChild(idDiv);
				divContainer.appendChild(equipo1Div);
				divContainer.appendChild(equipo2Div);
				divContainer.appendChild(nombreCanchaDiv);
				divContainer.appendChild(fechaDiv);
				divContainer.appendChild(desdeDiv);
				divContainer.appendChild(hastaDiv);
				botonEditar.appendChild(botonEditarIco);
				botonEliminar.appendChild(botonEliminarIco);
				divContainer.appendChild(botonEditar);
				divContainer.appendChild(botonEliminar);
				query1Container.appendChild(divContainer);
			}
		}
	}
	httpRequest.send();
};
function sendRequestQuery2(){
    const valueQuery2 = document.getElementById("valueQuery2").value;
    console.log('valueQuery2:', valueQuery2);
	const httpRequest = new XMLHttpRequest();//Se crea objeto para peticiones-consultas
	httpRequest.open('GET', '../php/queryAbm2.php?fecha='+valueQuery2, true);//Se hace la consulta al archivo php
    console.log('../php/queryAbm2.php?fecha='+valueQuery2 )
	httpRequest.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){//Si la consulta se realiza con exito se hace el bloque IF
            let response = JSON.parse(this.responseText);//Se convierte JSON de respuesta a un arreglo JS
			console.log(response);
			const query2Container = document.getElementById('query2Container');//Se prepara el contenedor donde se pintara el resultado
            const cartelResultado = document.getElementById('resultadoQuery2');
            cartelResultado.removeAttribute("hidden");
			console.log('query1Container:', query2Container)
			query2Container.innerHTML = "";
			for (const i of response){

				//<==Creacion de Elementos==>

				let divContainer = document.createElement("DIV");
				let idDiv = document.createElement("DIV");
				let equipo1Div = document.createElement("DIV");
				let equipo2Div = document.createElement("DIV");
				let nombreCanchaDiv = document.createElement("DIV");
				let fechaDiv = document.createElement("DIV");
				let desdeDiv = document.createElement("DIV");
				let hastaDiv = document.createElement("DIV");
				let botonEditar = document.createElement("A");
				let botonEditarIco = document.createElement("I");
				let botonEliminar = document.createElement("A");
				let botonEliminarIco = document.createElement("I");

				//<==Seteo Elementos Fijos==>
				divContainer.classList.add("format-table");
				botonEditar.classList.add("edit");
				botonEditar.href = "editAbm.html?id="+i[0];
				botonEditarIco.classList.add("fas");
				botonEditarIco.classList.add("fa-edit");
				botonEliminar.classList.add("delete");
				botonEliminar.setAttribute("onclick","borrarFecha("+i[0]+");");
				botonEliminarIco.classList.add("fa-solid");
				botonEliminarIco.classList.add("fa-square-minus");
				//botonEditar.addEventListener()

				console.log('i:', i);
				idDiv.textContent = i[0];
				equipo1Div.textContent = i[1];
				equipo2Div.textContent = i[2];
				nombreCanchaDiv.textContent = i[3];
				fechaDiv.textContent = i[4];
				desdeDiv.textContent = i[5];
				hastaDiv.textContent = i[6];

				divContainer.appendChild(idDiv);
				divContainer.appendChild(equipo1Div);
				divContainer.appendChild(equipo2Div);
				divContainer.appendChild(nombreCanchaDiv);
				divContainer.appendChild(fechaDiv);
				divContainer.appendChild(desdeDiv);
				divContainer.appendChild(hastaDiv);
				botonEditar.appendChild(botonEditarIco);
				botonEliminar.appendChild(botonEliminarIco);
				divContainer.appendChild(botonEditar);
				divContainer.appendChild(botonEliminar);
				query2Container.appendChild(divContainer);
			}
		}
	}
	httpRequest.send();
};

