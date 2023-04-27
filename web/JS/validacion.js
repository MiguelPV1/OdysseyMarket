    var Valido;
    var Cuidadornombre; var CuidadorPaterno;var CuidadorMaterno;
    var CalleCuidador;  var DelegacionCuidador; var NumeroInterior;
    var NumeroExterior; var tipoTel;var telefono; var FechaNaciCuidador;
    var email; var Contras1; var Contras2; var NomPacien;
    var PaternoPacien; var MaternoPacien;
function Valida()
{
    Cuidadornombre=document.getElementById("NomCuidadorPrimario");
    CuidadorPaterno=document.getElementById("ApellidoPaCuidadorPrimario");
    CuidadorMaterno=document.getElementById("ApellidoMaCuidadorPrimario");
    CalleCuidador=document.getElementById("CalleCuidadorPrimario");
    DelegacionCuidador=document.getElementById("delegacion");
    NumeroInterior=document.getElementById("interior");
    NumeroExterior=document.getElementById("exterior");
    tipoTel=document.getElementById("tipoTel");
    telefono=document.getElementById("TelCasa");
    FechaNaciCuidador=document.getElementById("DiaNaciCuidador");
    email=document.getElementById("email");
    Contras1=document.getElementById("pass1");
    Contras2=document.getElementById("pass2");
    NomPacien=document.getElementById("NomPaciente");
    PaternoPacien=document.getElementById("ApelliodPaPaciente");
    MaternoPacien=document.getElementById("ApelliodMaPaciente");
    if(Valido==true)
    {
        document.forms[0].submit();
    }
    if(Cuidadornombre.value=="")
    {
        alert("No puedes dejar el campo Nombre vacio");
        Cuidadornombre.focus();
        Valido=false;
    }
    else
    {
        Valido=true;
    }
    if(isNaN(Cuidadornombre.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(Cuidadornombre.value!="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Nombre");
        Cuidadornombre.value="";
        Cuidadornombre.focus();
        }
    }
    if(CuidadorPaterno.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Paterno");
        CuidadorPaterno.focus();   
    }
    else
    {
        Valido=true;
    }
    if(isNaN(CuidadorPaterno.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(CuidadorPaterno.value!="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Paterno");
        CuidadorPaterno.value="";
        CuidadorPaterno.focus(); 
        }
    }
    if(CuidadorMaterno.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Materno");
        CuidadorMaterno.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(CuidadorMaterno.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(CuidadorMaterno.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Materno");
        CuidadorMaterno.value="";
        CuidadorMaterno.focus();
        }
    }
    if(isNaN(CalleCuidador.value))
    {
       
    }
    else
    {
        if(CalleCuidador.value!=="")
        {  
        alert("No puedes escribir numeros en el campo Calle");
        CalleCuidador.value="";
        CalleCuidador.focus();
        }
    }
    if(isNaN(NumeroInterior.value))
    {
        if(NumeroInterior.value!=="")
        {
        alert("No puedes escribir letras en el campo Numero Interior");
        NumeroInterior.value="";
        NumeroInterior.focus();
        }
    }
    if(isNaN(NumeroExterior.value))
    {
        if(NumeroExterior.value!=="")
        {
        alert("No puedes escribir letras en el campo Numero Exterior");
        NumeroExterior.value="";
        NumeroExterior.focus();
        }
    }
    if(tipoTel.value!=="0" && telefono.value=="")
    {
        if(tipoTel.value=="1")
        {
        alert("Escribe un telefono Celular");
        telefono.focus();
        }
        else
        {
            alert("Escribe un telefono de Casa");
            telefono.focus();
        } 
    }
    if(telefono.value!=="" && tipoTel.value=="0")
    {
        alert("Selecciona el tipo de Telefono");
        tipoTel.focus();
    }
    if(FechaNaciCuidador.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Fecha de Nacimento");
        FechaNaciCuidador.focus();
    }
    else
    {
        Valido=true;
    }
    if(email.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo email");
        email.focus();
    }
    else
    {
        Valido=true;
    }
    if(Contras1.value!=Contras2.value)
    {
        Valido=false;
        alert("Las contraseñas no coinciden");
        Contras1.value="";
        Contras2.value="";
        Contras1.focus();
    }
     if(NomPacien.value=="")
    {
        Valido=false;
        alert("No puedes dejar el campo Nombre de Paciente vacio");
        NomPacien.focus();
        
    }
    else
    {
        Valido=true;
    }
    if(isNaN(NomPacien.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(NomPacien.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Nombre de Paciente");
        NomPacien.value="";
        NomPacien.focus();
        }
    }
    if(PaternoPacien.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Paterno del Paciente");
        PaternoPacien.focus();   
    }
    else
    {
        Valido=true;
    }
    if(isNaN(PaternoPacien.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(PaternoPacien.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Paterno del Paciente");
        CuidadorPaterno.value="";
        CuidadorPaterno.focus(); 
        }
    }
    if(MaternoPacien.value=="")
    {
        Valido=false;
        alert("No puedes dejar vacio el campo Apellido Materno del Paciente");
        MaternoPacien.focus();
    }
    else
    {
        Valido=true;
    }
    if(isNaN(MaternoPacien.value))
    {
        Valido=true;
    }
    else
    {
        Valido=false;
        if(Cuidadornombre.value!=="")
        {
        Valido=false;
        alert("No puedes escribir numeros en el campo Apellido Materno del Paciente");
        MaternoPacien.value="";
        MaternoPacieno.focus();
        }
    }
}
