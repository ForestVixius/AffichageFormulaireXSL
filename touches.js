document.onkeyup=function(e){
	var e = e || window.event; // for IE to cover IEs window object
	if(e.altKey && e.which == '73') {
		// alert('Keyboard shortcut working!');
		$(".id").toggle();
		return false;
	}
	if(e.altKey && e.which == '84') {
		// alert('Keyboard shortcut working!');
		$(".retour").toggle();
		return false;
	}
}

