/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var accepted;
var Nombre;
    var ApellidoPa;
    var ApellidoMa;
    var Calle;
    var delegacion;
    var interior;
    var exterior;
    var tipotel;
    var tel;
    var fecha1;
    var email;
    var pass1;
    var pass2;
    var nomPa;
    var patPa;
    var matPa;
    var fechaPa;
    var letra;
    var arrob;
    var punt;
    
function Validar()
{
    Nombre=document.getElementById("nombre");
    ApellidoPa=document.getElementById("aPaterno");
    ApellidoMa=document.getElementById("aMaterno");
    Calle=document.getElementById("calle");
    delegacion=document.getElementById("delegacion");
    interior=document.getElementById("interior");
    exterior=document.getElementById("exterior");
    tipotel=document.getElementById("tipoTel");
    tel=document.getElementById("Tel");
    fecha1=document.getElementById("fecha1");
    email=document.getElementById("email");
    pass1=document.getElementById("pass1");
    pass2=document.getElementById("pass2");
    nomPa=document.getElementById("nomPa");
    patPa=document.getElementById("patPa");
    matPa=document.getElementById("matPa");
    fechaPa=document.getElementById("fechaPa");
    accepted=true;
     arrob=0;
     punt=0;
    if(Nombre.value=="")
    {
        alert("No puedes dejar el campo Nombre vacio");
        Nombre.focus();
        accepted=false;
       
    }
    else
    {
        for (var i=0;i<(Nombre.value).length;i++)
        {
            letra=(Nombre.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
               
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Nombre");
                Nombre.value="";
                Nombre.focus();
                break;
            }
        }
    }
    if(ApellidoPa.value=="")
    {
        alert("No puedes dejar el campo Apellido Paterno vacio");
        ApellidoPa.focus();
        accepted=false;
    }
    else
    {
        for (var i=0;i<(ApellidoPa.value).length;i++)
        {
            letra=(ApellidoPa.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Apellido Paterno");
                ApellidoPa.value="";
                ApellidoPa.focus();
                break;
            }
        }
    }
    if(ApellidoMa.value=="")
    {
        alert("No puedes dejar el campo Apellido Materno vacio");
        ApellidoMa.focus();
        accepted=false;
    }
    else
    {
        for (var i=0;i<(ApellidoMa.value).length;i++)
        {
            letra=(ApellidoMa.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Apellido Materno");
                ApellidoMa.value="";
                ApellidoMa.focus();
                break;
            }
        }
    }
    if(Calle.value!="")
    {
        for (var i=0;i<(Calle.value).length;i++)
        {
            letra=(Calle.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Calle");
                Calle.value="";
                Calle.focus();
                break;
            }
        }
    }
    if(delegacion.value!="" && Calle.value=="")
    {
        alert("Es necesario que llenes el campo Calle");
        Calle.focus();
        accepted=false;
    }
    else
    {
        if(delegacion.value=="" && Calle.value!="")
        {
            accepted=false;
            alert("Debes completar el campo Delegacion");
            delegacion.focus();
            
        }
        else
        {
            if(isNaN(delegacion.value) && delegacion.value!="")
            {
                alert("Porfavor no modifiques ningun campo dentro de la consola");
                accepted=false;
            }
            else
            {
                if(delegacion.value!="")
                {
                    
                }
            }
        }
            
    }
    if(interior.value!="" && Calle.value=="")
    {
        alert("Es necesario que llenes el campo Calle");
        Calle.focus();
        accepted=false;
    }
    else
    {
        
        if(interior.value=="" && Calle.value!="")
        {
            accepted=false;
            alert("Debes completar el campo Numero Interior o en caso de No tener numero interior colocar una 'N' en el campo");
            interior.focus();
        }
        else
        {
            
                if(interior.value!="" && Calle.value!="")
                {
                    if(interior.value=="N" || interior.value=="" || interior.value=="n")
                    {
                        
                        
                    }
                    else
                    {
                        for (var i=0;i<(interior.value).length;i++)
                        {
                            letra=(interior.value).charAt(i);
                            if(isNaN(letra) || letra=="")
                            {
                                accepted=false;
                             alert("Debes ingresar numeros en el Campo numero Interior o en caso de no tener numero interior colocar una 'N' en el campo");
                             interior.value="";
                             interior.focus();
                             break;
                            }
                            else
                            {
                                
                            }

                        }
                    }
            
                }
               
            
        }
            
    }
    if(exterior.value!="" && Calle.value=="")
    {
        alert("Es necesario que llenes el campo Calle");
        Calle.focus();
        accepted=false;
    }
    else
    {
        
        if(exterior.value=="" && Calle.value!="")
        {
            accepted=false;
            alert("Debes completar el campo Numero Exterior o en caso de No tener numero interior colocar una 'N' en el campo");
            exterior.focus();
        }
        else
        {
            
                if(exterior.value!="" && Calle.value!="")
                {
                    if(exterior.value=="N" || exterior.value=="" || exterior.value=="n")
                    {
                        
                        
                    }
                    else
                    {
                     for (var i=0;i<(exterior.value).length;i++)
                        {
                            letra=(exterior.value).charAt(i);
                            if(isNaN(letra) || letra=="")
                            {
                                accepted=false;
                             alert("Debes ingresar numeros en el Campo numero Exterior o en caso de no tener numero interior colocar una 'N' en el campo");
                             exterior.value="";
                             exterior.focus();
                             break;
                            }
                            else
                            {
                                
                            }

                        }
                     }
            
                }
               
            
        }
        if(interior.value=="N" || interior.value=="n" && exterior.value=="N" )
        {
            alert("Debes al menos proporcionar un numero de Casa");
            accepted=false;
            interior.value="";
            exterior.value="";
            interior.focus();
        }
        if(tipotel.value=="" && tel.value=="")
        {
            accepted=false;
            alert("Debes llenar los campos Tipo de Telefono y Telefono");
            tel.focus();
        }
        if(tipotel.value=="" && tel.value!="")
        {
            alert("Debes seleccionar primero el tipo de telefono");
            tel.value="";
            tipotel.focus();
            accepted=false;
        }
        else
        {
            
            if(isNaN(tipotel.value))
            {
                alert("Porfavor no modifiques ningun campo dentro de la consola");
                accepted=false;
            }
        }
        if(tel.value=="" && tipotel.value!="")
        {
            accepted=false;
            alert("No puedes dejar vacio el espacio Numero de telefono");
            tel.focus();
        }
        if(tel.value!="" && tipotel.value!="")
        {
            if(tipotel.value==1)
            {
            if((tel.value).length==10)
            {
                
                 for (var i=0;i<(tel.value).length;i++)
                {
                    letra=(tel.value).charAt(i);
                    if(isNaN(letra))
                    {
                     accepted=false;   
                     alert("No puedes ingresar letras en el campo Numero de Telefono");
                     tel.value="";
                     tel.focus();
                     break;
                    }
                    else
                     {
                        
                        
                    }
                }
            }
            else
            {
                alert("La longitud de un numero de celular debe ser 10 digitos");
                tel.value="";
                tel.focus();
                accepted=false;
            }
            }
            else
            {
                if(tipotel.value==2)
                {
                   if((tel.value).length==8)
                    {
                         
                 for (var i=0;i<(tel.value).length;i++)
                {
                    letra=(tel.value).charAt(i);
                    if(isNaN(letra))
                    {
                     accepted=false;   
                     alert("No puedes ingresar letras en el campo Numero de Telefono");
                     tel.value="";
                     tel.focus();
                     break;
                    }
                    else
                     {
                        
                        
                    }
                }
                     }
                 else
                     {
                alert("La longitud de un numero de casa debe ser 8 digitos");
                accepted=false;
                tel.value="";
                tel.focus();
                     } 
                }
            }
        }
        
            
    }
    if(email.value=="")
    {
        accepted=false;
        alert("Debe llenar el campo Correo Electronico");
        email.focus();
    }
    else
    {
       
         for (var i=0;i<(email.value).length;i++)
               {
                            letra=(email.value).charAt(i);
                            if(letra=="@")
                            {
                                arrob=arrob+1;
                            }
                            else
                            {
                            if(letra==".")
                            {
                                punt=punt+1;
                            }
                            else
                            {
                            if(arrob>1 && i==(email.value).length)
                            {
                                accepted=false;
                                alert("Tu correo no puede tener mas de una @");
                                email.value="";
                                email.focus();
                                break;
                            }
                            else
                            {
                                if(arrob==0 && i==(email.value).length)
                                {
                                    accepted=false;
                                    alert("Tu correo debe tener almenos un @");
                                     email.value="";
                                email.focus();
                                break;
                                }
                            }
                            if(punt>2 && i==(email.value).length)
                            {
                                accepted=false;
                                alert("Tu correo no puede tener mas de 2 puntos '.'");
                                email.value="";
                                email.focus();
                                break;
                            }
                            else
                            {
                                if(punt==0 && i==(email.value).length)
                                {
                                   accepted=false;
                                    alert("Tu correo debe tener almenos un punto '.'");
                                     email.value="";
                                email.focus();
                                break; 
                                }
                            }
                        }
                        }
                }
    }
    if(pass1.value=="")
    {
        accepted=false;
        alert("Debes llenar el campo Contraseña");
        pass1.focus();
    }
    if(pass2.value=="" && pass1.value!="")
    {
        accepted=false;
        alert("Debes llenar el campo Constraseña de Confirmacion");
        pass1.value="";
        pass1.focus();
    }
    if(pass1.value==pass2.value)
    {
        
    }
    else
    {
        accepted=false;
        alert("Las contraseñas no coinciden");
        pass1.value="";
        pass2.value="";
        pass1.focus();
    }
    if(nomPa.value=="")
    {
        alert("No puedes dejar el campo Nombre vacio");
        nomPa.focus();
        accepted=false;
    }
    else
    {
        for (var i=0;i<(nomPa.value).length;i++)
        {
            letra=(nomPa.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Nombre");
                nomPa.value="";
                nomPa.focus();
                break;
            }
        }
    }
    if(patPa.value=="")
    {
        alert("No puedes dejar el campo Apellido Paterno vacio");
        patPa.focus();
        accepted=false;
    }
    else
    {
        for (var i=0;i<(patPa.value).length;i++)
        {
            letra=(patPa.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Apellido Paterno");
                patPa.value="";
                patPa.focus();
                break;
            }
        }
    }
    if(matPa.value=="")
    {
        alert("No puedes dejar el campo Apellido Materno vacio");
        matPa.focus();
        accepted=false;
    }
    else
    {
        for (var i=0;i<(matPa.value).length;i++)
        {
            letra=(matPa.value).charAt(i);
            if(isNaN(letra) || letra=="")
            {
                
            }
            else
            {
                accepted=false;
                alert("No puedes ingresar numeros en el campo Apellido Materno");
                matPa.value="";
                matPa.focus();
                break;
            }
        }
        
    }
    if(accepted==true)
    {
        
        document.getElementById("oculto").value = accepted;
    }
}
function acti()
{delegacion=document.getElementById("delegacion");
    alert(delegacion.value);
}
