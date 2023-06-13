//Definicion de nuestra funcion y variable para ecriptar contraseña
const bcrypt = require('bcrypt');

//Si esta auntenticado lo redireccionamos a main y home  
//si no, no lo mandamos 
function index(req, res) {
  console.log("entre");
    if (req.oidc.isAuthenticated()) {  
      console.log("autenticado");
    res.redirect('/layouts/main');
  } else {
    console.log("NO autenticado");
    res.render('/');
  }
}


//funcion para poder insertar nuestros datos ala base de datos tiene 2 
//parametros una solucitud del cliente y una respuesta del servidor
function storeUser(req,res){
  //Constante que almacena los datos enviados por el cliente en (req.body)
  const data=req.body;
  //conecta a la base gracias a una biblioteca, esta funcion acepta un callback con
  // 2 parametros un posible error o una coneccion
  req.getConnection((err,conn) => {
    //Hace una comparacion con los emails para comprovar si no hay uno identico al que nos dio el usuario
    //Manda los resultados a un callback que tiene 2 parametros err para un error y userData 
    //para los usuarios encontrados
    conn.query('SELECT * FROM users WHERE email= ?',[data.email], (err,userData) => {
      //Si se euncuentra unos similar nos redirige a la pagina de alta personal y nos muestra un error
      if (userData.length>0){
        //hace la redireccion y definimos lo que dira el error
        res.render('login/register', {error: 'El correo electronico ya esta en uso'});

      //Si no se encuentra ninguno procedemos a encriptar la contraseña
      } else {
        //Pedimos la contraseña y la encriptamos con un metodo hass el numero 12 es el total de rondas 
        //que se encriptara
        //El resultado que esta en has se pasa a una funcion de retorno llamado then
        bcrypt.hash(data.password, 12).then(hash => {
          console.log(hash);
          //Una ves encriptada se imprimira la version encriptada
          //La contraseña que esta en has se almacena en la propiedad password que a su vez esta 
          //almacenada en el objeto data
          data.password=hash;
          //console.log(data);

          //Una ves completado todo se insertan los datos (que estan en data) a la base con una consulta
          req.getConnection((err,conn) => {
              conn.query('INSERT INTO users SET ?',[data], (err,rows) => {
                //nos redirecciona a la pagina raiz
                res.redirect('/'); 
              });
          });
      
        });
      }
    });
  });
} 


//funcion para poder iniciar sesion
function auth(req, res) {
  const data = req.body;
	//let email = req.body.email;
	//let password = req.body.password;

  //conecta con la base de datos
  req.getConnection((err, conn) => {
    //Consulta para que aga la comparativa del email y ver si se encuentra uno similar en la base de datos
    conn.query('SELECT * FROM users WHERE email = ?', [data.email], (err, userData) => {
      //Si se encuentra uno similar
      if(userData.length > 0) {
        //se compararan las contraseñas 
        userData.forEach(element => {
          //se hace comparacion de contraseñas encriptadas
          bcrypt.compare(data.password,element.password, (err,isMatch) => {
            //si las contraseñas no coinciden se ejecutara lo siguinte
            if(!isMatch){
              console.log("out",userData);
              //si no son iguales saltara un error diciendo que la contraseña no coincide
              res.render('login/index', {error: 'Error password or email do not exist!'});
            } else {
              //si todo es similar podras ingresar a la pagina con una sesion iniciada
              console.log("wellcome");
              req.session.loggedin = true;
              req.session.name = element.name;
              req.session.email = element.email;
              
              res.redirect('/');
            }
          });   
        });     
      } else {
        res.render('login/index', {error: 'Error password or email do not exist!'});
      }    
    });
  });
}

//fucion para poder cerrar sesion
function logout(req, res) {
  //si se encuentra que si hay una sesion iniciada se destruira
  if (req.session.loggedin == true) {
    req.session.destroy();
  }
  //despues se mandara al incio de sesion con la sesion ya cerrada
  res.redirect('/login');
}


  

//Exportacion de nuestras funciones 
module.exports = {
  index: index,
  auth: auth,
  logout: logout,
  storeUser: storeUser,

}

