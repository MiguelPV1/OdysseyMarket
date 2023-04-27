<%-- 
    Document   : validation
    Created on : 15/10/2019, 09:19:11 PM
    Author     : Jeobany
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@page import="java.sql.ResultSet"%>
<%
    String usur = request.getParameter("username");
    String pswd = request.getParameter("password");
    String valida = request.getParameter("oculto");
    String key ="";
    String msj="";
    String DNI="";
    String name="";
    
    BD.cDatos bd = new BD.cDatos();
    
    String btn = request.getParameter("done");
    
    try
    {
        bd.conectar();
        ResultSet result = bd.consulta("call logValidation('"+pswd+"','"+usur+"')");
        
        HttpSession ss = request.getSession();
        
        if(result.next())
        {

            key = result.getString("proof");
            
            
            
            if(key.equals("1"))
            {
                DNI = result.getString("identifier");
                name = result.getString("named");
                response.sendRedirect("home.jsp");
                
                ss.setAttribute("valido", "ok");
                ss.setAttribute("ident", DNI);
                ss.setAttribute("nm",name);
                
            }
            else
            {
                ss.invalidate();
            }
        }
        
        
    }
    catch(Exception exxxx)
    {
        msj= exxxx.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="JS/logval.js"></script>
    </head>
    <body>
        <div class="modal fade" role="dialog" id="loginModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title"> Log In</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <div class="modal-body">
                        <form action="validation.jsp" method="POST">
                         <input type="hidden" name="oculto" id="oculto"/>
                            <div class="form-group">
                            <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                        </div>
                            <button type="submit" id="done" name="done" class="btn btn-success" onclick="Valida2();">Sing In</button>  
                        </form>    
                    </div>
                    
                    <div class="modal-footer">
                                              
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
