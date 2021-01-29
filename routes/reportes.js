exports.reportes= function(req, res){
    res.render('reportes',{page_title:"Reportes"});
    console.log('se cargo correctamente')
};
  
exports.reporte_ranking= function(req, res){
    res.render('reporte_ranking',{page_title:"Reporte_ranking"});
    console.log('se cargo correctamente')
};

exports.reporte_carnets= function(req, res){
    res.render('reporte_carnets',{page_title:"Reporte_carnets"});
    console.log('se cargo correctamente')
};

exports.listarranking = function(req, res){
    //var dni = req.params.dni;	
    //var input = JSON.parse(JSON.stringify(req.body));
    req.getConnection(function(err,connection){
         //var registro= {dni: input.dni};
          //var query = connection.query('select ejemplar_libro.idejemplar_libro, autor.descripcion as autor,editorial.descripcion as editorial ,categoria.descripcion as categoria,ejemplar_libro.descripcion,ejemplar_libro.titulo  from (((ejemplar_libro inner join autor on ejemplar_libro.autor=autor.idautor)  inner join editorial on ejemplar_libro.editorial=editorial.ideditorial) inner join categoria on ejemplar_libro.categoria=categoria.idcategoria)',function(err,rows)
          var query = connection.query('SELECT prestamo.usuario, usuario.idusuario, persona.idpersona, persona.nombres, persona.apellidos, count(prestamo.usuario)as puntaje, estudiante.grado, estudiante.seccion, estudiante.nivel from prestamo inner join usuario on prestamo.usuario=usuario.idusuario inner join persona on usuario.persona=persona.idpersona inner join estudiante on persona.idpersona=estudiante.persona WHERE CAST(prestamo.fecha_entrega AS date) < CAST("2020-01-01" AS date) and CAST(prestamo.fecha_entrega AS date) > CAST("2019-01-01" AS date) and estudiante.nivel="PRIMARIA" group by prestamo.usuario order by puntaje DESC',function(err,rows)
          

          {
              if(err)
                  console.log("Error Selecting : %s ",err );
               res.json(rows);
        res.json(rows.length);
             
          //console.log(json);
           });
      //console.log(query.sql);
      });
    
  };

  

