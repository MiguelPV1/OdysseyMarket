 
 var Valido;   
 var usrX;
 var passX;
    
function Valida2()
{
    usrX=document.getElementById("username");
    passX=document.getElementById("password");
    Valido=true;
    
    
    if(usrX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Usuario");
        usrX.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(usrX.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(usrX.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Usuario");
        usrX.value="";
        usrX.focus();
        }
    }
    if(passX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Password");
        passX.focus();
        
    }
    else
    {
        Valido=true;
    }
    if(isNaN(passX.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(passX.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Password");
        passX.value="";
        passX.focus();
        }
    }
    
    if(Valido==true)
    {
        document.getElementById("oculto").value = Valido
    }
    
    }
