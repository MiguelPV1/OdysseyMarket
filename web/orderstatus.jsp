<%-- 
    Document   : orderstatus
    Created on : 25/11/2019, 09:12:33 AM
    Author     : Jeobany
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%
    HttpSession ss = request.getSession();
    String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
    String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
    
    String prod;
    prod = request.getParameter("product");
    backend.cMaster obj = new backend.cMaster();
    String roll = obj.verifySeller(id);
    ArrayList<String> product=obj.getOrderStatus(id, prod);
    ArrayList<ArrayList<String>> prodcom=obj.getProductComments(prod);
    int vStat = 0;
    String sStat="";
   switch(product.get(16)){
       case "1":
            vStat = 20;
            sStat= "En Proceso";
           break;
       case "2":
            vStat = 40;
            sStat= "Enviado";
           break;
        case "3":
            vStat = 60;
            sStat= "En Camino";
           break;
        case "4":
            vStat = 80;
            sStat= "En Entrega";
           break;
        case "5":
            vStat = 100;
            sStat= "Entregado";
           break;
   }
          
%>
<!DOCTYPE html>
<html>
<head>
    <title>Proyecto</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" href="css/bootstrap.css">
     
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        
    <link href="Styles/mdb.min.css" rel="stylesheet">
    <link href="stylesIndex.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="Styles/bootstrap.css"/>
    
    <script src="JS/bootstrap.js"></script>
    
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">-->
  <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>--> <!--estas madres mataban los modals By: Quadri-->
    
  
    
    
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <style>
        .white{
            color:white;
        }
    </style>
    
    
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
        
        
        <!-- ------------------------------------------------------------------------------------>
    
    <div class="row py-md-5">
        
    
        <div class="col-md-4 col-sm-12 ml-md-5"><!--imagen producto -->
            
            <br> 
               <br>
            <div class="card">
               <a href="#" data-toggle="modal" data-target="#exampleModal"> <!--Click para expandir(Modal)-->
                    <img src="<%=product.get(7)%>" alt="" class="card-img-top">
                </a>
            </div> 
            
            
         <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            
                            
                            <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                            </button>
                            
                            <div class="modal-dialog modal-lg modal-dialog-centered mx-auto " role="document">
                                 <div class="text-centered">
                                     <img src="images/audifonos.jpg" alt="" class="img-fluid rounded">
                                 </div>
                            </div>                        
                
                
              
            </div>
        <!-- -->
          
        </div>
        <div class="col-md-3" ">
            <p>Direccion de entrega:</p>
            <p>Calle: <%=product.get(11)%></p>
            <p>Numero: <%=product.get(12)%></p>
            <p>Delegacion: <%=product.get(9)%></p>
            <p>Colonia:  <%=product.get(10)%></p>
            <p>Codigo Postal: <%=product.get(13)%></p>
            <br><br>
            
            <p>fecha de compra: <%=product.get(14)%></p>
            <p>fecha de entrega: <%=product.get(15)%></p>
            <br><br>
            <p>Repartidor: <%=product.get(18)%></p>
            <p>Tel de Contacto: <%=product.get(19)%></p>
        </div>
    
    
    
        
        <div class="col-md-3 " style="" ><!--menu de compra-->
           <!--<div class="container py-sm-3">-->
           <div>
               <br> 
               <br>
           <h3><%=product.get(0)%> </h3>
           <h4><%=product.get(2)%></h4>
           
           
           
           <%
                String Des;
                float desc;
               
                Des = product.get(4);
                desc = Float.parseFloat(Des);
                
                if(desc != 0){  
              
               String price;
               String priceDes="0";
               
               price = product.get(3);
               
               float precio;
               float res;
               
               precio = Float.parseFloat(price);
               
               res = precio - ((desc/100)*precio);
                           

               priceDes = ""+res;
               %>
               
           <p>Precio: <del>$<%=product.get(3)%></del> $<%=priceDes%> </p>
           <%} else{ %>
           <p>Precio: $<%=product.get(3)%></p>
           
           <%}%>
        <!--   <p>Precio: <del>$700</del> $650</p> -->
           
           <a href=""><p>Vendido por: <%=product.get(1)%></</p></a>
           <a href="#" data-toggle="modal" data-target="#comentariosModal"> <!--Click para expandir(Modal)-->
                    <h5>Comentarios del producto</h5>
                </a>
           <hr>
           
           <div class="modal fade" id="comentariosModal" tabindex="-1" role="dialog" aria-labelledby="comentariosLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">

                    <div class="modal-content">
                        <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                    </button>

                                    <div class="modal-dialog modal-lg" role="document">
                                         <div class="row">
                                             <div class="col-12">
                                                 <h1 class="display-4 ml-3 py-2">Comentarios</h1>
                                             </div>
                                             <div class="col-12">
                                                 <%for(int c=0;c<prodcom.size();c++){%>
                                                 <p class="ml-3"><b>Nombre de usuario: <%=prodcom.get(c).get(0)%>&nbsp;Estrellas: <%=prodcom.get(c).get(1)%> de 5</b><br>&nbsp;Fecha: <%=prodcom.get(c).get(2)%></p>
                                                 <div class="row ml-5"><p>&nbsp;Comentario: <%=prodcom.get(c).get(3)%></p></div>
                                                 <hr>
                                                 <%}%>
                                                 

                                             </div>
                                         </div>

                                    </div>
                    </div>
                </div>
                            
                                                    
                
                
              
            </div>
           
           <p><%=product.get(8)%></p>
           <p>Cantidad: <%=product.get(5)%></p>
           <p>Total: $<%=product.get(17)%></p>
           <br>
           
           <div class="progress">
               <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="<%=vStat%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=vStat%>%"></div>
            </div>
           <p>Estatus de la compra: <%=sStat%></p>
           </div> 
           </div>
        </div>
        
        

   <!-- ****************************************************** -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>