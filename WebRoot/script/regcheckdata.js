function checkdata() {
	var ssn=form.username.value.toLowerCase();
	
	if (!checkUserName(ssn)) return false;  
	
	if( strlen(form.password.value)<6 || strlen(form.password.value)>16 ) {
		alert("password length should be 6-16,letter,number,symbol only ");
		form.password.focus();
		return false;
	}
	
	
	if( strlen2(form.password.value) ) {
		alert("your password include unformat symbol,please correct");
		form.password.focus();
		return false;
	}
	if( form.password.value == form.username.value ) {
		alert("username can not be the same with password");
		form.password.focus();
		return false;
	}
	if( form.password2.value =="" ) {
		alert("please input password confirm");
		form.password2.focus();
		return false;
	}
	if( form.password2.value != form.password.value ) {
		alert("password inconsistent!");
		form.password.focus();
		return false;
	}
	
	if( form.phone.value =="" ) {
		alert("please input your phone");
		form.password2.focus();
		return false;
	}
	
	
	if(form.addr.value == "") {
		alert("please input address");
		form.addr.focus();
		return false;
	}
	return true;
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		document.getElementById("usernameErr").innerHTML = "<font color='red'>please input the right user name, the length should be 3-18</font>";
		form.username.focus();
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("please format your username, should not contains blank");
		form.username.focus();
		return false;
	}
	if (!isSsnString(ssn)){
		alert("sorry,this username has already be used!");
		form.username.focus();
		return false;
	}
	
	document.getElementById("usernameErr").innerHTML = "";
	
	return true;
}

function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}

function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}

function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
   var ssn=form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}