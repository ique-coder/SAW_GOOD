function enroll(){
	if(!regTitle()){
		alert("제목을 확인해주세요");
	}else if(!regDesigner){
		alert("디자이너/브랜드칸을 확인해주세요");
	}else if(!regTargetPrice()){
		alert("목표금액을 확인해주세요");
	}else if(!subContreg()){
		alert("상품설명을 확인해주세요");
	}else{
		
		if(confirm('수정하시겠습니까?')){
			$("#enroll").submit();
		}
	}
	
}	

function regTitle(){
	var reg = /^[\w\W+]{1,12}$/;
	if(!reg.test($("#title").val())){
		
		$("#title").val("");
		return false;
	}else{
		return true;
	}
		
}
function regDesigner(){
	var reg = /^[\w\W+]{0,}$/;
	if(!reg.test($("#designer").val())){
		$("#designer").val("");
		return false;
	}else{
		return true;
	}
}
function regTargetPrice(){
	var reg = /^[1-9]+[0-9]{0,11}/;
	if(!reg.test($("#targetPrice").val())){
		$(this).val("");
		return false;
	}else{
		return true;
	}
}
function subContreg(){
	var reg =/^[\w\W+]{0,130}$/;
	if(!reg.test($("#subContent").val())){
		$(this).val("");
		return false;
	}else{
		return true;
	}
}

$("#endDate").change(function(){
	
	var date = new Date();
	var choice = new Date($(this).val());
	
	if(choice<date){
		alert("지난 날짜는 입력할 수 없습니다.");
		$(this).val("");
	}
});