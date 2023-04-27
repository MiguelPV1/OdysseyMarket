<%-- 
    Document   : myProducts
    Created on : 5/11/2019, 09:23:58 PM
    Author     : Miguel PV
--%>

<%@page import="java.lang.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String cad = null;
    cad = request.getParameter("product");
    
    HttpSession ss = request.getSession();
    String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
    String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
        
    backend.cMaster obj = new backend.cMaster();
    
    String roll = obj.verifySeller(id);
    
    if(cad != null){
        ArrayList<String> result = obj.deleteProduct(cad, id);
        response.sendRedirect("myProducts.jsp");
    }
    
    ArrayList<ArrayList<String>> products = obj.getMyProducts(id);
    
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
        
        <script>
            function openVentana(){
                $(".ventana").slideDown("slow");
            }
            function closeVentana(){
                $(".ventana").slideUp("fast");
            }
        </script>
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
        
            
        <section class="sect backIm">
            
            <table>  
        <tr>
        
        
        <%
            int noProd = products.size();
            double salto=0;
            if(noProd>1){
		if(noProd%2==0)	salto=noProd/2-1;
		else{
		    salto= noProd/2;
		}
            }
            
                
                %>
            <%
                for(int i=0;i<products.size();i++) { 
                    
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
                                    <a href="myProducts.jsp?product=<%=products.get(i).get(5)%>"><i class="fa fa-trash-alt" aria-hidden="true"></i></a>
                                    <a href="editProduct.jsp?product=<%=products.get(i).get(5)%>"><i class="fa fa-pencil-alt" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                    </div> 
                </th>   
            <%} else{%>
                <th>
                  <div class="product-card">
                    <div class="product-tumb">
                      <img src=<%=products.get(i).get(0)%> alt=<%=products.get(i).get(0)%>>
                    </div>
                  <div class="product-details">
                    <span class="product-catagory"><%=products.get(i).get(1)%></span>
                    <h4><a href="prod.jsp?product=<%=products.get(i).get(5)%>"><%=products.get(i).get(2)%></a></h4>
                      <div class="product-bottom-details">
                        <div class="product-price"><small></small>$<%=products.get(i).get(3)%></div>
                            <div class="product-links">
                             <a href="myProducts.jsp?product=<%=products.get(i).get(5)%>"><i class="fa fa-trash-alt" aria-hidden="true"></i></a>
                             <a href="editProduct.jsp?product=<%=products.get(i).get(5)%>"><i class="fa fa-pencil-alt" aria-hidden="true"></i></a>
                            </div>
                        </div>
                       </div>
                     </div>
                </th>
            <%} %>
            <%if(salto==i){%>
		</tr>
		<tr>
	<%}%>
        <%}%>
        
        <th>
            <div class="product-card">
                <div class="badge">New</div>
                <div class="product-tumb">
                    <img src="images/new.jpg" alt="Unknown">
                </div>
                <div class="product-details">
                    <span class="product-catagory"></span>
                    <h4><a>New Product</a></h4>
                    <div class="product-bottom-details">
                        <div class="product-price"><small></small>$ ???</div>
                        <div class="product-links">
                            <a href="editProduct.jsp"><i class="fa fa-pencil-alt" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div> 
        </th> 
       </tr>
       <tr>
       </tr>
            </table>
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

