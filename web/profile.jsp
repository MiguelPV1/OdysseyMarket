
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
    
    backend.cMaster obj = new backend.cMaster();
    
    String ans="";
    
    String goo = request.getParameter("btnReg");
    String goo2 = request.getParameter("btnReg3");
    
    if(goo!=null){
        String aux;
        ArrayList<String> pro = new ArrayList<String>();
        aux=new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        aux=new String(request.getParameter("apellidop").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        aux=new String(request.getParameter("apellidom").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        pro.add(request.getParameter("mail"));
        aux=new String(request.getParameter("delegacion").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        aux=new String(request.getParameter("calle").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
    aux=new String(request.getParameter("colonia").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        pro.add(request.getParameter("numero"));
        pro.add(request.getParameter("cpostal"));
        pro.add(request.getParameter("password"));
       pro.add(request.getParameter("sexo"));
        //String id, String pass, String nombre, String apellido1 , String apellido2,  String mail , String sexo, String dele, String col, String cale, String numero, String CP )

        ans = obj.updateProfile(id,pro.get(9),pro.get(0),pro.get(1),pro.get(2),pro.get(3),pro.get(10),pro.get(4),pro.get(6),pro.get(5),pro.get(7),pro.get(8));
    }
    else if(goo2!=null){
        response.sendRedirect("myCards.jsp");
    }
    
    ArrayList<String> infoPer = obj.ObtenerUsuarioInfo(id);
    String roll = obj.verifySeller(id);
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
    <h1>Edita tu perfil</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
            <img width="50%" src="<%=infoPer.get(0)%>" class="avatar img-circle" alt="foto">
          
          <form action="subiravatar.jsp" enctype="MULTIPART/FORM-DATA" method="post">
          <h6>Upload a different photo...</h6>
          
          <input type="file" class="form-control" id="photo" name="photo" >
          <br>
          <input type="submit" value="Upload"/>
          </form>
        </div>
      </div>
        
      <div class="col-md-9 personal-info">
         <%if(goo!=null || goo2!=null){%>
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a> 
                <i class="fa fa-coffee"></i>
                <%=ans%>
            </div>
         <%}%>
        <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          Recuede que estos cambios se guardaran <strong>ingrese bien sus datos.</strong>
        </div>
        <h3>Informacion personal</h3>
        
        <form class="form-horizontal"  method="POST" action="profile.jsp">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nombre:</label>
            <div class="col-lg-8">
                <input class="form-control" id="nombre" name="nombre" type="text" value="<%=infoPer.get(1)%>"><!--  Poner lo de la consulta -->
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Apellido Paterno:</label>
            <div class="col-lg-8">
              <input class="form-control" id="apellidop" name="apellidop" type="text" value="<%=infoPer.get(2)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Apellido Materno:</label>
            <div class="col-lg-8">
              <input class="form-control" id="apellidom" name="apellidom" type="text" value="<%=infoPer.get(3)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Sexo:</label>
            <div class="col-lg-8">
              <input class="form-control" id="sexo" name="sexo" type="text" value="<%=infoPer.get(4)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" id="mail" name="mail" type="text" value="<%=infoPer.get(5)%>">
            </div>
          </div>          
          <div class="form-group">
            <label class="col-md-3 control-label">Contraseña:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password" value="<%=infoPer.get(6)%>">
            </div>
          </div>
            
            <hr>
            
            <h3>Dirección</h3>
            
            <div class="alert alert-info alert-dismissable">
          <a class="panel-close close" data-dismiss="alert">×</a> 
          <i class="fa fa-coffee"></i>
          A esta dirección se le entregaran sus productos.
        </div>
            
            <div class="form-group">
            <label class="col-lg-3 control-label">Delegacion:</label>
            <div class="col-lg-8">
              <input class="form-control" id="delegacion" name="delegacion" type="text" value="<%=infoPer.get(7)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Colonia:</label>
            <div class="col-lg-8">
              <input class="form-control" id="colonia" name="colonia" type="text" value="<%=infoPer.get(8)%>">
            </div>
          </div>          
          <div class="form-group">
            <label class="col-md-3 control-label">Calle:</label>
            <div class="col-md-8">
              <input class="form-control" id="calle" name="calle" type="text" value="<%=infoPer.get(9)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Numero:</label>
            <div class="col-md-8">
              <input class="form-control" id="numuero" name="numero" type="text" value="<%=infoPer.get(10)%>">
            </div>
          </div>
            <div class="form-group">
            <label class="col-md-3 control-label">Código postal:</label>
            <div class="col-md-8">
              <input class="form-control" id ="cpostal" name="cpostal" type="text" value="<%=infoPer.get(11)%>">
            </div>
          </div>    
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <button id="btnReg" name="btnReg" class="btn btn-primary" value="Save Changes">Save Changes</button>
              <span></span>
              <button type="reset" class="btn btn-default" value="Cancel">Cancel</button>
              <span></span>
              <button id="btnReg3" name="btnReg3" class="btn btn-default" value="Administrar Tarjetas">Administrar Tarjetas</button>
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

