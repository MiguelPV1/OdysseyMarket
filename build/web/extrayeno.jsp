<%-- 
    Document   : extrayeno
    Created on : 15/10/2019, 02:42:16 PM
    Author     : Miguel PV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="backend.cMaster"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            cMaster master = new cMaster();
            
            BD.cDatos bd = new BD.cDatos();
        
        bd.conectar();
        ResultSet obj = bd.consulta("call prueba;");

            %>
        <% while(obj.next()){%>
       <div class="product-card">
            
            <div class="product-details">
                <span class="product-catagory"><%=obj.getString("id_us") %></span>
                <h4><a href=""><%=obj.getString("nombre") %></a></h4>
                <div class="product-bottom-details">
                    <div class="product-price"><small><%=obj.getString("tipo") %></small><%=obj.getString("sexo") %></div>
                    <div class="product-links">
                            <!--<a href=""><i class="fa fa-heart" aria-hidden="true"></i></a>-->
                        <a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
       <%} %>
    </body>
</html>
