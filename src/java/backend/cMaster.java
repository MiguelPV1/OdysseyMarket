/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;
import static java.sql.DriverManager.println;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author Jeobany
 */

public class cMaster {
    private String name;
    private String usr;
    private String patern;
    private String contra;
    private String error;
    
    
// ----------------------------------USUARIO------------------------------------------
    public String agregaUsr(String mailX,
    String nameX,
    String surP,
    String surM,
    String sexX,
    String passX,
    String delX,
    String colX,
    String streetX,
    String numbX,
    String cepeX,
    String tipoX)
    {
        String msj="";
        
        BD.cDatos bd = new BD.cDatos();
        
        try
        {
            bd.conectar();
            ResultSet result = bd.consulta("call sp_Register('"+passX+"','"+nameX+"','"+tipoX+"','"+surP+"','"+surM+"','"+mailX+"'"
                   + ",'"+sexX+"','"+delX+"','"+colX+"','"+streetX+"','"+numbX+"','"+cepeX+"');");
              //ResultSet result = bd.consulta("call sp_Register('contra' , 'JEo' ,'V' , 'Rami', 'Esc' ,'jeo@mail.com' , 'H' , 'Tulti' ,'Reyes','Pino','15' ,'1234','1234567');");                            
            if(result.next())
            {
                msj = result.getString("flag");
            }
            bd.cierraConexion();
        }
        catch(Exception exxxx)
        {
            msj = exxxx.getMessage();
        }
        return msj;
    }    
    
    public String updateProfile(String id, String pass, String nombre, String apellido1 , String apellido2,  String mail , String sexo, String dele, String calle, String colonia, String numero, String CP ){//----------------
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        String info="";
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_Update("+id+",'"+pass+"','"+nombre+"','"+apellido1+"','"+apellido2+"','"+mail+"','"+sexo+"','"+dele+"','"+colonia+"','"+calle+"','"+numero+"',"+CP+");");
                        
            if(result.next()){
                info=result.getString("msj");
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    //logValidation
    
    public ArrayList<String> ObtenerUsuarioInfo(String id){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call obtenerUsuarioInfo("+id+");");
                        
            while(result.next()){
                info.add(result.getString("foto"));
                info.add(result.getString("nombre"));
                info.add(result.getString("apellidop"));
                info.add(result.getString("apellidom"));
                info.add(result.getString("sexo"));
                info.add(result.getString("email"));
                info.add(result.getString("contrasenia"));
                info.add(result.getString("delegacion"));
                info.add(result.getString("colonia"));
                info.add(result.getString("calle"));
                info.add(result.getString("num"));
                info.add(result.getString("codpost"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public String verifySeller(String id){  //Pasar Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        String very="";
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call verificacionVendedor("+id+");");
            if(result.next()){
                very=result.getString("flag");
            }
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return very;
    }
    
// ----------------------------------TARJETA------------------------------------------
    
    public ArrayList<String> createCard(String fecven, String nm, String num, String id){     //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call crearTarjeta('"+fecven+"','"+nm+"','"+num+"',"+id+");");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
                info.add(result.getString("id"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<String> updateCard(String idt, String fecven, String nm, String num, String id){   //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call modificarTarjeta("+idt+",'"+fecven+"','"+nm+"','"+num+"',"+id+");");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<String> deleteCard(String id, String idt){     //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call borrarTarjeta("+id+","+idt+");");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<ArrayList<String>> ObtenerTarjetas(String id){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<ArrayList<String>> tarjetas = new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call obtenerTarjetas("+id+");");
                        
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("no_tarjeta"));
                data.add(result.getString("fecha_ven"));
                data.add(result.getString("nombre"));
                data.add(result.getString("id_tarjeta"));
                
                tarjetas.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return tarjetas;
    }
    
    public ArrayList<String> getCard(String id, String idc){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> product = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call tarjeta_info("+id+","+idc+");");
            
            if(result.next()){
                product.add(result.getString("nombre"));
                product.add(result.getString("fecha"));
                product.add(result.getString("numero"));
                product.add(result.getString("id"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return product;   
    }
    
// ----------------------------------PRODUCTO------------------------------------------
    public ArrayList<String> createProduct(String nm, String id,String marc, String prec, String descu, String cant, String cat, String fot, String descr){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call crearProducto('"+nm+"',"+id+",'"+marc+"',"+prec+","+descu+","+cant+",'"+cat+"','"+fot+"','"+descr+"');");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
                info.add(result.getString("id"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<String> updateProduct(String idp, String nm, String id,String marc, String prec, String descu, String cant, String cat, String fot, String descr){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call modificarProducto('"+idp+"','"+nm+"',"+id+",'"+marc+"',"+prec+","+descu+","+cant+",'"+cat+"','"+fot+"','"+descr+"');");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<String> deleteProduct(String idp, String id){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call borrarProducto('"+idp+"',"+id+");");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<ArrayList<String>> getProducts(String category){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call productos_cat('"+category+"')");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
    public ArrayList<String> getProduct(String idp){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> product = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call producto_info('"+idp+"')");
            
            if(result.next()){
                product.add(result.getString("nombre"));
                product.add(result.getString("proveedor"));
                product.add(result.getString("marca"));
                product.add(result.getString("precio"));
                product.add(result.getString("descuento"));
                product.add(result.getString("cant_almacen"));
                product.add(result.getString("categoria"));
                product.add(result.getString("foto"));
                product.add(result.getString("descripcion"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return product;   
    }
    
    
    public ArrayList<String> getProductEdit(String id, String idp){     //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> product = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call producto_edit("+id+",'"+idp+"')");
            
            if(result.next()){
                product.add(result.getString("nombre"));
                product.add(result.getString("proveedor"));
                product.add(result.getString("marca"));
                product.add(result.getString("precio"));
                product.add(result.getString("descuento"));
                product.add(result.getString("cant_almacen"));
                product.add(result.getString("categoria"));
                product.add(result.getString("foto"));
                product.add(result.getString("descripcion"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return product;   
    }
    
    public ArrayList<ArrayList<String>> get4Offer(){    //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        ArrayList<ArrayList<String>> productsF= new ArrayList<ArrayList<String>>();
        
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call productos_cat('Ofertas')");
                        
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
            
            Random rnd = new Random();
            ArrayList<Integer> r = new ArrayList<>();
            int ver=0;

            while(ver<4){
                int v =  (int)(rnd.nextDouble()*products.size());

                if(r.contains(v)==false){
                    r.add(v);
                    productsF.add(products.get(v));
                    ver++;
                }
            }
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return productsF;
    }
    
    public ArrayList<ArrayList<String>> getMyProducts(String id){ //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call misProductos("+id+");");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
    public ArrayList<ArrayList<String>> searchProducts(String text){    //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            text="%"+text+"%";
            ResultSet result = bd.consulta("call busquedaProducto('"+text+"')");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
    public ArrayList<ArrayList<String>> allProducts(){    //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call todoProductos();");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
// ----------------------------------CALIFICACION------------------------------------------
    public ArrayList<String> createComment(String estre, String comen, String id, String idp){      //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call agregarComentario("+estre+",'"+comen+"',"+id+",'"+idp+"');");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    } 
    
    public ArrayList<ArrayList<String>> getProductComments(String id){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<ArrayList<String>> coments= new ArrayList<ArrayList<String>>();
        
        try{
            
            bd.conectar();
            ResultSet result = bd.consulta("call producto_comen('"+id+"')");
                        
            //imagen, proveedor, nombre, precio, descuento
            
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("nombre"));
                data.add(result.getString("estrellas"));
                data.add(result.getString("fecha"));
                data.add(result.getString("comentario"));
                coments.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return coments;
    }
    

    
// ----------------------------------REPARTIDOR------------------------------------------
    
    
    
// ----------------------------------COMPRAR------------------------------------------
    public ArrayList<String> Buy(String cant, String desc, String dele, String colo, String cal, String num, String cod, String prec, String idu, String idp,String idt){       //Agregar a Jeo
        String msj="", tot="0";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            float Desc=Float.parseFloat(desc);
            float Cant=Float.parseFloat(cant);
            float Precio=Float.parseFloat(prec);
            
            if(Desc!=0){
                float res = Precio - ((Desc/100)*Precio);
                tot=String.valueOf(Cant*res);
            }
            else{
                tot=String.valueOf(Cant*Precio);
            }
            
            bd.conectar();
            ResultSet result = bd.consulta("call comprar("+cant+",'"+dele+"','"+colo+"','"+cal+"','"+num+"',"+cod+","+tot+","+idu+",'"+idp+"',"+idt+");");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<ArrayList<String>> getPurchases(String id){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call compras("+id+");");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("id_compra"));
                data.add(result.getString("fecha_compra"));
                data.add(result.getString("fecha_entrega"));
                data.add(result.getString("nombre"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("total"));
                data.add(result.getString("estatus"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return products;
    }
    
	public ArrayList<ArrayList<String>> getOrders(String idu){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_orders("+idu+")");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
    public ArrayList<String> getOrderStatus(String idu, String idp){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> product = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_orderstatus('"+idu+"','"+idp+"')");
            
            if(result.next()){
                product.add(result.getString("nombre"));
                product.add(result.getString("proveedor"));
                product.add(result.getString("marca"));
                product.add(result.getString("precio"));
                product.add(result.getString("descuento"));
                product.add(result.getString("cantidad"));
                product.add(result.getString("categoria"));
                product.add(result.getString("foto"));
                product.add(result.getString("descripcion"));
                product.add(result.getString("delegacion"));
                product.add(result.getString("colonia"));
                product.add(result.getString("calle"));
                product.add(result.getString("num"));
                product.add(result.getString("codpost"));
                product.add(result.getString("fecha_compra"));
                product.add(result.getString("fecha_entrega"));
                product.add(result.getString("estatus")); //16
                product.add(result.getString("total"));
                product.add(result.getString("repartidor"));
                product.add(result.getString("tel"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return product;    
    } 
      
    public ArrayList<ArrayList<String>> getSales(String idu){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_sales('"+idu+"')");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
    public ArrayList<String> getOrderVen(String idu, String idp){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> product = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_orderven('"+idu+"','"+idp+"')");
            
            if(result.next()){
                product.add(result.getString("nombre"));
                product.add(result.getString("proveedor"));
                product.add(result.getString("marca"));
                product.add(result.getString("precio"));
                product.add(result.getString("descuento"));
                product.add(result.getString("cantidad"));
                product.add(result.getString("categoria"));
                product.add(result.getString("foto"));
                product.add(result.getString("descripcion"));
                product.add(result.getString("delegacion"));
                product.add(result.getString("colonia"));
                product.add(result.getString("calle"));
                product.add(result.getString("num"));
                product.add(result.getString("codpost"));
                product.add(result.getString("fecha_compra"));
                product.add(result.getString("fecha_entrega"));
                product.add(result.getString("estatus")); //16
                product.add(result.getString("total"));
                product.add(result.getString("repartidor"));
                product.add(result.getString("tel"));
                
                
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return product;    
    } 
    
    public String updateStatus(String idu,String idp,String statusX){
        String msj = "";
        BD.cDatos bd = new BD.cDatos();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_updateStatus('"+idu+"','"+idp+"','"+statusX+"')");
            
            if(result.next()){
            msj = result.getString("msj");
            }
        
        bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return msj;
    }
    
	
	
	
    
    
// ----------------------------------CARRITO------------------------------------------
    public ArrayList<String> addProdCart(String id, String idp){        //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call agregarProdCarrito("+id+",'"+idp+"');");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<String> deleteProdCart(String id, String idp){      //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
        ArrayList<String> info = new ArrayList<String>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call borrarProdCarrito("+id+",'"+idp+"');");
                        
            if(result.next()){
                info.add(result.getString("flag"));
                info.add(result.getString("msj"));
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        
        return info;
    }
    
    public ArrayList<ArrayList<String>> getMyCar(String id){ //Agregar a Jeo
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call miCarrito("+id+");");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }

    public ArrayList<ArrayList<String>> getHistory(String idu){
        String msj="";
        BD.cDatos bd = new BD.cDatos();
         ArrayList<ArrayList<String>> products= new ArrayList<ArrayList<String>>();
        
        try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_history('"+idu+"')");
                        
            //imagen, proveedor, nombre, precio, descuento
            while(result.next()){
                ArrayList<String> data = new ArrayList<String>();
                data.add(result.getString("foto"));
                data.add(result.getString("proveedor"));
                data.add(result.getString("nombre"));
                data.add(result.getString("precio"));
                data.add(result.getString("descuento"));
                data.add(result.getString("id_prod"));
                
                products.add(data);
            }
            
            bd.cierraConexion();
        }
        catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return products;
    }
    
 public String uploadImage(String idp, String imagePath){
 String msj="";
        BD.cDatos bd = new BD.cDatos();
 try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_uploadImage('"+idp+"','"+imagePath+"')");
            while(result.next()){
                msj = result.getString("msj");
                
            }
 }catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return msj;
 }   
 
 public String uploadAvatar(String idu, String imagePath){
 String msj="";
        BD.cDatos bd = new BD.cDatos();
 try{
            bd.conectar();
            ResultSet result = bd.consulta("call sp_uploadAvatar('"+idu+"','"+imagePath+"')");
            while(result.next()){
                msj = result.getString("msj");
                
            }
 }catch(Exception exxxx){
            msj = exxxx.getMessage();
        }
        return msj;
 }   
    



public int validaUsr(String mailX,
    String nameX,
    String surP,
    String surM,
    String sexX,
    String passX,
    String delX,
    String colX,
    String streetX,
    String numbX,
    String cepeX,
    String tipoX)
    {
        int fireproof=0;
        
        BD.cDatos bd = new BD.cDatos();
        
        if(nameX.equalsIgnoreCase("") || nameX == null || nameX.contains(""))
        {
            fireproof = 1;
        }        
        
        
        return fireproof;
    }    

}


