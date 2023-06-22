// Carga de librerias 
const express = require('express');
const { engine } = require('express-handlebars');
const myconnection = require('express-myconnection');
const mysql = require('mysql');
const session = require('express-session');
const bodyParser = require('body-parser');
const { Session } = require('express-session');

//--------------------------------------------------------------
require('dotenv').config()

const { auth } = require('express-openid-connect');

const config = {
  authRequired: false,
  auth0Logout: true,
  secret: process.env.SECRET,
  baseURL: process.env.BASEURL,
  clientID: process.env.CLIENTID,
  issuerBaseURL: process.env.ISSUERBASEURL
};

//---------------------------------------------------------------

//Definición de las rutas de acceso a procesos 
const loginRoutes = require('./routes/login');
const { logout } = require('./controllers/LoginController');

// creacion de la aplicación y asignación del puerto 
const app = express();
app.set('port',5000);
//definicion de la carpeta de plantillas (templates, views)
app.set('views', __dirname+'/views');
//Define al motor de vistas de Node.js para usar el "hbs" 
//este usa templetes para renderizar HTML.
app.engine('hbs', engine({
    extname: '.hbs',
}))
//el motor de plantillas se define como Handlebars
app.set('view engine', 'hbs');
//configura el middleware mediante el paquete body-parser para analizar los cuerpos 
//de las solicitudes HTTP entrantes, Para analizar las solicitudes entrantes 
//con cargas útiles codificadas en URL, que a menudo se usan al enviar datos de 
//formularios HTML.
app.use(bodyParser.urlencoded({
    extended: true
}));

//configura el middleware para analizar las solicitudes entrantes con cargas JSON.
app.use(bodyParser.json());
//define las credenciales de conección a la Base de datos 
app.use(myconnection(mysql,{
    host: 'sql9.freesqldatabase.com',
    user: 'sql9627372',
    password: 'rwGsXKqydR',
    port: 3306,
    database: 'sql9627372'
}, 'single'));

//define los parametros para crear una sesión
app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true 
}));

//---------------------------------------------------------
// auth router attaches /login, /logout, and /callback routes to the baseURL
//Configura un middleware de express para auth para poder autentificarse y autorizar 
//Utiliza estas opciones 
//authRequired esta en false lo que significa que se a los usuarios seran llevos a un inicio de secion si no estan 
//auntenticados 
//auth0Logout es un boleano que esta en true lo que significa que se podra destruir una session iniciada
//secret sirve para firmar las cookies generadas por auth 
//baseURL utiliza la URL del programa como base se utiliza para redirigir a los usuarios despues dela 
//autentificacion y cierre de session 
//clientID es un ID que identifica al usuario dentro del auth0 se utiliza para identificar la aplicacion
//en el proceso de la auntentificacion en auth0
//issuerBaseURL es una cadena que representa la URL del proveedor (auth0) y sirve para validar los tokens de 
//identidad recibidos durante el proceso de autentificacion 
app.use(auth(config));

//---------------------------------------------------------

//En este caso específico, el middleware que se configura es loginRoutes 
//y se monta en la ruta raíz ('/'). 
//Esto significa que cualquier solicitud a la aplicación pasará primero por el 
//middleware loginRoutes antes de pasar a cualquier middleware posterior.
app.use('/',loginRoutes);

//Este es método Express.js configura una ruta para la aplicación. 
//Toma dos parámetros: el primer parámetro es la ruta de la ruta y 
//el segundo parámetro es una función de devolución de llamada 
//que se ejecuta cuando se realiza una solicitud a esa ruta.
app.get('/', (req,res) => {
    //Si esta auntenticado metera al usuario a la pagina 
    if(req.oidc.isAuthenticated()) {
      //Imprime en la consola que esta auntenticado el usuario
      console.log("autenticado")

//------------------------------------------------------------
// req.isAuthenticated is provided from the auth router
//app.get('/', (req, res) => {
//    res.send(req.oidc.isAuthenticated() ? 'Logged in' : 'Logged out');
// });
//------------------------------------------------------------
     //Variable que contiene una expreccion regular para la comparacion y validacion de correos electronicos 
      var expresion = /[0-9]+@(cetis155)\.(edu.mx)$/;
      //Constante en la que se almacena el correo electronico del usuario auntenticado 
      const correo = req.oidc.user.email;
      //Condicion que si la exprecion coinside con la constante correo entonces deja entrar al usuario a la pagina
      //y imprimira en la consola que esta auntenticado esto lo hace al comparar el correo del usuario con la 
      //expresion regular que definimos como variable
      if(expresion.test(correo)) {
        console.log("Auntenticado");
        res.render('home',{name: req.oidc.user.name});

      //Si no, entonces redirigue al usuario a otra pagina donde le mostrara un mensage de error
      }else{
        res.redirect('/logout');
      }
      
    //Si no esta auntenticado el usuario entonces lo mandara al inicio de sesion 
    }else{
      console.log("NO autenticado");
      res.redirect('/login')
 }
})
//inicia la ejecución de la aplicación en el puert 5000
app.listen (app.get('port'), () =>{
    console.log('listening on port ', app.get('port'));
})
