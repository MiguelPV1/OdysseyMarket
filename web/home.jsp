<%-- 
    Document   : home
    Created on : 24/09/2019, 08:29:14 PM
    Author     : Jeobany
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
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
<!DOCTYPE html>

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
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        
        
    </head>
    
    <body>
        
        
        
        <div class="container3">
            
            
<nav class="navbar navbar-expand-lg navbar-light bg-light">
              <a class="navbar-brand" href=
                 <%if(id.equalsIgnoreCase("") || id==null)
                 {%>"index.jsp"<%
                 }else{%>
                 "home.jsp"<%}%>><img class="logoMod" src="images/LogoColor2Texto.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href=
                 <%if(id.equalsIgnoreCase("") || id==null)
                 {%>"index.jsp"<%}else{%>
                 "home.jsp"<%}%>>Home <span class="sr-only">(current)</span></a>
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
      
      <%if(id.equalsIgnoreCase("") || id == null){
      %>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#loginModal">Log In</a>
      </li>
      <%}
      else{%>
      <li class="nav-item">
        <a class="nav-link" href="profile.jsp">Perfil</a>
      </li>
      <%if(roll.compareTo("0")==0){%>
      <li class="nav-item">
        <a class="nav-link" href="compra_usr.jsp">Pedidos</a>
      </li>
      <%}%>
      <%if(roll.compareTo("1")==0){%>
      <li class="nav-item">
        <a class="nav-link" href="myProducts.jsp">Mis Productos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="compra_ven.jsp">Envios</a>
      </li>
      <%}%>
      <li>
        <a class="nav-link" id="logout" name="logout" href="out.jsp">Cerrar Session</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Hola <%=name%></a>
      </li>

        <%}%>
    </ul>
     <!-- Busqueda-->
    <form class="form-inline my-2 my-lg-0" action="seProduct.jsp" method="POST">
      <input id="busqueda" name="busqueda" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button id="btnReg" name="btnReg" class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
    </form>
     
      <%if(roll.compareTo("0")==0){%><a class="navbar-brand" href="Carrito.jsp"><img class="logoMod" src="images/carrito.png"></a><%}%>
  </div>
</nav>
            
        </div>
        
        <br><br>
        
         <div class="container2 backIm" data-0="transform:translateX(0%)" data-4000 ="transform:translateX(-300%)">
             
             
             
             
             
             
             <section class="sect">
                 
                 
                 <div class="imgBx">
                     <img src="images/Shopping-PNG-HD.png">
                 </div>
                 <div class="storyBx">
                     
                     <h2>Bienvenido a Odyssey Market</h2>
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
                        <a href="products.jsp?Category=Computo"><button class="button" style="vertical-align:center"><span>Ver mas</span></button></a>
                    </div>
                  </div>
                  </section>
             <br><br>
             <section class="sect backIm">
                 <div class="imgBx">
                     <img src="images/buy1.jpg">
                 </div>
                 <!--<div class="storyBx">-->
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
                     
                 <!--</div>-->
             </section>
         </div>
                    
        <script type="text/javascript" src="JS/skrollr.js"></script>
        <script type="text/javascript"> skrollr.init()</script>
        
        
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script type="text/javascript" src="JS/bootstrap.js"></script>
        <script type="text/javascript" src="JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="JS/bootstrap.min.js"></script>
    </body>
</html>
