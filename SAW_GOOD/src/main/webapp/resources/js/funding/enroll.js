//function addRow(){
//    	$("#reword-container").append('<tr><td><input type="text" class="inputStyle" name="reword"></td>'
//           +'<td><input type="text" class="inputStyle" name="partPrice"></td></tr>');
//            
//       
//    }
//    function addSize(){
//    	$("#size-container").append('<tr><th><input type="text" name="item"></th>'
//    			+'<td><input type="text" class="size" name="width"> x <input type="text" class="size" name="depth"> x <input type="text" class="size" name="height"></td></tr>');
//
//    }
//    

var titleFlag = false;
var designFlag = false;
var targetFlag = false;
var subconFlag = false;
var mainPicFlag = false; 
var subPicFlag = false;
var endDate = false;
function enroll(){
	if(!titleFlag){
		alert("제목을 확인해주세요");
	}else if (!designFlag){
		alert("design / brand 칸을 확인해주세요");
	}else if(!targetFlag){
		alert("목표금액을 확인해주세요");
	}else if(!subconFlag){
		alert("상품설명칸을 확인해주세요");
	}else if(!endDate){
		alert("목표일자를 확인해주세요");
	}else if(!mainPicFlag){
		alert("메인사진을 확인해주세요");
	}else if(!subPicFlag){
		alert("제품사진 확인해주세요");
	}
	else{
		$("#enroll").submit();
	}
	
	
}
$("#title").blur(function(){
	var reg =/^[\w\W+]{1,12}$/;
	if(!reg.test($(this).val())){
		alert("제목은 12자 이하로 정확하게 입력해주세요");
		$(this).val("");
		titleFlag = false;
	}else{
		titleFlag = true;
	}
	
})
$("#targetPrice").blur(function(){
	var reg = /^[1-9]+[0-9]{0,11}/;
	if(!reg.test($(this).val())){
		alert("정확하게 입력해주세요.");
		$(this).val("");
		targetFlag = false;
	}else{
		targetFlag = true;
	}
})
$("#designer").blur(function(){
	var reg =/^[\w\W+]{0,}$/;
	if(!reg.test($(this).val())){
		alert("정확하게 입력해주세요");
		$(this).val("");
		designFlag = false;
	}else{
		designFlag = true;
	}
})
$("#subContent").blur(function(){
	
	var reg =/^[\w\W+]{0,130}$/;
	if(!reg.test($(this).val())){
		alert("130자 이하로 입력해주세요");
		subconFlag = false;
	}else{
		subconFlag = true;
	}
})
$("#endDate").change(function(){
	
	var date = new Date();
	var choice = new Date($(this).val());
	
	if(choice<date){
		alert("지난 날짜는 입력할 수 없습니다.");
		$(this).val("");
		endDate =false;
	}else{
		endDate= true;
	}
	
})
var sel_file ; 

function imagePreview(event){
	
	var files = event.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function (f){
		if(!f.type.match("image.*")){
			alert("이미지 파일만 업로드해주세요!");
			mainPicFlag = false;
			return;
		}
		sel_file=f;
		var reader = new FileReader();
		reader.onload = function(event){
			$("#main").attr("src",event.target.result);
			
		}
		mainPicFlag = true;
		reader.readAsDataURL(f);
	});
	
	
}
 
var sel_files = [];
function imagePreviewArr(event){
	
	var files = event.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	if(filesArr.length!=4){
		alert("사진 4개를 첨부해 주세요");
		subPicFlag = false;
		return;
	}
	
	for(let i = 0 ; i<filesArr.length;i++){
		if(!filesArr[i].type.match("image.*")){
			alert("이미지 파일만 업로드해주세요!");
			subPicFlag = false;
			return;
		}
		sel_files.push(filesArr[i]);
		var reader = new FileReader();
		reader.onload = function(event){
		
			$("#sub"+i).attr("src",event.target.result);
			
			
		}
		subPicFlag = true;
		reader.readAsDataURL(filesArr[i]);
	}
	
}



$("input[name='partPrice']").blur(function(){
	if(!reg.test($(this).val()) && $(this).val() != "" ){
		alert("숫자만 입력해주세요.");
		$(this).val("");
	}
})
$("input[class='size']").blur(function(){
	if(!reg.test($(this).val()) && $(this).val() != ""){
		alert("숫자만 입력해주세요.");
		$(this).val("");
	}
})
