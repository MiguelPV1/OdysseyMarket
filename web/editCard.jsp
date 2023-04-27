<%-- 
    Document   : editCard
    Created on : 26/11/2019, 01:02:26 AM
    Author     : Miguel PV
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<%
   String idc = null;
   idc = request.getParameter("card");
   
   HttpSession ss = request.getSession();
   String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
   String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
      
   String siguiente;
   
   backend.cMaster obj = new backend.cMaster();
   
   String roll = obj.verifySeller(id);
   
   ArrayList<String> card = new ArrayList<String>();
   ArrayList<String> ans = new ArrayList<String>();
   
    String goo = request.getParameter("btnReg");
    String goo2 = request.getParameter("btnReg2");
    
    if(goo!=null || goo2!=null){
        String aux;
        ArrayList<String> car = new ArrayList<String>();
        aux=new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        car.add(aux);
        car.add(request.getParameter("fecha"));
        car.add(request.getParameter("numero"));
        
        backend.cMaster obj2 = new backend.cMaster();
         
        if(goo!=null){
           ans = obj2.updateCard(idc, car.get(1), car.get(0), car.get(2), id);
        }
        else if(goo2!=null){
           ans = obj2.createCard(car.get(1), car.get(0), car.get(2), id);
           if(ans.get(0).compareTo("1")==0) idc=ans.get(2);
        }
    }
    
    if(idc != null){
       card=obj.getCard(id,idc);
       if(card.isEmpty()){
           for(int i=0;i<9;i++) card.add("");
           siguiente = "editCard.jsp";
       }
       else siguiente = "editCard.jsp?card="+idc;
   }
   else{
       for(int i=0;i<9;i++) card.add("");
       siguiente = "editCard.jsp";
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
    <h1> Edita tu Tarjeta</h1>
  	<hr>
	<div class="row">
            <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
            <img width="50%" src="images/card.png" class="avatar img-circle" alt="Card">
        </div>
      </div>
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
          <%
           if(goo!=null || goo2!=null){%>
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a> 
                <i class="fa fa-coffee"></i>
                <%=ans.get(1)%>
            </div>
           <%}%>
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          Recuede que estos cambios se guardaran <strong>ingrese bien los datos.</strong>
        </div>
        <h3>Informacion de la Tarjeta</h3>
        
        <form class="form-horizontal" action="<%=siguiente%>" method="POST">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nombre:</label>
            <div class="col-lg-8">
              <input id="nombre" name="nombre" class="form-control" type="text" value="<%=card.get(0)%>">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-lg-3 control-label">Fecha de Vencimiento: mm/aa</label>
            <div class="col-lg-8">
              <input id="fecha" class="form-control" name="fecha" type="text" value="<%=card.get(1)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Numero de Tarjeta:</label>
            <div class="col-lg-8">
              <input id="numero" class="form-control" name="numero" type="text" value="<%=card.get(2)%>">
            </div>
          </div>
          
            
            <hr>
            
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
                <%if(idc != null){%><button id="btnReg" name="btnReg" class="btn btn-primary" value="Save Changes">Save Changes</button><%}%>
                <%if(idc == null){%><button id="btnReg2" name="btnReg2" class="btn btn-primary" value="Save">Save</button><%}%>
              <span></span>
              <button type="reset" class="btn btn-default" value="Cancel">Cancel</button>
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
