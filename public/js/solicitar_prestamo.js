var sol;
$(document).ready(function(){
    cargar_libro_disponibles();
    tabla_mis_solicitudes();
	    
   
});

function tablalibros_disponibles(data)
{
	table= "<table id='grilla_libros_disponibles' class='table table-bordered active'><thead><tr class='thead-dark'><th>ID</th><th>CODIGO</th><th>TITULO</th><th>AUTOR</th><th>CATEGORIA</th><th>EDITORIAL</th><th>ACCION</th></tr></thead><tbody>";
	
   if(data.length)
   {                 
	   for(var i = 0;i < data.length;i++)
	   { 
	   table +="<tr><td>" + data[i].codlibro + "</td><td>" + data[i].codigo + "&nbsp;</td><td>" + data[i].titulo + "</td>"
	   table +="<td>" + data[i].autor + "</td><td>"+data[i].categoria+"</td><td>"+data[i].editorial+"</td>"
	   
	   table +="<td><button type='button' class='btn btn-success' onclick='openModal_libro("+data[i].idejemplar_libro+")'>Solicitar</button></td></tr>";
	     
	  
	 
	   }
	   //$('actualizar').click($('#exampleModal').modal(options));
   }
   table += "</tbody></table>";
   $('#Listar_libros').html(table);	
     
}

function cargar_libro_disponibles()
{
	
	$.ajax({
		type:'post',
		url:'../sistema_biblioteca/listar_libros_disponibles',
		dataType:'json',
		success:function(html)
		{		
			
				//console.log(html)
				data = html;
	            tablalibros_disponibles(data);
			
				
				//limpiaCampos();
		},
		
	});

}

function buscarxtitulo_autor()
{	
	if(buscar_t=='0')
	{
		buscar_t=document.getElementById("buscar_t").value;
	}
	
	if(buscar_t)
	
	{
		$.ajax({
			type:'post',
			url:'../sistema_biblioteca/buscarxtitulo_autor',
			dataType:'json',
			data:"buscar_t="+buscar_t,
			success:function(html)
			{	
				
				lib=html;
				tablaejemplares(lib);
				
			}
		});
		
	}
	else{
		alert("Ingrese un titulo....")
	}
	
}

function tabla_mis_solicitudes()
{
	table= "<table id='grilla_mislibros' class='table table-bordered active'><thead><tr class='thead-dark'><th>ID</th><th>USUARIO</th><th>LIBRO</th><th>AUTOR</th><th>ACCION</th></tr></thead><tbody>";
	
   //if(data.length)
   //{                 
	   //for(var i = 0;i < data.length;i++)
	   { 
	   //table +="<tr><td>" + data[i].codlibro + "</td><td>" + data[i].codigo + "&nbsp;</td><td>" + data[i].titulo + "</td>"
	   //table +="<td>" + data[i].autor + "</td><td>"+data[i].categoria+"</td><td>"+data[i].editorial+"</td>"
	   
	   //table +="<td><button type='button' class='btn btn-success' onclick='openModal_libro("+data[i].idejemplar_libro+")'>Solicitar</button></td></tr>";
	     
	  
	 
	   }
	   //$('actualizar').click($('#exampleModal').modal(options));
   //}
   table += "</tbody></table>";
   $('#Listar_solicitud').html(table);	
     
}

function cargar_mis_solicitudes()
{
	
	$.ajax({
		type:'post',
		url:'../sistema_biblioteca/listar_libros_disponibles',
		dataType:'json',
		success:function(html)
		{		
			
				//console.log(html)
				data = html;
	            tablalibros_disponibles(data);
			
				
				//limpiaCampos();
		},
		
	});

}


