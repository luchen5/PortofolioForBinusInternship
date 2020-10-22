function invalidName(nameBox){
    var check  = document.getElementById("name").value;
    if(check.length == 0){
        nameBox.setCustomValidity("Name can't be empty");
    }else if(check.length< 3){
        nameBox.setCustomValidity('Name must be atleast 3 character');
    }else{
        nameBox.setCustomValidity(''); 
    }
}

function checkEmail(email){
	if 		(email.startsWith("@") || email.startsWith(".")) 		{return true;}
	else if (email.endsWith("@")|| email.endsWith("."))				{return true;}
	else if (email.indexOf("@.")> -1 || email.indexOf(".@") > -1)	{return true;}
	else if (email.indexOf("@") < 0 || email.indexOf(".") < 0)		{return true;}
	else															{return false;}
}

function invalidEmail(emailBox){
   var check = document.getElementById("email").value;
    if(check.length == 0){
        emailBox.setCustomValidity("Email can't be empty");
    }else if(checkEmail(check)){
        emailBox.setCustomValidity("Email is invalid!");
    }else{
        emailBox.setCustomValidity(''); 
    }

}

function invalidPhone(phoneBox){
    var check = document.getElementById("phone").value;
    var phoneReg=[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9];
    if(check.length == 0){
        phoneBox.setCustomValidity("Phone can't be empty");
    }else if(check.match(phoneReg)){
        emailBox.setCustomValidity('');
    }else{
        emailBox.setCustomValidity("Phone is Valid"); 
    }
}