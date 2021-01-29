$(document).ready(main);

function main(){
    $('.submenu').click(function(){
        $(this).children('.children').slideToggle();
    });
    
}

$(document).ready(function(){
	
	cargar_ranking();

    $(".hamburger").click(function(){
        $(".wrapper").toggleClass("collapse");
    });
   
});

function cargar_ranking()
{
	
	$.ajax({
		type:'post',
		url:'../reportes/listarranking',
		dataType:'json',
		success:function(html)
		{		
			
				//console.log(html)
				data = html;
	            tablaranking(data);
			
				
				//limpiaCampos();
		},
		
	});

}

function tablaranking(data)
{
	//table= "<table id='grilla_ejemplares' class='table table-bordered active'><thead><tr class='thead-dark'><th>ID</th><th>AUTOR</th><th>EDITORIAL</th><th>CATEGORIA</th><th>TITULO</th><th>DESCRIPCION</th><th>ACCION</th></tr></thead><tbody>";
    table= "<table id='grilla_ranking' class='table table-bordered active'><thead><tr class='thead-dark'><th>ID ESTUDIANTE</th><th>NOMBRES</th><th>APELLIDOS</th><th>PUNTAJES</th><th>GRADO</th><th>SECCION</th><th>NIVEL</th></tr></thead><tbody>";
    
   if(data.length)
   {                 
	   for(var i = 0;i < data.length;i++)
	   { 
	   table +="<tr><td>" + data[i].idpersona + "</td><td>" + data[i].nombres + "&nbsp;</td><td>" + data[i].apellidos + "</td>"
	   table +="<td>" + data[i].puntaje + "</td><td>"+data[i].grado+"</td><td>"+data[i].seccion+"</td><td>"+data[i].seccion+"</td>";
	   
	   //table +="<td><button type='button' class='btn btn-info' onclick='openModal_libro("+data[i].idejemplar_libro+")'>Agregar libro</button></td></tr>";

	   }
	   //$('actualizar').click($('#exampleModal').modal(options));

   }
   table += "</tbody></table>";
   $('#ListaRankig').html(table);	
   
   
}