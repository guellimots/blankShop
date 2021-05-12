function manager(){
	document.getElementById("loginUser").remove =""
	document.getElementById("loginPassword").remove=""
	document.getElementById("loginUser").value = "bboyle@langosh.com";
	document.getElementById("loginPassword").value = "k^eNVB";
}

function employee1(){
	document.getElementById("loginUser").remove =""
	document.getElementById("loginPassword").remove=""
	document.getElementById("loginUser").value = "kade.treutel@hotmail.com";
	document.getElementById("loginPassword").value = "Cfl&To";
}

function employee2(){
	document.getElementById("loginUser").remove =""
	document.getElementById("loginPassword").remove=""
	document.getElementById("loginUser").value = "yundt.koby@yost.com";
	document.getElementById("loginPassword").value = "v&Xh3I";
}

window.onload = function(){ 
    document.getElementById('manager').onclick = manager; 
    document.getElementById('employee1').onclick = employee1;
	document.getElementById('employee2').onclick = employee2;  
}