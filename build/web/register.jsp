<%-- 
    Document   : register
    Created on : 24/09/2019, 09:50:44 PM
    Author     : Jeobany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mailX;
    String nameX;
    String surP;
    String surM;
    String sexX;
    String passX;
    String delX;
    String colX;
    String streetX;
    String numbX;
    String cepeX;
    
    String tipoX;
           
    String msj="Hola";
    
    boolean Valido=false;
    boolean doIt = false;
    String goo = request.getParameter("btnReg");
    
    try
    {
         mailX = request.getParameter("mail");
         nameX = request.getParameter("name");
         surP = request.getParameter("surnameP");
         surM = request.getParameter("surnameM");
         sexX = request.getParameter("Sexo");
         passX = request.getParameter("pass");
         delX = request.getParameter("del");
         colX = request.getParameter("col");
         streetX = request.getParameter("street");
         numbX = request.getParameter("numb");
         cepeX = request.getParameter("cepe");
         
         tipoX = request.getParameter("Type");
        
         backend.cMaster obj = new backend.cMaster();
        
        msj =obj.agregaUsr(mailX,nameX,surP,surM,sexX,passX,delX,colX,streetX,numbX,cepeX,tipoX);
        
        if(msj.equalsIgnoreCase("0")){
            %>
            <script type="text/javascript">
function alertName(){
alert("Usuario Registrado");
} 
</script> 
<%    
            response.sendRedirect("index.html");
        }
        else if(msj.equalsIgnoreCase("1")){
        %>
        <script>       
        alert("Usuario Invalido");   
        </script>
         <% }
            
        
        
    }catch(Exception exxxx)
    {
        msj= exxxx.getMessage();
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
        <script src="JS/validations.js"></script>
        <script src="JS/logval.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        
        
    </head>
    <body>
        
        <!--Inicio Pop up Registrar-->
        
            
              
                    
                    <div class="container jumbotron text-center">
                        <h3>REGISTRO</h3>
                        <div class="form-group" >
                            <form action="register.jsp" method="POST">
                            <input type="text" name="name" id="name" class="form-control" placeholder="Nombre">
                            <input type="text" name="surnameP" id="surnameP" class="form-control" placeholder="Apellido Paterno">
                            <input type="text" name="surnameM" id="surnameM" class="form-control" placeholder="Apellido Materno">
                            <label for="Sexo">Sexo</label>
                            <select class="form-control" id="Sexo" name="Sexo">
                                <option name="H" id="H" selected="true">Hombre</option>
                              <option name="M" id="M">Mujer</option>
                            </select>
                            <br>
                            <input type="email" name="mail" id="mail" class="form-control" placeholder="email">
                            <input type="password" name="pass" id="pass" class="form-control" placeholder="password">
                            
                            <br>
                            <input type="text" name="del" id="del" class="form-control" placeholder="Delegacion">
                            <input type="text" name="col" id="col" class="form-control" placeholder="Colonia">
                            <input type="text" name="street" id="street" class="form-control" placeholder="Calle">
                            <input type="text" name="numb" id="numb" class="form-control" placeholder="Numero">
                            <input type="text" name="cepe" id="cepe" class="form-control" placeholder="Codigo Postal">
                            <br>
                            
                            <select class="form-control" id="Type" name="Type">
                              <option name="C" id="C">Comprador</option>
                                <option name="V" id="V">Vendedor</option>
                              
                              
                            </select>
                            
                            <button id="btnReg" name="btnReg" class="btn btn-success" onclick="Valida();">Registrarse</button>
                        </form>
                        </div>
                        
                    </div>
                    
                    
              
        
        <script type="text/javascript" src="JS/skrollr.js"></script>
        <script type="text/javascript"> skrollr.init()</script>
        
        
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script type="text/javascript" src="JS/bootstrap.js"></script>
        <script type="text/javascript" src="JS/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="JS/bootstrap.min.js"></script>
        <script type="text/javascript"> window.onload = alertName; </script>
    </body>
</html>
