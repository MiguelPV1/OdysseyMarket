
<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
<%@page import="org.apache.commons.io.*"%>

<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->


<%
   String idp = null;
   idp = request.getParameter("product");
   
   HttpSession ss = request.getSession();
   String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
   String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
   ss.setAttribute("prod", idp);
   String siguiente;
   
   backend.cMaster obj = new backend.cMaster();
   
   String roll = obj.verifySeller(id);
   
   ArrayList<String> product = new ArrayList<String>();
   ArrayList<String> ans = new ArrayList<String>();
   
    String goo = request.getParameter("btnReg");
    String goo2 = request.getParameter("btnReg2");
    
    if(goo!=null || goo2!=null){
        String aux;
        ArrayList<String> pro = new ArrayList<String>();
        aux=new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        aux=new String(request.getParameter("marca").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        pro.add(request.getParameter("precio"));
        pro.add(request.getParameter("descuento"));
        pro.add(request.getParameter("cantidad"));
        aux=new String(request.getParameter("categoria").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        pro.add("foto");
        aux=new String(request.getParameter("descripcion").getBytes("ISO-8859-1"),"UTF-8");
        pro.add(aux);
        
        backend.cMaster obj2 = new backend.cMaster();
         
        if(goo!=null){
           ans = obj2.updateProduct(idp, pro.get(0), id, pro.get(1), pro.get(2), pro.get(3), pro.get(4), pro.get(5), pro.get(6), pro.get(7));
        }
        else if(goo2!=null){
           ans = obj2.createProduct(pro.get(0), id, pro.get(1), pro.get(2), pro.get(3), pro.get(4), pro.get(5), pro.get(6), pro.get(7));
           if(ans.get(0).compareTo("1")==0) idp=ans.get(2);
        }
    }
    
    if(idp != null){
       product=obj.getProductEdit(id, idp);
       if(product.isEmpty()){
           for(int i=0;i<9;i++) product.add("");
           siguiente = "editProduct.jsp";
       }
       else siguiente = "editProduct.jsp?product="+idp;
   }
   else{
       for(int i=0;i<9;i++) product.add("");
       siguiente = "editProduct.jsp";
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
    <h1> Edita tu Producto</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <%if(idp!=null){%>
        <div class="text-center">
            <img width="50%" src="<%=product.get(7)%>" class="avatar img-circle" alt="foto">
          
                 <form action="subir.jsp?product=<%=idp%>" enctype="MULTIPART/FORM-DATA" method="post">
                 <%if(idp != null){%><h6>Upload a New Photo...</h6><%}%>
                 <%if(idp == null){%><h6>Upload a Photo...</h6><%}%>
                 <input type="file" class="form-control" id="photo" name="photo">
                 <input type="hidden" id="product" name="product" value="<%=idp%>"/>
                 <br>
                 <input type="submit" value="Upload"/>
                </form>
          
        </div>
          <%}%>
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
        <h3>Informacion del Producto</h3>
        
        <form class="form-horizontal" action="<%=siguiente%>" method="POST">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nombre:</label>
            <div class="col-lg-8">
              <input id="nombre" name="nombre" class="form-control" type="text" value="<%=product.get(0)%>">
            </div>
          </div>
          <div class="form-group">
            <label  class="col-lg-3 control-label">Marca:</label>
            <div class="col-lg-8">
              <input id="marca" class="form-control" name="marca" type="text" value="<%=product.get(2)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Precio:</label>
            <div class="col-lg-8">
              <input id="precio" class="form-control" name="precio" type="text" value="<%=product.get(3)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Descuento:</label>
            <div class="col-md-8">
              <input id="descuento" class="form-control" name="descuento" type="text" value="<%=product.get(4)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Cantidad:</label>
            <div class="col-md-8">
              <input id="cantidad" class="form-control" name="cantidad" type="text" value="<%=product.get(5)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Categoria:</label>
            <div class="col-md-8">
              <input id="categoria" class="form-control" name="categoria" type="text" value="<%=product.get(6)%>">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
                <input id="descripcion" class="form-control" name="descripcion" type="text" rows="3" value="<%=product.get(8)%>">
            </div>
          </div>
            
            <hr>
            
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
                <%if(idp != null){%><button id="btnReg" name="btnReg" class="btn btn-primary" value="Save Changes">Save Changes</button><%}%>
                <%if(idp == null){%><button id="btnReg2" name="btnReg2" class="btn btn-primary" value="Save">Save</button><%}%>
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