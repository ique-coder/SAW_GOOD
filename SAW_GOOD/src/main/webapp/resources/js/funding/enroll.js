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
var reg = /\d/g;

$("#totalPrice").blur(function(){
	if(!reg.test($(this).val())){
		alert("숫자만 입력해주세요.");
		$(this).val("");
	}
})

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
function enroll(){
	submit();
}