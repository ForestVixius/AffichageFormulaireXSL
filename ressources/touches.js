$('.cellule').click(function (event) {
    $('*').removeClass('focus');
    $(this).addClass('focus');
});

document.onkeyup=function(e){
	if(e.altKey && e.which == '73') {
		$(".id").toggle();
		return false;
	}
	if(e.altKey && e.which == '84') {
		$(".retour").toggle();
		return false;
	}
}

