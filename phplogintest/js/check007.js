function register(){
	var email= document.getElementById('email').value;
	var nickname= document.getElementById('nickname').value;
	var pass= document.getElementById('pass').value;
	var cpass= document.getElementById('cpass').value;
	var yzm= document.getElementById('yzm').value;

	if ( nickname== "" ||nickname== null) {
		alert("�ǳƲ���Ϊ��!");
		document.getElementById('nickname').focus();
		return false;
	}
	if (email == "" ||email== null) {
		alert("���䲻��Ϊ��!");
		document.getElementById('email').focus();
		return false;
	}
	else
	{
		var temp = document.getElementById("email");
//�Ե����ʼ�����֤
      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(temp.value!=""){
                         if(!myreg.test(temp.value)){
                                                        alert('��ʾ:��������Ч��E_mail��');
                                                         document.getElementById('email').focus();
                                                         return false;
	                                                    }
	                    }
	 }

	if ( pass== "" ||pass== null) {
		alert("����������!");
		document.getElementById('pass').focus();
		return false;
	}
    if ( cpass== "" ||cpass== null) {
		alert("�������벻һ��!");
		document.getElementById("pass").value = "";
		document.getElementById("cpass").value = "";
		document.getElementById('pass').focus();
		return false;
	}
    if ( yzm== "" ||yzm== null) {
		alert("��֤�벻��Ϊ��!");
		document.getElementById('yzm').focus();
		return false;
	}
	
     if (pass!=cpass)
     {
       
         alert("�������벻һ��!");
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
		alert("���䲻��Ϊ��!");
		document.getElementById('email').focus();
		return false;
	}
	else
	{
		var temp = document.getElementById("email");
//�Ե����ʼ�����֤
      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     if(temp.value!=""){
                         if(!myreg.test(temp.value)){
                                                        alert('��ʾ:��������Ч��E_mail��');
                                                         document.getElementById('email').focus();
                                                         return false;
	                                                    }
	                    }
	 }

       


	if ( pass== "" ||pass== null) {
		alert("����������!");
		document.getElementById('pass').focus();
		return false;
	}
   
  
  
	return true;
}
