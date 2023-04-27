/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Jeobany
 */
@WebServlet(urlPatterns = {"/Controlador"})
@MultipartConfig

public class Controlador extends HttpServlet {

 

static final int CHUNK_SIZE=1024*4;

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

 

 

   Part ParteDelArchivo=request.getPart("foto");

   //String fileName=Paths.get(ParteDelArchivo.getSubmittedFileName()).getFileName().toString();
     //   System.out.println(fileName);
   InputStream fileContent=ParteDelArchivo.getInputStream();

   OutputStream os=new BufferedOutputStream(new FileOutputStream(new File("C:\\Users\\Jeobany\\Desktop\\finalW")));

   byte[] chunk=new byte[CHUNK_SIZE];

   int bytesLeidos=0;

 

   while((bytesLeidos=fileContent.read(chunk))>0){

       os.write(chunk,0,bytesLeidos);

   }

   os.close();

    }

 

 

 

}
