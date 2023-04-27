<%-- 
    Document   : subiravatar
    Created on : 29/11/2019, 05:07:00 AM
    Author     : Jeobany
--%>

<%@page import="org.apache.commons.io.*"%>

<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    //String idp = null;
   //idp = request.getParameter("product");
   
   HttpSession ss = request.getSession();
   String name = ss.getAttribute("nm") == null ? "" : ss.getAttribute("nm").toString();
   String id = ss.getAttribute("ident") == null ? "" : ss.getAttribute("ident").toString();
   
    String itname="";
        
        /*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
 
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(i);
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("C:/Users/Miguel PV/Documents/2019/OdysseyMarket_vJ/web/images_us/"+item.getName());
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                itname=item.getName();
                out.print("Nombre --> " + item.getName() );
               
                out.print("<br>varname --> " + itname );
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
                out.print("<br>");
                
            }
            backend.cMaster obj = new backend.cMaster();
       String msj = obj.uploadAvatar(id, "images_us/"+itname);
       
           
            
        }
        
       response.sendRedirect("profile.jsp");
%>
