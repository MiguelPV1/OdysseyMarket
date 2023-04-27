<%-- 
    Document   : index
    Created on : 29/11/2019, 01:30:09 PM
    Author     : Miguel PV
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
    HttpSession ss = request.getSession();
    String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
    String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
    
    backend.cMaster obj = new backend.cMaster();
    String roll = obj.verifySeller(id);
    
    ArrayList<ArrayList<String>> products = obj.get4Offer();
    
    String cad= null;

    cad = request.getParameter("del");
    
    if(cad != null){
        ArrayList<String> result = obj.addProdCart(id, cad);
        response.sendRedirect("home.jsp");
        
    }
%>
<html>
    <head>
        <title>eCommerce</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        
        <link href="Styles/mdb.min.css" rel="stylesheet">
        <link href="stylesIndex.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="Styles/bootstrap.min.css"/>
        <link rel="stylesheet" href="Styles/bootstrap.css"/>
        
        
        <script src="JS/bootstrap.js"></script>
        <script src="JS/validations.js"></script>
        <script type="text/javascript" src="JS/logval.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        
        <script>
            function openVentana(){
                $(".ventana").slideDown("slow");
            }
            function closeVentana(){
                $(".ventana").slideUp("fast");
            }
        </script>
    </head>
    
    <body >
        
    <div id="skrollr-body" data-top-bottom="margin-right[vibrate]:20px;background-position:!0 bottom;">   
    <div id="content" data-100-start="background-position:0px 0px;" data-4000="background-position:-500px -10000px;">
        
        <div class="container3">
            
            
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <a class="navbar-brand" href="index.jsp"><img class="logoMod" src="images/LogoColor2Texto.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Departamentos
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="products.jsp?Category=Deportes">Deportes</a>
          <div class="dropdown-divider"></div>
          <a id ="Videjuegos" class="dropdown-item" href="products.jsp?Category=Videojuegos">Videojuegos</a>
          <div class="dropdown-divider"></div>
          <a id="Musica" class="dropdown-item" href="products.jsp?Category=Musica">Musica</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="products.jsp?Category=Computo">Computo</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="products.jsp?Category=Ofertas">Ofertas</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="products.jsp">Nuestros Productos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#loginModal">Log In</a>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" action="seProduct.jsp" method="POST">
      <input id="busqueda" name="busqueda" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button id="btnReg" name="btnReg" class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
    </form>
      <a class="nav-link" onclick="alert('Primero Inicia Sesión')" data-toggle="modal" data-target="#loginModal"><img class="logoMod" src="images/carrito.png"></a>
  </div>
</nav>
            
        </div>
        
        <br><br>
        
         <div class="container2 backIm" data-0="transform:translateX(0%)" data-end="transform:translateX(-300%)">
             
             
             
             
             
             
             <section class="sect">
                 
                 
                 <div class="imgBx">
                     <img src="images/Shopping-PNG-HD.png">
                 </div>
                 <div class="storyBx">
                     
                     <h2>Bienvenido a Odyssey Market</h2>
                     <button type="button" class="btn btn-success btn-lg btn-block animated bounce infinite logButton1 " data-toggle="modal" data-target="#loginModal" >Iniciar Sesión</button>
                     <button type="button" class="btn btn-secondary btn-lg btn-block" data-toggle="modal" data-target="#registerModal">Registrarse</button>
                 </div>
             </section>
             <br><br>
             
             
             
             <section class="sect backIm">
                 <div class="imgBx">
                     <h5 class="card-title">Departamentos</h5>
                    <img src="images/dep.png" class="card-img-top" width="200px" alt="Imagen de departamentos">
                  </div>
                <div class="imgBxDep">
                 <div class="card-columns">
                     
                  <div class="card">
                    <img class="card-img-top" src="images/Deportes.jpg" width="200%" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Deportes</h5>
                      <p style="font-size: 80%">Encuentra las mejores cosas de deportes.</p>
                        <a href="products.jsp?Category=Deportes"><button class="button" style="vertical-align:center"><span>Ver mas</span></button></a>
                    </div>
                  </div>
                     
                  <div class="card">
                    <img class="card-img-top" src="images/videojuegos.png" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Videojuegos</h5>
                        <p style="font-size: 80%">Disfruta de los mejores juegos.</p>
                        <a href="products.jsp?Category=Videojuegos"><button class="button" style="vertical-align:center"><span>Ver mas</span></button></a>                        
                    </div>
                  </div>
                     

                  <div class="card p-3 text-right">
                    <blockquote class="blockquote mb-0">
                      <p>Encuentra las mejores ofertas en Odyssey Market</p>
                        <a href="products.jsp?Category=Ofertas"><button class="button" style="vertical-align:center"><span>Ir a ofertas</span></button></a>  
                    </blockquote>
                  </div>
                     
                  <div class="card">
                    <img class="card-img-top" src="images/musica.jpg" width="200%" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Musica</h5>
                      <p style="font-size: 80%">Encuentra pasión.</p>
                        <a href="products.jsp?Category=Musica"><button class="button" style="vertical-align:center"><span>Ver mas</span></button></a>
                    </div>
                  </div>
                     
                  <div class="card">
                    <img class="card-img-top" src="images/computo.jpg" width="100%" alt="Card image cap">
                    <div class="card-body">
                      <h5 class="card-title">Computo</h5>
                      <p style="font-size: 80%">Busca tu mejor laptop para ti..</p>
                        <a href="products.jsp?Category=Computo"><button class="button" href="products.jsp?Category=Computo" style="vertical-align:center"><span>Ver mas</span></button></a>
                    </div>
                  </div>
                  </section>
             <br><br>
             <section class="sect backIm">
                 <div class="imgBx">
                     <img src="images/buy1.jpg">
                 </div>
                 <table>
                        <tr>
                            <%for(int i=0;i<products.size();i++) { 
                String Des;
                float desc;
                
                
                Des = products.get(i).get(4);
                desc = Float.parseFloat(Des);
                
                if(desc != 0){  
               
               
               String price;
               String priceDes="0";
               
               price = products.get(i).get(3);
               
               float precio;
               float res;
               
               precio = Float.parseFloat(price);
               
               res = precio - ((desc/100)*precio);
                           

               priceDes = ""+res;
               %>
                <th>
                       <div class="product-card">

                            <div class="badge">Hot</div>
                            <div class="product-tumb">
                                <img src="<%=products.get(i).get(0)%>" alt="<%=products.get(i).get(0)%>">
                            </div>
                        <div class="product-details">
                                <span class="product-catagory"><%=products.get(i).get(1)%></span>
                                <h4><a href="prod.jsp?product=<%=products.get(i).get(5)%>"><%=products.get(i).get(2)%></a></h4>
                            <div class="product-bottom-details">
                                <div class="product-price"><small>$<%=products.get(i).get(3)%></small>$<%=priceDes%></div>
                                <div class="product-links">
                                <%if((id.equalsIgnoreCase("") || id == null) || roll.compareTo("1")==0){}else{%><a href="home.jsp?del=<%=products.get(i).get(5)%>" onclick="alert('Producto agregado al carrito')"><i class="fa fa-shopping-cart"></i></a><%}%>
                                </div>
                            </div>
                        </div>
                    </div> 
                </th>      
            <%} else{%>
                <th>
                  <div class="product-card">
                    <div class="product-tumb">
                      <img src="<%=products.get(i).get(0)%>" alt="<%=products.get(i).get(0)%>">
                    </div>
                  <div class="product-details">
                    <span class="product-catagory"><%=products.get(i).get(1)%></span>
                    <h4><a href="prod.jsp?product=<%=products.get(i).get(5)%>"><%=products.get(i).get(2)%></a></h4>
                      <div class="product-bottom-details">
                        <div class="product-price"><small></small>$<%=products.get(i).get(3)%></div>
                            <div class="product-links">
                            <%if((id.equalsIgnoreCase("") || id == null) || roll.compareTo("1")==0){}else{%><a href="home.jsp?del=<%=products.get(i).get(5)%>" onclick="alert('Producto agregado al carrito')"<i class="fa fa-shopping-cart"></i></a><%}%>
                            </div>
                        </div>
                       </div>
                     </div>
                </th>
            <%}%>

	<%if(1==i){%>
		</tr>
		<tr>
	<%}%>

        <%}%>

                    </table>
                     
                 
             </section>
         </div>
                    
                    
        <!-- Pop up LogIn -->
        <div class="modal fade" role="dialog" id="loginModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title"> Log In</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <div class="modal-body">
                        <form method="POST" action="validation.jsp" >
                        
                            <input type="hidden" name="oculto" id="oculto"/>
                            <div class="form-group">
                            <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                        </div>
                            <button  class="btn btn-success" onclick="Valida2()">Sing In</button>  
                        </form>    
                    </div>
                    
                    <div class="modal-footer">
                                              
                    </div>
                </div>
            </div>
        </div>
        <!--fin Pop up -->
        
        <!--Inicio Pop up Registrar-->
        <div class="modal fade" role="dialog" id="registerModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title"> Registrar</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <div class="modal-body">
                        <div class="form-group">
                            <form action="register.jsp" method="POST">
                            <input type="text" id="name" name="name" class="form-control" placeholder="Nombre">
                            <input type="text" id="surnameP" name="surnameP" class="form-control" placeholder="Apellido Paterno">
                            <input type="text" id="surnameM" name="surnameM" class="form-control" placeholder="Apellido Materno">
                            <label for="Sexo">Sexo</label>
                            <select class="form-control" id="Sexo">
                                <option name="H" id="H" selected="true">Hombre</option>
                              <option name="M" id="M">Mujer</option>
                            </select>
                            <br>
                            <input type="email" id="mail" name="mail" class="form-control" placeholder="email">
                            <input type="password" id="pass" name="pass" class="form-control" placeholder="password">
                            
                            <br>
                            <input type="text" id="del" name="del" class="form-control" placeholder="Delegacion">
                            <input type="text" id="col" name="col" class="form-control" placeholder="Colonia">
                            <input type="text" id="street" name="street" class="form-control" placeholder="Calle">
                            <input type="text" id="numb" name="numb" class="form-control" placeholder="Numero">
                            <input type="text" id="cepe" name="cepe" class="form-control" placeholder="Codigo Postal">
                            <br>
                            
                            <select class="form-control" id="Type" name="Type">
                              <option name="C" id="C">Comprador</option>
                                <option name="V" id="V">Vendedor</option>
                              
                              
                            </select>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success" onclick="Valida();">Registrarse</button>                        
                    </div>
                          </form>
                        </div>
                        
                    </div>
                    
                    
                </div>
            </div>
        
        </div>
        <!--fin Pop up -->
    </div>    
    </div>                
        
        <script type="text/javascript" src="JS/skrollr.js"></script>
        
        <script type="text/javascript">
	skrollr.init({
		forceHeight: true
,		easing: {
			vibrate: function(p) {
				return Math.sin(p * 10 * Math.PI);
			}
		}
	});
	</script>
        
        
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script type="text/javascript" src="JS/bootstrap.js"></script>
        <script type="text/javascript" src="JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="JS/bootstrap.min.js"></script>
    </body>
</html>

