function enroll(){
	if(!regTitle()){
		alert("제목을 확인해주세요");
	}else if(!regDesigner){
		alert("디자이너/브랜드칸을 확인해주세요");
	}else if(!regTargetPrice()){
		alert("목표금액을 확인해주세요");
	}else if(!subContreg()){
		alert("상품설명을 확인해주세요");
	}
	
	else{
		
		if(confirm('수정하시겠습니까?')){
			$("#enroll").submit();
		}
	}
	
}	

function regTitle(){
	var reg = /^[\w\W+]{1,16}$/;
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

var main = true;
var sub = true;

var sel_file ; 
function imagePreview(event){

	var files = event.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	if(filesArr.length!=1){
		if(confirm('메인사진을 변경하지않으시겠습니까?')){
			main = true;
			return;
		}else{
			main=false;
			return;
		}
	}
	
	filesArr.forEach(function (f){
		if(!f.type.match("image.*")){
			alert("이미지 파일만 업로드해주세요!");
			main = false;
			return;
		}
		sel_file=f;
		var reader = new FileReader();
		reader.onload = function(event){
			$("#main").attr("src",event.target.result);
			
		}
		main = true;
		reader.readAsDataURL(f);
	});
}

var sel_files = [];
function imagePreviewArr(event){
	
	var files = event.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	if(filesArr.length!=4){
		alert("수정하시려면 사진 4장을 올려주세요");
		if(confirm('수정하지않으시겠습니까?')){
			sub=true;
			return;
		}else{
			sub = false;
			return;
		}
	
	}
	
	for(let i = 0 ; i<filesArr.length;i++){
		if(!filesArr[i].type.match("image.*")){
			alert("이미지 파일만 업로드해주세요!");
			sub = false;
			return;
		}
		sel_files.push(filesArr[i]);
		var reader = new FileReader();
		reader.onload = function(event){
		
			$("#sub"+i).attr("src",event.target.result);
			
		}
		sub = true;
		reader.readAsDataURL(filesArr[i]);
	}
	
}