function register(){
	
	var nickname= document.getElementById('nickname').value;
	var email= document.getElementById('email').value; 
	var passs= document.getElementById('passs').value;
	var cpasss= document.getElementById('cpasss').value;
	var yzzm= document.getElementById('yzzm').value; 
		if ( nickname== "" ||nickname== null) {
		alert("The username cannot be empty!");
		document.getElementById('nickname').focus();
		return false;
	}
	if (email == "" ||email== null) {
		alert("Mailbox cannot be empty!");
		document.getElementById('email').focus();
		return false;
	}
	else
	{
		var temp = document.getElementById("email");

      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(temp.value!=""){
                         if(!myreg.test(temp.value)){
                                                        alert("Please enter a valid email address!");
                                                         document.getElementById('email').focus();
                                                         return false;
	                                                    }
	                    }
	 }
	 
	
	if ( passs== "" ||passs== null) {
		alert("Please enter the password!");
		document.getElementById('passs').focus();
		return false;
	}
	 if ( cpasss== "" ||cpasss== null) {
		alert("Confirm the password can not be empty!");
		
		document.getElementById('cpasss').focus();
		return false;
	}
	 if (passs!=cpasss)
     {
       
         alert("The two passwords do not match!!");
		document.getElementById("passs").value = "";
		document.getElementById("cpasss").value = "";
		document.getElementById('passs').focus();
		return false;    
      }
	
    if (yzzm == "" ||yzzm== null) {
		alert("Verification code cannot be empty!");
		document.getElementById('yzzm').focus();
		return false;
	}
	
	return true;
	

}
function login(){
	var username= document.getElementById('username').value;
	var passs= document.getElementById('passs').value;
	if (username == "" ||username== null) {
		alert("Please enter your username!");
		document.getElementById('username').focus();
		return false;
	}
	

	if ( passs== "" ||passs== null) {
		alert("Please enter the password!");
		document.getElementById('passs').focus();
		return false;
	}
   
  
  
	return true;
}
