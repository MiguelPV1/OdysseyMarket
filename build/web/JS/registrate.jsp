<%-- 
    Document   : index
    Created on : 10/04/2016, 09:33:31 PM
    Author     : Jonathan Velazco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String nombre = "";
    String aPaterno = "";
    String aMaterno = "";
    String calle = "";
    String delegacion = "";
    String numInt = "";
    String numExt = "";  
    String telefono = "";
    String tipo = ""; 
    String email = ""; 
    String password = "";
    String password2= "";
    String notificacion = "";
    
    String nombrePa = "";
    String patPa = "";
    String matPa = "";
    String fechaPa = "";
    
    nombre= request.getParameter("nombre");
    aPaterno= request.getParameter("aPaterno");
    aMaterno=request.getParameter("aMaterno");
    calle=request.getParameter("");
    delegacion=request.getParameter("");
    numInt=request.getParameter("");
    numExt=request.getParameter("");
    tipo=request.getParameter("");
    telefono=request.getParameter("");
    
    



%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
        <title> .:Registrate:. </title>
            <script type="text/javascript" src="JS/validacion.js"></script>
		<script src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
		<script type="text/javascript" src="JS/funcionesBarra.js"></script>
                <link href='https://fonts.googleapis.com/css?family=Comfortaa' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="CSS/estilosPaginaPrincipal.css" type="text/css"/>
		<link rel="stylesheet" href="CSS/estilosBarraNav.css">
                <link rel="stylesheet" href="CSS/Shidos.css" type = "text/css" />
                <link rel="stylesheet" href="CSS/Formulario.css">
    </head>
    <body>
      <header>
		<div class="menu_bar">
                    <a name="Final"></a>
			<a href="#Final" class="bt-menu"><img src= "IMAGENES/menu.png"/>&nbsp;Menú</a>
                        
		</div>

		<nav>
			<ul>
				<li id="Inicio"><a href="ODYSSEY.html"><span class="icon-house"><img src= "IMAGENES/home.png"/></span>Inicio</a></li>
				<li id="Multi"><a href="#"><span class="icon-suitcase"><img src= "IMAGENES/multimedia.png"/></span>Multimedia</a></li>
                                <li id="Especialista"><a href="#"><span class="icon-rocket"><img src="IMAGENES/accessibility.png"/></span>Especialistas</a></li>
				<li id="Diag"><a href="#"><span class="icon-earth"><img src="IMAGENES/file-text.png"/></span>Diagnostico</a></li>
				<li id="Eres"><a href="#"><span class="icon-mail"><img src="IMAGENES/user-tie.png"/></span>¿Eres Especialista?</a></li>
                                
			</ul>
		</nav>
	</header>
        <div id="Formulario" >
            <center><br/><br/>
                <form action="registrate.jsp" method="POST">
                <h1>Registrate</h1><br/>
                Datos Cuidador Primario<hr><br/>
                <input type="text" placeholder="Nombre(s)" id="nombre" name="nombre"/>&nbsp;&nbsp;
                <input type="text" placeholder="Apellido Paterno" id="aPaterno" name="aPaterno"/>&nbsp;&nbsp;
                <input type="text" placeholder="Apellido Materno" id="aMaterno" name="aMaterno"/><br/><br/>
                <h3>Direccion:</h3><br/><input type="text" placeholder="Calle" id="calle" name="calle"/>&nbsp;&nbsp;
                
                
                <select style="height: 28px; font-family:Century Gothic; font-size: 16px; " name="delegacion"> 
                    <option>Seleccion una delegacion -></option>
                    <optgroup label="A">
                        <option value="1">Alvaron Obregon</option>
                        <option value="2">Azcapotzalco</option>
                    </optgroup>
                    
                    <optgroup label ="B">
                       <option value="3">Benito Juarez</option> 
                    </optgroup>
                    
                    <optgroup label="C">
                      <option value="4">Coyoacan</option>  
                      <option value="5">Cuajimalpa</option>
                      <option value="6">Cuauhtemoc</option> 
                    </optgroup>
                    
                    <optgroup label="G">
                        <option value="7">Gustavo A. Madero</option>
                    </optgroup>
                    
                    <optgroup label="I">
                        <option value="8">Iztacalco</option>
                        <option value="9">Iztapalapa</option>
                    </optgroup>
                    
                    <optgroup label="M">
                        <option value="10">Magdalena Contreras</option>
                        <option value="11">Miguel Hidalgo</option>
                        <option value="12">Milpa alta</option>
                    </optgroup>
                    
                    <optgroup label="T">
                        <option value="13">Tlalpan</option>
                        <option value="14">Tlahuac</option>   
                    </optgroup>
                    
                    <optgroup label="V">
                        <option value="15">Venustiano Carranza</option>
                    </optgroup>
                        
                    <optgroup label ="X">
                       <option value="16">Xochimilco</option> 
                    </optgroup>
                </select>
                
             
                <input type="text" placeholder="#Interior" id="interior" name="interior" /><br/><br/>
                <input type="text" placeholder="#Exterior" id="exterior" name="exterior" /><br/><br/>
                
                
                <select style="height: 25px; font-family: Century Gothic; font-size: 15px;" name="tipoTel" id="tipotel">
                    
                    <option value = "0"> Tipo de Telefono --></option>
                    <option value = "1"> Celular </option>
                    <option value = "2"> Casa </option>
                </select>
                
                <input type="text" placeholder="Telefono " id="Tel" name="" style="width:180px;" /><br/><br/>
                
                
                
                <h3>Fecha de Nacimiento:</h3><p id="Notas"></p>
                <br/><input type="date" id="fecha1" name="fecha1"/>&nbsp;&nbsp;
                    
                <h3>Cuenta</h3><br/><input type="email" id="email" name="email" placeholder="Correo Electronico"/><br/><br/>
                <input type="password" placeholder="Contraseña" name="pass1" id="pass1"/><br/><br/><input type="password" placeholder="Repetir Contraseña" name="pass2" id="pass2"/><br><br>
                Datos Paciente<hr><br>
                <input type="text" placeholder="Nombre(s)" id="nomPa" name="nomPa"/>&nbsp;&nbsp;<input type="text" placeholder="Apellido Paterno" id="patPa" name="patPa"/>&nbsp;&nbsp;
                <input type="text" placeholder="Apellido Materno" id="matPa" name="matPa"/><br/><br/>
                <h3>Fecha de Nacimiento:</h3><p id="Notas"><p><br/>
                    <input type="date" name="fechaPa" id="fechaPa"/>&nbsp;&nbsp;<br/><br/><br/>
                    <button id="Envio" name="Envio"  onclick="Valida();" value="Enviar">Enviar</button>
                    <input type="reset" value="Cancelar"/>
                </form>
            </center>
        </div>
         
    </body>
</html>
