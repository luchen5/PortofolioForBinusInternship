function invalidName(nameBox){
    var check  = document.getElementById("username").value;
    if(check.length == 0){
        nameBox.setCustomValidity("Username can't be empty");
    }else if(check.length< 5){
        nameBox.setCustomValidity('Username must be atleast 5 character');
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

function invalidPassword(passwordBox){
    var check = document.getElementById("password").value;
    if(check.length == 0){
        passwordBox.setCustomValidity("Password can't be empty!");
    }else if(check.length < 8){
        passwordBox.setCustomValidity("Password must be atleast 8 characters!");
    // }else if() {
        
    } else {
        passwordBox.setCustomValidity('');
    }
}

function invalidNation(nationBox){
    var check = document.getElementById("country").value;
    if(check == ""){
        nationBox.setCustomValidity("Please Choose Your Nationality!");
    }else{
        nationBox.setCustomValidity('');
    }
}

function invalidGender(genderBox){
    var check = document.getElementById("gender").value;    
    if(check == ""){
        genderBox.setCustomValidity("Please Choose Your Gender!");
    }else{
        genderBox.setCustomValidity('');
    }
}

function invalidDoB(dobBox){
    var check = new Date(document.getElementById("dob").value);
    var baseDate = new Date(Date.now());
    if(baseDate.getFullYear() - check.getFullYear() < 13){
        dobBox.setCustomValidity("You must be atleast 13 years old");
    }else{
        dobBox.setCustomValidity('');
    }
}

function invalidTnC(tncBox){
    var check = document.getElementById("tnc");
    if(check.checked == false){
        tncBox.setCustomValidity("Please agree to Terms and Condition");
    }else{
        tncBox.setCustomValidity('');
    }
}