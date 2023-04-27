<%-- 
    Document   : pruebaimagen
    Created on : 29/11/2019, 02:47:29 AM
    Author     : Jeobany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>EJERCICIO 04 SUBIR ARCHIVO</title>
    </head>
    <body>
        <!--Lo real mente importante es en el formulario decir -->
        <!--que van archivos con el enctype igual a MULTIPART/FORM-DATA -->
        <form action="subir.jsp" enctype="MULTIPART/FORM-DATA" method="post">
            <input type="file" name="file" /><br/>
            <input type="submit" value="Upload" />
        </form>
    </body>
</html>
