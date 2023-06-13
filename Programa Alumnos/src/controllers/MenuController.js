//Creamos una funcion en la cual nos renderiza a la pagina del menu
function menu(req, res) {
    res.render('Menu/menu');
  }

//Exportacion de las funciones 
module.exports = {
    menu: menu,
  
}

