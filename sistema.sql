-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 27-05-2023 a las 05:29:27
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito_compras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `id_Folio` int(11) NOT NULL,
  `id_Producto` int(11) NOT NULL,
  `Cantidad` float NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `Nombre_Completo` varchar(45) NOT NULL,
  `Correo_Electronico` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezado`
--

CREATE TABLE `encabezado` (
  `Folio` int(11) NOT NULL,
  `id_Empleado` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Estatus` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` varchar(45) NOT NULL,
  `Unidad` varchar(45) NOT NULL,
  `Existencia` varchar(45) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Imagen` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `Nombre`, `Precio`, `Unidad`, `Existencia`, `Descripcion`, `Imagen`) VALUES
(1, 'Coca Cola', '18', '355ml', '80', 'Bebida azucarada gaseosa.', 'https://i0.wp.com/tuminisuper.mx/wp-content/uploads/2020/09/BYJ34.jpg?fit=600%2C600&ssl=1'),
(2, 'Arizona', '20', '660ml', '80', 'Jugos de variedad de sabores exoticos.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00061300876528L.jpg'),
(3, 'FuzeTea', '20', '600ml', '20', 'Tés y bebidas de frutas no gaseosas.', 'https://m.media-amazon.com/images/I/61Gj3Fubv1L._AC_SX342_.jpg'),
(4, 'Brownies', '17', '1 pieza', '40', 'Bizcocho pequeño de chocolate.', 'https://png.pngitem.com/pimgs/s/174-1740888_brownies-png-transparent-png.png'),
(5, 'Gomitas', '15', '100gr', '25', 'Caramelos masticables de azucar con sabores frutales.', 'https://img2.freepng.es/20180629/thk/kisspng-gummy-bear-gummi-candy-gelatin-dessert-cotton-cand-gummy-bears-5b35edec377d51.7035623315302609722273.jpg'),
(6, 'Tamborcitos', '1', '4.5gr', '50', 'Golosinas enchiladas y acidas.', 'https://pinatilandia.com.mx/wp-content/uploads/2020/06/tamborines.jpg'),
(7, 'Pizza', '20', 'Caja', '20', 'Rebanada de pizza.', 'https://pizzamas.com.mx/wp-content/uploads/2020/07/pizza-mas-pizzas-rebanada.png'),
(8, 'Powerade', '22', '955ml', '15', 'Bebida hidratante con sabores frutales.', 'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dw7a8deeae/images/product/7501055329267_A.jpg?sw=1000&sh=1000&sm=fit'),
(9, 'Onigiri', '35', '1 pieza', '50', 'Bola de arroz tringular rellena de otros ingredientes.', 'https://www.pngkit.com/png/detail/36-361963_29-images-about-png-icons-on-we-heart.png'),
(10, 'PicaFresa', '1', '1 pieza', '40', 'Gomitas confitadas con chile y azúcar sabor fresa.', 'https://cdn.shopify.com/s/files/1/0372/4450/2149/products/picafresa_gigante_766x460.png?v=1591397660'),
(11, 'Mazapan', '10', '1 pieza', '20', 'Pasta de almendras crudas molidas y azúcar pulverizada.', 'https://cdn.shopify.com/s/files/1/0430/5489/1157/products/Disenosintitulo-2021-05-20T163304.109_23c5de19-c79c-499b-bf75-8378be91896b_900x.png?v=1621565088'),
(12, 'Burritos', '20', '1 pieza', '50', 'Tortilla de harina rellena con carne vacuna deshebrada.', 'https://img2.freepng.es/20190519/iqw/kisspng-mission-burrito-taco-fajita-mexican-cuisine-greek-burritos-recipes-hubs-5ce1e4e07deb18.4770085515583080645158.jpg'),
(13, 'Torta de Bistec', '35', '1 pieza', '30', 'Bolillo relleno de bistec, chile, mayonesa, jitomate y aguacate.', 'https://p.kindpng.com/picc/s/208-2084827_beef-torta-png-download-torta-asada-png-transparent.png'),
(14, 'Hotdogs', '15', '1 pieza', '15', 'Pan con una salchicha, ketchup, mostaza, jitomate y cebolla.', 'https://assets.stickpng.com/images/580b57fcd9996e24bc43c1b7.png'),
(15, 'Cacahuates', '13', '1 pieza', '30', 'Una legumbre salteada.', 'https://http2.mlstatic.com/D_NQ_NP_812917-MLM51408908490_092022-V.jpg'),
(16, 'Troll', '18', '1 pieza', '30', 'Mangonada con chile.', 'https://i.ytimg.com/vi/o0CiNrClEQo/maxresdefault.jpg'),
(17, 'Agua Natural', '12', '1 pieza', '30', 'Agua natural en vaso.', 'https://chedrauimx.vtexassets.com/arquivos/ids/14505506/7501055310883_00.jpg?v=638183315737270000'),
(18, 'Agua de Limon', '18', '1 pieza', '30', 'Agua de limon natural.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750105535246L.jpg'),
(19, 'Tacos dorados', '10', '1 pieza', '50', 'Tacos carne dorada.', 'https://lostacosdela6.com/wp-content/uploads/dorados.png'),
(20, 'Molletes', '25', '1 pieza', '20', 'Medio bolillo con frijoles y queso.', 'https://img1.freepng.es/20180405/ske/kisspng-baked-potato-stuffing-french-fries-clip-art-potato-5ac6a9ceb40b79.3395597115229690387375.jpg'),
(21, 'Hielitos', '18', '860gr', '15', 'Nieves de sabores frutales.', 'https://i.pinimg.com/originals/16/7e/de/167ede7ebd5bb8dd8a67f67c774b461c.png'),
(22, 'Coca-cola sin azucar ', '16', '600ml', '50', 'Bebida gaseosa reducida en azucar.', 'https://cdn.shopify.com/s/files/1/0279/8151/2798/products/RE0200_761x.jpg?v=1600970389'),
(23, 'Muffin de chocolate', '15', '160gr', '25', 'Pan chocolatado con chispas de chocolate. ', 'https://img2.freepng.es/20180812/ra/kisspng-muffin-cupcake-chocolate-brownie-red-velvet-cake-product17-anna-tkach-patisserie-5b70ab31e50a58.4929903115341105139382.jpg'),
(24, 'Pelon mini', '12', '13gr', '15', 'Dulce picoso.', 'https://mandalomarket.com/wp-content/uploads/2022/10/pelon_pelo_rico_719886211713_Mandalo_Market.jpg'),
(25, 'Bubulubu', '10', '20gr', '25', 'Barra de chocolate dulce con mermelada de fresa de relleno.', 'https://farmaciadigitalff-media.azureedge.net/catalog/product/cache/a77266c1abf4147499139dcd165bfd03/0/6/061d96106c57345b586cc101561a74918701d29eef8e266ce00c777b0bc37d1c.jpg'),
(26, 'Tixtix', '6', '11gr', '30', 'Paleta de caramelo con polvos de sabores dulces.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750101117671L.jpg'),
(27, 'Snickers', '15', '52gr', '10', 'Galleta de chocolate de leche rellena de caramelo.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/mg/gm/1p/images/product-images/img_large/00750617451224l.jpg'),
(28, 'Chicles canels', '2', '5gr', '60', 'Chicles de sabores.', 'https://cdn.shopify.com/s/files/1/2164/2083/products/0fee8844bfd22569048d286a18faecc1_800x.png?v=1551231815'),
(29, 'Kankry', '15', '15gr', '25', 'Galleta de chocolate.', 'https://http2.mlstatic.com/D_NQ_NP_983637-MLM49360616564_032022-O.jpg'),
(30, 'Chicles bubbaloo', '2', '5.5gr', '50', 'Chicles sabor fresa.', 'https://candymarket.com.mx/wp-content/uploads/2022/03/Bubbaloo.jpg'),
(31, 'Paleta tarrito', '8', '16gr', '40', 'Caramelo dulce con toques acidos.', 'https://dulces.mx/wp-content/uploads/2019/12/tarritos-mexico-600x400.jpg'),
(32, 'Paleta mini chups', '6', '6gr', '80', 'Caramelo dulce.', 'https://ibarramayoreo.com/images/IMAGENES/44493/02.jpg/A05'),
(33, 'Paleta rockaleta', '11', '24gr', '18', 'Paleta con capas de caramelo enchilado con goma de mascar en el centro.', 'https://s.cornershopapp.com/product-images/1078874.jpg?versionId=RmEd0zKCpnkLPw_jga42JHT2Mrikp81Z'),
(34, 'Chiles clorets', '2', '2.8gr', '60', 'Chicles mentolados.', 'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dw80bde5eb/images/product/7622210595416_A.jpg?sw=1000&sh=1000&sm=fit'),
(35, 'Paleta tutsi pop', '7', '20gr', '50', 'Caramelo de fresa con chicle en el centro.', 'https://m.media-amazon.com/images/I/71CYz68+OgL._AC_UF894,1000_QL80_.jpg'),
(36, 'Halls', ' 14', '25,3 gr', '12', 'Mentas con diferentes sabores.', 'https://cdn.shopify.com/s/files/1/0279/9265/3924/products/ga.png?v=1628950451'),
(37, 'Takis', '15', '62gr', '20', 'Frituras enchiladas.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750103042453L.jpg?odnHeight=264&odnWidth=264&odnBg=FFFFFF'),
(38, 'Duvalin', '5', '15gr', '18', 'Cremas de tres sabores por paquete.', 'https://cdn.shopify.com/s/files/1/0491/0759/9516/products/DUVALIN15GR..jpg?v=1622489679'),
(39, 'Chicles trident', '3', '5.2gr', '40', 'Goma de mascar mentolada.', 'https://www.laranitadelapaz.com.mx/images/thumbs/0005548_chicle-trident-menta-18-paquetes-de-5-piezas_510.jpeg'),
(40, 'Galletas Oreo', '18', '114gr', '15', 'Galletas de chocolate.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00762221083366L.jpg'),
(41, 'Galletas TrikiTrakes', '17', '115gr', '15', 'Galletas de chocolate con chispas de chocolate.', 'https://superfenix.mx/wp-content/uploads/2022/06/7501000140855.jpg'),
(42, 'Galletas Principe', '20', '225gr', '20', 'Galleta dulce con relleno de chocolate.', 'https://detqhtv6m6lzl.cloudfront.net/wp-content/uploads/2021/07/7501000128167-1.jpg'),
(43, 'Rellerindo ', '5', '11gr', '35', 'Dulce de tamarindo con chile.', 'https://cdn.shopify.com/s/files/1/0372/4450/2149/products/rellerindo-dulces-vero_680x680.jpg?v=1600101982'),
(44, 'Jugo del valle', '18', '500ml', '20', 'Bebida azucarada de sabores frutales.', 'https://res.cloudinary.com/walmart-labs/image/upload/d_default.jpg/w_960,dpr_auto,f_auto,q_auto:best/gr/images/product-images/img_large/00750105535692L.jpg'),
(45, 'Pulparindo', '8', '14gr', '20', 'Barra de tamarindo con chile.', 'https://detqhtv6m6lzl.cloudfront.net/wp-content/uploads/2021/05/725226066660-1.jpg'),
(46, 'Cacahuates Japoneses', '11', '142gr', '30', 'Cacahuates con sal empaquetados.', 'https://cdn.shopify.com/s/files/1/0268/4046/5603/products/CapturadePantalla2020-10-28ala_s_10.36.35_600x.png?v=1603903021'),
(47, 'Rebanada de pastel', '15', '16gr', '16', 'Rebanada de pastel del dia.', 'https://alchef.mx/wp-content/uploads/2020/11/DSF3496.jpg'),
(48, 'Galleta casera', '5', '50gr', '25', 'Galletas de chocolate y matequilla.', 'https://recetadepostres.net/wp-content/uploads/2019/02/Galletas.jpg'),
(49, 'Chocolates ferrero', '6', '12.5 gr', '40', 'Chocolate con una avellana dentro.', 'https://i0.wp.com/magenta.style/wp-content/uploads/2023/01/ferrero-rocher.png?fit=500%2C500&ssl=1'),
(50, 'Cocolate KitKat', '13', '100gr', '10', 'Barra de chocolate de leche.', 'https://chedrauimx.vtexassets.com/arquivos/ids/14710191-800-450?v=638195292538100000&width=800&height=450&aspect=true'),
(51, 'Chocolate Kiss', '4', '10gr', '30', 'Bolita de chocolate de leche.', 'https://m.media-amazon.com/images/I/41Wnh1DMoXL._AC_UF894,1000_QL80_.jpg'),
(52, 'Chocolate CarlosV', '16', '25gr', '35', 'Barra de chocolate de leche.', 'https://i5.walmartimages.com.mx/mg/gm/1p/images/product-images/img_large/00750105863808l.jpg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),
(53, 'Skittles', '16', '61.5gr', '25', 'Dulces chiclosos con sabores exoticos.', 'https://i5.walmartimages.com.mx/mg/gm/1p/images/product-images/img_large/00750222681717l.jpg'),
(54, 'cheetos', '17', '48gr', '20', 'Frituras de queso.', 'https://tiendasneto.com.mx/media/catalog/product/cache/cb1e6b076f68ee0ac6e5e542f63310fa/6/0/6060004896-1_10.jpg'),
(55, 'Doritos', '16', '58gr', '20', 'Frituras de queso con chile.', 'https://cdn.shopify.com/s/files/1/0266/6368/2128/products/7501011131064.jpg?v=1662563291'),
(56, 'Sabritas', '15', '45gr', '25', 'Frituras de papa con sal.', 'https://farmaciadigitalff-media.azureedge.net/catalog/product/cache/a77266c1abf4147499139dcd165bfd03/a/b/ab80d6b77aa832772d9df4b3dab71d9cea083bcad22663bc6d56c0134ae637d5.jpg'),
(57, 'Pinguinos', '18', '80gr', '20', 'Panquesitos de chocolate de leche con crema batida.', 'https://cdn.shopify.com/s/files/1/0297/6812/2412/products/Fotos-tienda-en-linea-Feb2023_0041_6_600x.png?v=1676580612'),
(58, 'Donas', '15', '28gr', '20', 'Pan dulce con diferentes glaseados o solo azucar.', 'https://comidaschilenas.com/wp-content/uploads/2020/04/Receta-de-donas-caseras.jpg'),
(59, 'Danonino', '14', '440gr', '25', 'Yogurt de fresa.', 'https://oneiconn.vtexassets.com/arquivos/ids/185725/YOP-YOGURT-FRESA-330GR.jpg?v=638095094938300000'),
(60, 'Chips ', '17', '46gr', '25', 'Frituas de papa con chile jalapeño.', 'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00750301854471L.jpg?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),
(61, 'Fritos clasicos', '16', '86gr', '20', 'Frituras de harina con sal.', 'https://cdn.shopify.com/s/files/1/0266/6368/2128/products/7501011131125_800x.jpg?v=1662563293'),
(62, 'Yakult', '8', '80ml', '35', 'Bebida azucarada.', 'https://myplacesuper.com/84-large_default/yakult.jpg'),
(63, 'Maruchan', '22', '64gr', '15', 'Sopa instantanea.', 'https://tiendasneto.com.mx/media/catalog/product/cache/cb1e6b076f68ee0ac6e5e542f63310fa/1/0/1040000800-1_12_1.jpg'),
(64, 'Sandwich', '30', '83gr', '20', 'Pan con jamon y queso.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsG_dTuRFoa4H1Xf2DiZxKzfJEIbnG7ZueqSdcqtAePw-3b8AqH8kAfESeCz9XmAriVYA&usqp=CAU'),
(65, 'Ensaladas', '35', '55gr', '10', 'Charola con lechuga, jitomate y aguacate.', 'https://s1.eestatic.com/2021/03/02/cocinillas/recetas/ensaladas/562955653_174333694_1706x960.jpg'),
(66, 'Jugo de naranja', '18', '500ml', '15', 'Jugo natural de la naranja.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdzeBQl-PvHSijx1rD-0Rx0OIdfj8Pp30Q0Q&usqp=CAU'),
(67, 'Coctel de fruta', '28', '300gr', '15', 'Vaso con vaiedad de fruta picada.', 'https://static.onecms.io/wp-content/uploads/sites/21/2016/06/01/coctel-de-frutas-facil-2000.jpg'),
(68, 'Baguette', '48', '400gr', '25', 'Baguette con mayonesa, carne, jamon y queso.', 'https://cheforopeza.com.mx/wp-content/uploads/2017/07/baguette-para-consentirte_recetas_chef-oropeza-jpg'),
(69, 'Chocos', '18', '300ml', '20', 'Batido de leche, canela y el sabor que eliga el ciente.', 'https://cdn0.recetasgratis.net/es/posts/5/6/7/batido_de_chocolate_47765_paso_4_600.jpg'),
(70, 'Papas a la francesa', '32', '300gr', '20', 'Papas fritas con queso amarillo derretido.', 'https://imag.bonviveur.com/patatas-fritas-en-freidora-de-aire.jpg'),
(71, 'tacos de guiso', '12', '180gr', '50', 'Tortilla de maiz con algun guiso casero.', 'https://imagenescityexpress.scdn6.secure.raxcdn.com/sites/default/files/2019-10/tacos-guisado-comida-callejera-cdmx.jpg'),
(72, 'Bolillo de guiso', '34', '250gr', '45', 'Bolillo con mayonesa relleno de algun guiso.', 'https://i.ytimg.com/vi/LkYorvIVld0/maxresdefault.jpg'),
(73, 'Palomitas ', '17', '180gr', '15', 'Palomitas de maiz con mantequilla.', 'https://i.blogs.es/78deb3/palomitas/840_560.jpg'),
(74, 'Agua embotellada', '17', '1L', '30', 'Botella de agua.', 'https://tofuu.getjusto.com/orioneat-prod-resized/eYmtwKtsJPuNnEAzN-1200-1200.webp'),
(75, 'Café', '15', '200ml', '15', 'Vaso con cafe sin azucar.', 'https://cdn7.kiwilimon.com/recetaimagen/36986/46349.jpg'),
(76, 'Quesadilla', '15', '130gr', '10', 'Tortilla de maiz con queso dentro.', 'https://upload.wikimedia.org/wikipedia/commons/7/75/Quesadilla_2.jpg'),
(77, 'Sincronizada', '20', '200gr', '15', 'Tortilla de maiz con queso,jitomate y aguacate.', 'https://comerbonito.com/wp-content/uploads/Sincronizadas-de-Jamon-y-Queso.jpg'),
(78, 'Bolis', '12', '100gr', '30', 'Bolsa de hielo con un hielo de sabor frutal.', 'https://i.blogs.es/0ae28b/bolis/450_1000.jpg'),
(79, 'Monster', '35', '473ml', '20', 'Bebida energizante.', 'https://cdn.shopify.com/s/files/1/0270/5195/0134/products/e479f6da31b1e27d59380e539d085497.png?v=1591987741'),
(80, 'Gelatina', '15', '150gr', '15', 'Postre dulce empaquetado', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpNhLhTDCkA7oh216e28G5U9xZpGla9-cPRw&usqp=CAU'),
(81, 'Chocolate M&M', '15', '43.8gr', '25', 'Chocolates empaquetados.', 'https://coopidrogas.vtexassets.com/arquivos/ids/29289772-800-800?v=638182333981000000&width=800&height=800&aspect=true'),
(82, 'Chicles orbit', '1', '4.6gr', '40', 'Paquete de cuatro chicles mentolados.', 'https://res.cloudinary.com/riqra/image/upload/w_656,h_656,c_limit,q_auto,f_auto/v1678811144/sellers/4/ojflag1iscpxef0f04ud.jpg'),
(83, 'Chicles Huba bubba', '20', '56.7gr', '15', 'Chicles sabor fresa.', 'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dwda1dc5ca/images/product/0022110079806_A.jpg?sw=1000&sh=1000&sm=fit'),
(84, 'Mini ice', '17', '15gr', '40', 'Dulce carbonatado congelado.', 'https://canels.com.mx/wp-content/uploads/2018/02/ind_MINI-CHERRY-ICEE.png'),
(85, 'Lucas Muecas', '9', '35gr', '25', 'Dulce enchilado.', 'https://static.wixstatic.com/media/6fa1b0_129593b185144537a54ae10ccbd19887~mv2.jpeg/v1/fill/w_1000,h_1132,al_c,q_85/6fa1b0_129593b185144537a54ae10ccbd19887~mv2.jpeg'),
(86, 'Bocadines', '8', '10.5gr', '40', 'Barra de galleta chocolatada.', 'https://surtitienda.vteximg.com.br/arquivos/ids/188876-2000-2000/00025046150137.1.jpg?v=637618265999730000'),
(87, 'Skwuinkles', '14', '19.5gr', '26', 'Gomitas enchiladas.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkQZttLCFXY_FT-KaoFlHCymyisS2Ws7IN_Q&usqp=CAU'),
(88, 'Bolsa polvo miguelito', '5', '4gr', '40', 'Polvo enchilado con azucar.', 'https://m.media-amazon.com/images/I/41NGAfHDOqL._AC_.jpg'),
(89, 'Chocolate milky way', '10', '6gr', '15', 'Barra de chocolate con caramelo dentro.', 'https://resources.claroshop.com/medios-plazavip/fotos/productos_sears1/original/3125678.jpg'),
(90, 'Papas caseras', '25', '35gr', '15', 'Hojas de papas fritas con aderezo.', 'https://www.cardamomo.news/__export/1636655216652/sites/debate/img/2021/11/11/papas_fritas.png_976912859.png'),
(91, 'Pan cuernito', '6', '1 pieza', '10', 'Pan dulce.', 'https://www.gastrolabweb.com/u/fotografias/m/2021/1/26/f1280x720-7688_139363_5050.jpg'),
(92, 'Paleta payaso', '12', '45gr', '10', 'Paletas de bombom cubierta de chocolates con gomitas sabor a frutas.', 'https://www.soriana.com/dw/image/v2/BGBD_PRD/on/demandware.static/-/Sites-soriana-grocery-master-catalog/default/dw5403996a/images/product/7501000278404_A.jpg?sw=1000&sh=1000&sm=fit'),
(93, 'Dulce crayon', '12', '28gr', '20', 'Dulce con sabores frutales.', 'https://sweetdreamsni.com/wp-content/uploads/2023/02/Crayon-dulce.png'),
(94, 'Chocolate winky', '3', '14gr', '10', 'Barra de nougat y caramelo de leche cubierta con chocolate', 'https://cdn.shopify.com/s/files/1/0430/5489/1157/products/a_0001_460-Choc-724869001403-01_900x.jpg?v=1626900008'),
(95, 'Runners', '15', '200gr', '20', 'Frituras enchiladas.', 'https://cdn.shopify.com/s/files/1/0270/4651/0663/products/757528039318_1200x1200.png?v=1605549816'),
(96, 'Totis', '12', '15gr', '25', 'Botana de harina con sal.', 'https://www.totis.com.mx/wp-content/uploads/2021/08/donitas-limon-sal-totis-001.png'),
(97, 'Churrumais', '15', '200gr', '20', 'Fritura típica con limoncito y chilito.', 'https://m.media-amazon.com/images/I/914y4p4D+pL.jpg'),
(98, 'Sabritones', '16', '260gr', '15', 'Frituras con chile y sal.', 'https://s.cornershopapp.com/product-images/337576.jpg?versionId=zSoksEHWXBlofaVGZ7k9HoZ6LH8OcpIo'),
(99, 'Tostitos', '12', '65gr', '30', 'Chips de harina con sal.', 'https://tostitos.com.mx/promocion/img/prod02.webp'),
(100, 'Nachos', '16', '100gr', '20', 'Tortilla de maiz frita con queso amarillo derretido.', 'https://navolarestaurant.com/wp-content/uploads/2017/11/TOTILLA_NACHO-1080x675.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `Tipo_Rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `Tipo_Rol`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `Nombre_Completo` varchar(80) NOT NULL,
  `Correo_Electronico` varchar(60) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Fecha` date NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `id_Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `Nombre_Completo`, `Correo_Electronico`, `Contraseña`, `Fecha`, `Telefono`, `id_Rol`) VALUES
(1, 'José Fernando Alonso Carlos', '21301061550310@cetis155.edu.mx', 'josealonso26', '2006-02-17', '4492232391', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Detalle_Encabezado_idx` (`id_Folio`),
  ADD KEY `fk_Detalle_producto1_idx` (`id_Producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encabezado`
--
ALTER TABLE `encabezado`
  ADD PRIMARY KEY (`Folio`),
  ADD KEY `fk_Encabezado_Empleado1_idx` (`id_Empleado`),
  ADD KEY `fk_encabezado_Usuario1_idx` (`id_Usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Usuario_Rol1_idx` (`id_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `fk_Detalle_Encabezado` FOREIGN KEY (`id_Folio`) REFERENCES `encabezado` (`Folio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalle_producto1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encabezado`
--
ALTER TABLE `encabezado`
  ADD CONSTRAINT `fk_Encabezado_Empleado1` FOREIGN KEY (`id_Empleado`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_encabezado_Usuario1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`id_Rol`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
