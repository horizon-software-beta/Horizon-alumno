//Creamos una funcion en la cual nos renderiza a la pagina del carrito
function carrito(req, res) {
    res.render('Menu/carrito');
  }

//Exportacion de las funciones 
module.exports = {
    carrito: carrito,
  
}