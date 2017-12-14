function register(){
	var email= document.getElementById('email').value;
	var nickname= document.getElementById('nickname').value;
	var pass= document.getElementById('pass').value;
	var cpass= document.getElementById('cpass').value;
	var yzm= document.getElementById('yzm').value;

	if ( nickname== "" ||nickname== null) {
		alert("昵称不能为空!");
		document.getElementById('nickname').focus();
		return false;
	}
	if (email == "" ||email== null) {
		alert("邮箱不能为空!");
		document.getElementById('email').focus();
		return false;
	}
	else
	{
		var temp = document.getElementById("email");
//对电子邮件的验证
      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(temp.value!=""){
                         if(!myreg.test(temp.value)){
                                                        alert('提示:请输入有效的E_mail！');
                                                         document.getElementById('email').focus();
                                                         return false;
	                                                    }
	                    }
	 }

	if ( pass== "" ||pass== null) {
		alert("请输入密码!");
		document.getElementById('pass').focus();
		return false;
	}
    if ( cpass== "" ||cpass== null) {
		alert("两次密码不一致!");
		document.getElementById("pass").value = "";
		document.getElementById("cpass").value = "";
		document.getElementById('pass').focus();
		return false;
	}
    if ( yzm== "" ||yzm== null) {
		alert("验证码不能为空!");
		document.getElementById('yzm').focus();
		return false;
	}
	
     if (pass!=cpass)
     {
       
         alert("两次密码不一致!");
		document.getElementById("pass").value = "";
		document.getElementById("cpass").value = "";
		document.getElementById('pass').focus();
		return false;    
      }
  
  
	return true;
}
function login(){
	var email= document.getElementById('email').value;
	var pass= document.getElementById('pass').value;
	if (email == "" ||email== null) {
		alert("邮箱不能为空!");
		document.getElementById('email').focus();
		return false;
	}
	else
	{
		var temp = document.getElementById("email");
//对电子邮件的验证
      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(temp.value!=""){
                         if(!myreg.test(temp.value)){
                                                        alert('提示:请输入有效的E_mail！');
                                                         document.getElementById('email').focus();
                                                         return false;
	                                                    }
	                    }
	 }

       


	if ( pass== "" ||pass== null) {
		alert("请输入密码!");
		document.getElementById('pass').focus();
		return false;
	}
   
  
  
	return true;
}
