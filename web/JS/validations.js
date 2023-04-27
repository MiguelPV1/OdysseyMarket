 var Valido;
    
    
    var mailX;
    var nameX;
    var surP;
    var surM;
    var sexX;
    var passX;
    var delX;
    var colX;
    var streetX;
    var numbX;
    var cepeX;
    var tipoX;
function Valida()
{
    mailX=document.getElementById("mail");
    nameX=document.getElementById("name");
    surP=document.getElementById("surnameP");
    surM=document.getElementById("surnameM");
    sexX=document.getElementById("sexo");
    passX=document.getElementById("pass");
    delX=document.getElementById("del");
    colX=document.getElementById("col");
    streetX=document.getElementById("street");
    numbX=document.getElementById("numb");
    cepeX=document.getElementById("cepe");
    tipoX=document.getElementById("type");
    
    
    if(Valido==true)
    {
        document.forms[0].submit();
    }
    if(surM.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Materno");
        surM.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(surM.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(surM.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Materno");
        surM.value="";
        surM.focus();
        }
    }
    if(mailX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo mailX");
        mailX.focus();
    }
    else
    {
        Valido=true;
    }
    
    if(isNaN(mailX.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(mailX.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Mail");
        mailX.value="";
        mailX.focus();
        }
    }
    if(nameX.value=="")
    {
        alert("No puedes dejar el campo Nombre vacio");
        nameX.focus();
        Valido=false;
    }
    else
    {
        Valido=true;
    }
    if(isNaN(nameX.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(nameX.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Nombre");
        nameX.value="";
        nameX.focus();
        }
    }
    if(surP.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Paterno");
        surP.focus();   
    }
    else
    {
        Valido=true;
    }
    if(isNaN(surP.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(surP.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Paterno");
        surP.value="";
        surP.focus(); 
        }
    }
    if(isNaN(streetX.value))
    {
       Valida=true;
    }
    else
    {
        if(streetX.value!=="")
        {  
        alert("No puedes escribir numeros en el campo Calle");
        streetX.value="";
        streetX.focus();
        }
    }
    if(isNaN(numbX.value))
    {
        if(numbX.value!=="")
        {
        alert("No puedes escribir letras en el campo Numero Interior");
        numbX.value="";
        numbX.focus();
        Valido=false;
        }
        else{
            alert("No puedes dejar vacio el campo Numero Interior");}
    }else{
        Valido=true;
    }
    if(sexX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Sexo");
        sexX.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(sexX.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(sexX.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Sexo");
        sexX.value="";
        sexX.focus();
        }
    }
    if(delX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Delegacion");
        delX.focus();
    }
    else
    {
        Valido=true;
    }
    if(colX.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo colonia");
        colX.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(cepeX.value))
    {
        if(cepeX.value!=="")
        {
        alert("No puedes escribir letras en el campo Numero Interior");
        cepeX.value="";
        cepeX.focus();
        Valido = false;
        }
        else{
            alert("No puedes dejar vacio el campo Numero Interior");}
    }else{
        Valido = true;
    }
}

