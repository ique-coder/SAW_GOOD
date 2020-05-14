var main = $("#main"),
	main_offset = $("#main").offset(), 
	parent = $("#main").parent(), 
	position = $("#main").position();
	

$(window).scroll(function() {
	var bottom = parent.offset().top + parent.height();
	//탑에 붙이기
	if ($(window).scrollTop() >= main_offset.top) {
	parentSize();
	$("#main").addClass("wrapper");
	$("#main").removeClass("attachBottom");
	if ($("#main").height() >= bottom - $(window).scrollTop()) {
		$("#main").removeClass("wrapper");
		$("#main").addClass("attachBottom");
	}
	} else {
	$("#main").removeClass("wrapper");
	}
//	//바텀에 붙이기
//	if($(window).scrollTop()+$(window).height()>=main_offset.top+main.height()){
//		parentSize();
//		$("#main").addClass("wrapper");
//		$("#main").removeClass("attachBottom");
//		//특정 위치를 넘어가면 fixed해제
//		if($(window).scrollTop()+$(window).height()>=bottom ){
//			$("#main").removeClass("wrapper");
//			$("#main").addClass("attachBottom");
//		}
//	}else{
//		$("#main").removeClass("wrapper");
//	}

})
function parentSize() {
	//fixed로틀어지는 사이즈를 맞춰줌
	var pWidth = parent.width(),
		pHeight = parent.height() /2;
	$("#main").width(pWidth);
	$("#main").height(pHeight);

}

