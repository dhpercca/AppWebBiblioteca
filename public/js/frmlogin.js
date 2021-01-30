
function logear(){

    use=document.getElementById("usuario").value;
    cla=document.getElementById("clave").value;

    if(use && cla)
	{
		$.ajax({
			type:'post',
			url:'../sistema_biblioteca/acceso',
			dataType:'json',
			data:{
                usuario:use,
                clave:cla
            },
			
			success:function(html)
			{	
				data=html;
				
				if(data.length>0)
				{
					alert("Bienvenido al sistema.....")
					if(data[0].tipo_usuario==1 || data[0].tipo_usuario==2)
					{
						location.href ="../sistema_biblioteca/menu_principal";
					}
					if(data[0].tipo_usuario==3){
						location.href ="../sistema_biblioteca/solicitar_prestamos";
					}

					
				}
				else{
					alert("Usuario desconocido....")
				}
			
			}
		});	
	}
	else{
		alert("Por favor ingrese su cuenta...")
	}
    

    
    
}