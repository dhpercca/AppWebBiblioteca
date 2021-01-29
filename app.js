var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
//load customers route
var sistema_biblioteca = require('./routes/sistema_biblioteca'); 
var reportes = require('./routes/reportes'); 
var app = express();

var connection  = require('express-myconnection'); 
var mysql = require('mysql');
//all environments
app.set('port', process.env.PORT || 4300);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.json());
app.use(express.urlencoded());
app.use(express.methodOverride());

app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

/*------------------------------------------
    connection peer, register as middleware
    type koneksi : single,pool and request 
-------------------------------------------*/
app.use(  
    connection(mysql,{
        host: 'localhost',
        user: 'root',
        password : '',
        port : 3306, //port mysql
        database:'sistema_biblioteca'
    },'pool') //or single
);


//app.post('/empleado/guardar',empleado.guardar);

//app.post('/empleado/buscardni',empleado.buscardni);
//app.post('/empleado/actualizar',empleado.actualizar);
//app.post('/empleado/eliminar',empleado.eliminar);
app.post('/sistema_biblioteca/acceso',sistema_biblioteca.acceso);
app.post('/sistema_biblioteca/buscarxtitulo',sistema_biblioteca.buscarxtitulo);
app.post('/sistema_biblioteca/buscarxcodigo',sistema_biblioteca.buscarxcodigo);
app.post('/sistema_biblioteca/guardar_libro',sistema_biblioteca.guardar_libro);
app.post('/sistema_biblioteca/actualizar_libro',sistema_biblioteca.actualizar_libro);
app.post('/sistema_biblioteca/guardar_ejemplar',sistema_biblioteca.guardar_ejemplar);
app.post('/sistema_biblioteca/guardar_autor',sistema_biblioteca.guardar_autor);
app.post('/sistema_biblioteca/guardar_editorial',sistema_biblioteca.guardar_editorial);
app.post('/sistema_biblioteca/guardar_categoria',sistema_biblioteca.guardar_categoria);
app.post('/sistema_biblioteca/eliminar_libro',sistema_biblioteca.eliminar_libro);
app.post('/sistema_biblioteca/actualizar_ejemplar',sistema_biblioteca.actualizar_ejemplar);
app.get('/sistema_biblioteca/menu_principal',sistema_biblioteca.menu_principal);
app.get('/sistema_biblioteca/registrar_libro',sistema_biblioteca.registrar_libro);
app.get('/sistema_biblioteca/autor',sistema_biblioteca.autor);
app.get('/sistema_biblioteca/editorial',sistema_biblioteca.editorial);
app.get('/sistema_biblioteca/categoria',sistema_biblioteca.categoria);
app.get('/sistema_biblioteca/estado_libro',sistema_biblioteca.estado_libro);
app.get('/sistema_biblioteca/ejemplar_libro',sistema_biblioteca.ejemplar_libro);
app.post('/sistema_biblioteca/ejemplar_libro_rel',sistema_biblioteca.ejemplar_libro_rel);
app.get('/sistema_biblioteca/validar_prestamos',sistema_biblioteca.validar_prestamos);
app.get('/sistema_biblioteca/prestamos',sistema_biblioteca.prestamos);
app.post('/sistema_biblioteca/listarejemplar',sistema_biblioteca.listarejemplar);
app.post('/sistema_biblioteca/listar_libros_disponibles',sistema_biblioteca.listar_libros_disponibles);
app.get('/sistema_biblioteca/solicitar_prestamos',sistema_biblioteca.solicitar_prestamos);
app.get('/sistema_biblioteca/frmcarnet',sistema_biblioteca.frmcarnet);
app.get('/sistema_biblioteca/reportes',sistema_biblioteca.reportes);
app.get('/sistema_biblioteca/frmlogin',sistema_biblioteca.frmlogin)
app.get('/reportes/reportes',reportes.reportes);
app.get('/reportes/reporte_ranking',reportes.reporte_ranking);
app.post('/reportes/listarranking',reportes.listarranking);
app.get('/reportes/reporte_carnets',reportes.reporte_carnets);
//app.post('/reportes/generar_ranking',reportes.generar_ranking);
//app.get('/reportes/validar_ranking',reportes.validar_ranking);
//app.get('/clientes',clientes.list)
app.use(app.router);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server escuchando en puerto ' + app.get('port'));
});