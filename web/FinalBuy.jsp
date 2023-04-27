<%-- 
    Document   : FinalBuy
    Created on : 23/11/2019, 11:47:58 PM
    Author     : Miguel PV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
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
    
    String prod;
    prod = request.getParameter("product");
    
    backend.cMaster obj = new backend.cMaster();
    ArrayList<String> product=obj.getProduct(prod);
    String roll = obj.verifySeller(id);
    int disp = 0;
    
    String cant;
    String tarj;
    
    
    String priceDes="0";
    
    
    ArrayList<String> infoPer = obj.ObtenerUsuarioInfo(id); 
    ArrayList<ArrayList<String>> cards = obj.ObtenerTarjetas(id);
    
    
    String goo = request.getParameter("btnReg");

    if(goo!=null){
        tarj= request.getParameter("tarj");
        cant = request.getParameter("cant");
    
        ArrayList<String> insert = obj.Buy(cant, product.get(4), infoPer.get(7),infoPer.get(8),infoPer.get(9),infoPer.get(10),infoPer.get(11),product.get(3),id,prod,tarj);
        disp = 1;
        response.sendRedirect("Carrito.jsp");
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
        
        
        
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    
    <body >
        
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
        
        
        <div>
        <br><br><br><br>
        </div>
    
        
        
       
        
        <div>
    <h1>Finalizar Pedido</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
            <img src="<%=product.get(7)%>" width="50%">
            <br><br><br>
          <h6>Tu producto</h6>
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          Al dar aceptar finalizará su pedido
        </div>
        <h3>Información del producto</h3>
        <form class="form-horizontal" role="form" action="FinalBuy.jsp?product=<%=prod%>" method="POST">
            <label class="col-lg-4 control-label">Nombre : <%=product.get(0)%></label>
            <label class="col-lg-4 control-label">Marca : <%=product.get(2)%></label>
            <br>
            <%
                String Des;
                float desc1;
               
                Des = product.get(4);
                desc1 = Float.parseFloat(Des);
                
                if(desc1 != 0){  
              
               String price;
               priceDes="0";
               
               price = product.get(3);
               
               float precio;
               float res;
               
               precio = Float.parseFloat(price);
               
               res = precio - ((desc1/100)*precio);
                           

               priceDes = ""+res;
               %>
           <label class="col-lg-8 control-label">Precio: de $<%=product.get(3)%> a $<%=priceDes%></label>
           <%} else{ 
            priceDes = product.get(3);
            %>
           <label class="col-lg-8 control-label">Precio: de $<%=product.get(3)%></label>
           <%}%>
           <label id ="demo" class="col-lg-8 control-label">Precio final: $<%=priceDes%> con envio gratis</label>
           
            
          <label class="col-lg-2 control-label">Cantidad: </label><select id="cant" name="cant" onchange="myFunction()">
              <%
                      int cantidad = Integer.parseInt(product.get(5));
                      
                      for(int i=1;i<cantidad+1;i++){%>
              <option value="<%=i%>"><%=i%></option>
              <%}%>
            </select> 

            <script>
            function myFunction() {
              var x = document.getElementById("cant").value;
                      var p = <%=priceDes%>;
                      var y = x*p;
              document.getElementById("demo").innerHTML = "Precio Final: $" + y+".00";
            }
            </script>
           
           
            <hr>
            <h3>Métodos de pago </h3>
                        
            <div class="form-group">
            <label class="col-md-3 control-label">Seleccione la tarjeta: </label>
            <div class="col-md-8">
                  <select class="form-control" id="tarj" name="tarj">
                      <%for(int i=0;i<cards.size();i++){%>
                    <option value=<%=cards.get(i).get(3)%> ><%=cards.get(i).get(0)%></option>
                    <% }%>
                </select>
            </div>
          </div>    
            <hr>
            <h3>Direccion donde será entregado su pedido</h3>
                        
            <div class="form-group">
            <div class="col-md-8">
                <label class="col-lg-5 control-label">Delegacion: <%=infoPer.get(7)%> </label>
                <label class="col-lg-5 control-label">Colonia: <%=infoPer.get(8)%> </label>
                <label class="col-lg-5 control-label">Calle: <%=infoPer.get(9)%> </label>
                <label class="col-lg-5 control-label">No. : <%=infoPer.get(10)%></label>
                <label class="col-lg-5 control-label">Codigo Postal: <%=infoPer.get(11)%> </label>
            </div>
            </div>
            
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
            <!--  <input name="Fcomp" type="button" class="btn btn-primary" onclick="action('Gracias por su compra')" value="Comprar"> -->
              <button id="btnReg" name="btnReg" class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick="alert('Compra finalizada')">Comprar</button>
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
        
        
        <script type="text/javascript" src="JS/bootstrap.js"></script>
        <script type="text/javascript" src="JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="JS/bootstrap.min.js"></script>
    </body>
</html>

