function manager(){
	document.getElementById("loginUser").value = "bboyle@langosh.com";
	document.getElementById("loginPassword").value = "k^eNVB";
}

function employee(){
	document.getElementById("loginUser").value = "kade.treutel@hotmail.com";
	document.getElementById("loginPassword").value = "Cfl&To";
}


window.onload = function(){ 
    document.getElementById('manager').onclick = manager; 
    document.getElementById('employee').onclick = employee; 
}