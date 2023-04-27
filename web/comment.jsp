<%-- 
    Document   : comment
    Created on : 27/11/2019, 05:11:21 PM
    Author     : Miguel PV
--%>

<%-- 
    Document   : extrayeno
    Created on : 15/10/2019, 02:42:16 PM
    Author     : Miguel PV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backend.cMaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%
    String prod;
    prod = request.getParameter("product");
    
    backend.cMaster obj = new backend.cMaster();

    HttpSession ss = request.getSession();
    String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
    String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
        
    String goo = request.getParameter("btnReg");
    ArrayList<String> ans = new ArrayList<>();
    
    if(goo!=null){
        ArrayList<String> inf = new ArrayList<>();
        inf.add(request.getParameter("estrellas"));
        String aux=new String(request.getParameter("comentario").getBytes("ISO-8859-1"),"UTF-8");
        inf.add(aux);
        
       if(id.equalsIgnoreCase("") || id==null){
           response.sendRedirect("prod.jsp?product="+prod);
       }
       else{
           ans=obj.createComment(inf.get(0), inf.get(1), id, prod);
       }
    }
    
    if(id.equalsIgnoreCase("") || id==null) response.sendRedirect("prod.jsp?product="+prod);
    
    ArrayList<String> product=obj.getProduct(prod);
        String roll = obj.verifySeller(id);        
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
        
        <div class="col-md-4 col-sm-12 ml-md-5">
            <br> 
               <br>
            <div class="card">
               <a href="#" data-toggle="modal" data-target="#exampleModal"> <!--Click para expandir(Modal)-->
                    <img src="<%=product.get(7)%>" alt="" class="card-img-top">
                </a>
            </div>           
        </div>
        
        
        <div class="col-md-7">
            <br> <br> <br> <br>
           <%
           if(goo!=null){%>
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert"></a> 
                <i class="fa fa-coffee"></i>
                <%=ans.get(1)%>
            </div>
           <%}%>
           <h3>Producto: <a href="prod.jsp?product=<%=prod%>"><%=product.get(0)%></a></h3>
               <br>
           <h5>¿Qué te ha parecido el producto?</h5>
           
           <form action="comment.jsp?product=<%=prod%>" method="POST">
               <div class="row">
                      <div class="col-1 ml-4"><img src="images/star.jpeg" alt="Estrella" > :
                      </div>
                      
                        <div class="col-2 mr-4">
                          <select id="estrellas" name="estrellas" class="form-control">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                          </select>
                        </div>
                      </div>
                      <br />
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Cuéntanos tus comentarios:</label>
                    <textarea id="comentario" name="comentario" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
                <button id="btnReg" name="btnReg" type="submit" class="btn btn-primary">Enviar</button>
           </form>
           
           
    </div>

   <!-- ****************************************************** -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
