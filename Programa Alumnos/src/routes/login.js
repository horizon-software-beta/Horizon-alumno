//Constantes para llamar a las carpetas con todo y sus funciones
const express = require('express');
const { requiresAuth } = require('express-openid-connect');
const LoginController = require('../controllers/LoginController');
const MenuController = require('../controllers/MenuController');
const CarritoController = require('../controllers/CarritoController');

//funcion que nos ayuda a definir las rutas de nuestras paginas 
const router = express.Router();

//definimos la ruta que usaremos para la funcion index la cual nos redirigue hasia nuestro inicio de sesion
router.get('/login', LoginController.index);

/*Redireccion hacia nuestra pagian de menú*/
router.get('/menu', MenuController.menu);

//se utiliza la misma ruta login ya que la funcion auth nos ayuda a iniciar sesion 
router.post('/login', LoginController.auth);
//definimos la ruta para poder cerrar sesion
router.get('/logout', LoginController.logout);

//Redireccion hacia la pagina del carrito
router.get('/carrito', CarritoController.carrito);

//exportacion de las rutas
module.exports = router;
