<%-- 
    Document   : pruebas
    Created on : 2/11/2019, 05:59:11 PM
    Author     : Miguel PV
--%>

<%@page import="java.util.ArrayList"%>
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
            cMaster obj = new cMaster();
            
            //ArrayList<String> products=obj.createProduct("Casa de Juguetes", "2", "Hasbro", "569", "10", "2", "Jugues", "/img/casajuguetes.jpg", "Una casa de juguetes");
            //ArrayList<String> products=obj.updateProduct("J001","Casa de Juguetones", "4", "Hasbro", "569", "10", "2", "Jugues", "/img/casajuguetes.jpg", "Una casa de juguetes");
            //ArrayList<String> products=obj.deleteProduct("JJ001", "2");
            
            //ArrayList<String> products=obj.createComment("3","Que feo juego", "3", "V001");
            
            //ArrayList<String> products=obj.createCard("2020/23", "HOLA PUERCA", "569526946698449", "1");
            //ArrayList<String> products=obj.updateCard("13","2021/21", "HOLA ", "11111111111111", "1");
            //ArrayList<String> products=obj.deleteCard("1", "13");
            
            //ArrayList<String> products=obj.addProdCart("1", "V001");
            //ArrayList<String> products=obj.deleteProdCart("1", "V001");
            //call comprar(1,'azca','pepe','alonso','2', 02719,1500,1,'C002',1);
            //ArrayList<String> products=obj.Buy("1","0","azca","pepe","alonso","2", "02719","1500","1","C002","1");
        %>
        
        <p><%=products.get(0)%></p>
        <p><%=products.get(1)%></p>
        <!--<p><%//=products.get(1)%></p>-->
    </body>
</html>
