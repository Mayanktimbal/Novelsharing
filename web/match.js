var pass; 
var pass2;

function validate(){
    
    pass = document.getElementById("pass").value;
    pass2 = document.getElementById("pass2").value;
    
    if(pass!=pass2){
        
        document.getElementById("pappu").innerHTML = "password not match";
        //window.alert("password not match");
        return false;
     
    }
    else
        return true;
    
}
