function previous() {

	$("#container").attr("style", "transform: translateY(0);");
}

// 이메일 선택
function selectEmail() {
	var e = $("#emailSelect");

	var text = $(e).children("option:selected").text();

	if (text == "직접 입력") {
		$("#email2").val("");
	} else {
		$("#email2").val(text);

	}
}
// 유효성 검사
function regCheck() {
	var pw = $("#pwd").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	$("#validation_pw").removeClass("alert-text");
	$("#validation_pw").addClass("warn-text");
	if (pw.length < 8 || pw.length > 16) {
		$("#validation_pw").html("8자리 ~ 16자리 이내로 입력해주세요.");
		return false;
	} else if (pw.search(/\s/) != -1) {
		$("#validation_pw").html("비밀번호는 공백 없이 입력해주세요.");
		return false;
	} else if (num < 0 || eng < 0 || spe < 0) {
		$("#validation_pw").html("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		return false;
	} else {
		$("#validation_pw").html("");
		return true;
	}
}
$(function() {

	var idcheck = false;
	var pwcheck = false;// 비밀번호 두 개가 같은지
	var reg_pw = false;// 비밀번호 유효성 검사
	var email_ck = false;
	var name_ck = false;
	var phone2_ck = false;
	var phone3_ck = false;

	// 아이디유효성 검사
	$("#userId").focus(function() {
		$("#validation_id").addClass("alert-text");
		$("#validation_id").removeClass("warn-text");
		$("#validation_id").html("영문자로 시작하는 5~16자");

	})

	$("#userId").blur(function() {
		var flag;
		var idReg = /^[a-z]+[a-z0-9]{4,15}$/g;// 영문자로 시작하는 5~16글자 아이디
		if (!idReg.test($(this).val().trim())) {
			$("#validation_id").removeClass("alert-text");
			$("#validation_id").addClass("warn-text");
			$("#validation_id").html("아이디를 다시 입력해 주세요");
			idcheck = false;
		} else {

			 if(idCheck()){
				 idcheck = true;
				$("#validation_id").html("사용가능한 아이디입니다.").addClass("alert-text");
			 }else{
				 $("#validation_id").removeClass("alert-text");
				 $("#validation_id").addClass("warn-text");
				 $("#validation_id").html("존재하는 아이디 입니다.");
				 idcheck=false;	
			 }

		}

	})
	$("#pwd").focus(function() {
		$("#validation_pw").addClass("alert-text")
		$("#validation_pw").removeClass("warn-text");
		$("#validation_pw").html("영문+숫자+특수문자 조합 8~16자리");

	})
	$("#pwd").blur(function() {

		reg_pw = regCheck();
		if ($("#chk-pwd").val().length > 0) {

			if ($(this).val() != $("#chk-pwd").val()) {
				$("#validation_pw2").show();
				pwcheck = false;
			} else {
				$("#validation_pw2").hide();
				pwcheck = true;
			}
		}
	})

	$("#validation_pw2").hide();
	$("#chk-pwd").blur(function() {
		if ($("#pwd").val() != $(this).val()) {
			$("#validation_pw2").show();
			pwcheck = false;
		} else {
			$("#validation_pw2").hide();
			pwcheck = true;
		}

	})

	// 다음버튼 눌렀을 때
	$("#nextBtn").click(
			function() {
				var eReg1 = /[A-Za-z0-9\-\_]{2,}/gi;
				var eReg2 = /[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				var kor = /[ㄱ-ㅎ가-힣]{1,}/g;
				if (!idcheck) {
					alert("아이디를 확인해 주세요!");
				} else if (!pwcheck || !reg_pw) {
					alert("비밀번호를 확인해 주세요!");
				} else if (!eReg1.test($("#email1").val())){
					alert("이메일을 확인해 주세요!1");
					email_ck = false;
				}else if(!eReg2.test($("#email2").val())){
					alert("이메일을 확인해 주세요!2");
					email_ck = false;
				}else if(kor.test($("#email1").val())){
					alert("이메일을 확인해 주세요!3한글");
					email_ck = false;
				}else if(kor.test($("#email2").val())){
					alert("이메일을 확인해 주세요!4한글");
					email_ck = false;
				}else {
					$("#container").attr("style",
							"transform: translateY(-100%);");
					email_ck = true;
				}

			})
	$("#checkPhone").hide();
	$("input[name='phone2']").blur(function() {
		var reg = /^[2-9]\d{2,3}/g;

		if (!reg.test($(this).val())) {
			$("#checkPhone").show();
			$(this).val("").focus();
			phone2_ck = false;
		} else {
			$("#checkPhone").hide();
			phone2_ck = true;
		}

	})
	$("input[name='phone3']").blur(function() {
		var reg = /\d{4}/g;

		if (!reg.test($(this).val())) {
			$("#checkPhone").show();
			$(this).val("").focus();
			phone3_ck = false;
		} else {
			$("#checkPhone").hide();
			phone3_ck = true;
		}

	})
	$("#checkName").hide();
	$("input[name='userName'").blur(function() {
		if ($(this).val().length < 2) {
			$("#checkName").show();
			$(this).focus();
			name_ck = false;
		} else {
			$("#checkName").hide();
			name_ck = true;
		}
	})

	$("#submit-btn").click(
			function() {
				if (!idcheck) {
					alert("아이디 확인");
				} else if (!pwcheck || !reg_pw) {
					alert("비밀번호 확인");
				} else if (!email_ck) {
					alert("이메일 확인");
				} else if (!name_ck) {
					alert("이름 확인");
				} else if (!phone2_ck || !phone3_ck) {
					alert("전화번호 확인");
				} else if ($("#sample6_postcode").val().length < 1
						|| $("#sample6_detailAddress").val().length < 1) {
					alert("주소 확인");
				} else {
					$("#email").val($("#email1").val()+"@"+$("#email2").val());
					$("#phone").val($("#selectNum").val()+$("input[name='phone2']").val()+$("input[name='phone3']").val());
					
					$("form").submit();
				}
			})

})

function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				// document.getElementById("sample6_extraAddress").value =
				// extraAddr;

			} else {
				document.getElementById("sample6_detailAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode;
			document.getElementById("sample6_address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}