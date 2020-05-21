<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;1,100&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&family=Noto+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path }/resources/css/personalInfo.css"
	type="text/css" />
<!-- 다음주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%-- <script src="${path }/resources/js/bootstrap-grid.min.css"></script> --%>

<title>Document</title>
<link rel="stylesheet" href="${path }/resources/css/personalInfo.css" />

</head>
<body>
	<div class="container-fluid main">
		<div class="row">
			<!-- <div class="col-md-2"></div> -->
			<div class="col-md-8" id="profileBackground">
				<div class="row" style="height: 20%;">
					<div class="col-md-12 MemberInfo">
						<span class="title">Profile modify</span> </br> <span class="content">당신의
							새로운 정보를 알려주세요!</span>
					</div>
				</div>
				<form id="profileForm" action="${path}/member/memberUpdate" enctype="multipart/form-data"
					method="post" style="height: 80%;">
					<div class="row" style="height: 100%;">
						<div class="col-md-6" style="margin-top: 3%">
							<div id="profileImg"
								style="width: 60%; height: 50%; border-radius: 125px; display: block; margin-left: 25%;">
							<c:if test="${mem.reProfile !=null }">
                            	<img src="${path }/resources/images/member/${mem.reProfile}" class="profileImg"/>
                            </c:if>
                            <c:if test="${mem.reProfile ==null }">
                            	<img src="${path }/resources/images/profileBasic/${mem.profile}"  class="profileImg"/>
                            </c:if>
							</div>
							<div class="filebox">
								<label for="pro_file">프로필사진 변경</label> 
								<input type="file" name="profileImg"	id="pro_file" accept="image/*" value="">
							</div>
							<button type="button" class="pwd-btn" data-toggle="modal"
								data-target="#pwdModal">비밀번호 변경</button>
							<button type="button" class="seller-btn" data-toggle="modal"
								data-target="#sellerModal">판매자 회원등록</button>

						</div>
						<div class="col-md-6 profileModify">
							<div class="margin-top" style="height: 15%">
								<p class="modifyTitle" style="margin-bottom: 10px">&nbsp 변경할
									이름 Name</p>
								<input type="text" class="modifyText" id="userName"
									name="userName" placeholder="이름" value="${mem.userName }">
							</div>
							<div class="margin-top" style="height: 15%">
								<p class="modifyTitle" id="tUserPhone"
									style="margin-bottom: 10px">&nbsp 변경할 전화번호 Phone</p>
								<input type="text" class="modifyText" id="userPhone"
									name="phone" placeholder="전화번호 ( '-' 생략 예->0100000000 )"
									value="${mem.phone }">
							</div>
							<!-- <!-- <div class="margin-top">
								<p class="modifyTitle" id="tUserEmail">&nbsp 변경할 이메일 Email</p>
								<input type="text" class="modifyText" id="userEmail"
									placeholder="이메일">
							</div> -->
							<div class="margin-top" style="height: 35%">
								<p class="modifyTitle" style="margin-bottom: 5px">&nbsp 변경할
									주소 Address</p>
								<input type="text" class="modifyText" id="postcode"
									style="height: 20%; margin-bottom: 0px;" name="postCode"
									placeholder="우편번호" value="${mem.postCode }" readonly>
								<button type="button" class="post-btn" onclick="Postcode()">주소검색</button>
								<input type="text" class="modifyText" id="address"
									style="height: 20%;" name="address1"
									style="margin-bottom: 10px;" placeholder="기본주소"
									value="${mem.address1 }" readonly> <input type="text"
									class="modifyText" id="detailAddress" style="height: 20%;"
									name="address2" placeholder="상세주소" value="${mem.address2 }">
							</div>
							<div style="height: 20%">
								<button type="button" class="delete-btn" id="memberDelete"
									onclick="">회원탈퇴</button>
								<button type="button" class="complete-btn" id="profileChange"
									onclick="proChange()">정보변경 완료</button>
							</div>
						</div>
					</div>
					<input type="hidden" name="userId" value="${mem.userId }">
				</form>

			</div>

			<!-- 	<div class="col-md-2"></div> -->
		</div>
	</div>
	<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: 0; padding-bottom: 0;">
					<h5 class="modal-title modifyTitle" id="exampleModalLabel">&nbsp
						비밀번호 변경 Password</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="pwdF" action="${path}/member/passwordUpdate" method="post">
					<div class="modal-body" style="padding-bottom: 0;">
						<div>
							<input type="password" class="form-control" name="password"
								id="userPwd" placeholder="새로운 비밀번호" style="border-radius: 7px;"
								required>
						</div>
						<div>
							<input type="password" class="form-control" id="userPwd2"
								placeholder="새로운 비밀번호 확인"
								style="border-radius: 7px; margin-top: 10px;" required>
						</div>
					</div>
					<input type="hidden" name="userId" value="${mem.userId }">
					<div class="modal-footer" style="border: 0;">
						<button type="button" class="change-btn" onclick="pwdModify();">변경</button>
						<button type="button" class="cancel-btn" data-dismiss="modal">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="sellerModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="border: 0; padding-bottom: 0;">
					<h5 class="modal-title modifyTitle" id="exampleModalLabel">&nbsp
						펀딩 판매자등급 Update</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="seller" action="${path}/member/sellerUpdate" method="post">
					<div class="modal-body" style="padding-bottom: 0;">
						<div>
							<input type="text" class="form-control" name="businessNumber"
								id="businessNumber"
								placeholder=" 사업자등록번호 (예 : 1400000000 '-' 생략)"
								style="border-radius: 7px;" required> <span
								id="businessCk"></span>
						</div>
					</div>
					<input type="hidden" name="userId" value="${mem.userId }">
					<div class="modal-footer" style="border: 0;">
						<button type="button" class="change-btn" onclick="sellerUpdate();">신청</button>
						<button type="button" class="cancel-btn" data-dismiss="modal">취소</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script>
		/* function setTumbnail(event){
			var reader = new FileReader();
			
			reader.onload = function(event){
				var img = document.createElement("img");
				img.setAttribute("src",event.target.result);
				document.querySelector("div#proimg").appendChild(img);
			};
		 	reader.readAsDataUrl(event.target.files[0]);
		}
		 */
		$(function() {
			$("#pro_file").on("change", profileImg);
		})
		function profileImg(e) {
			var files = e.target.files;
			var fileArr = Array.prototype.slice.call(files);
			$("#profileImg").find($("img")).remove();
			fileArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("이미지 파일만 등록해주세요!");
					$("#pro_file").val("");
					$("#profileImg").find($("img")).remove();
					return;
				}
				viewImg = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					console.log(e.target);
					$("#profileImg").append($("<img>").attr({
						"src" : e.target.result,
						"class" : "profileImg"
					}));
				}
				reader.readAsDataURL(f);
			});
		}

		var bsCheck = false;
		function Postcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							console.log("들어오냐4");
							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								console.log("들어오냐");
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								console.log("들어오냐2");
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								console.log("들어오냐3");
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								console.log("들어오냐4");
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							console.log(data.zonecode);
							console.log(fullRoadAddr);

							// $("[name=addr1]").val(data.zonecode);
							// $("[name=addr2]").val(fullRoadAddr);

							document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('address').value = fullRoadAddr;
							document.getElementById('detailAddress').value = data.jibunAddress;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();

		}
		var emailRule = /(?=^\w+@[a-zA-Z]+[.][a-zA-Z.]+$).{5,}/i;//이메일 유효성
		var phoneRule = /^\d{2,3}\d{3,4}\d{4}$/;
		var pwdRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

		// 이메일 정규표현식 적용
		$("#userEmail").change(
				function() {
					if (!emailRule.test($("#userEmail").val())) {
						$("#userEmail").siblings('span').remove();
						$("#userEmail").addClass('error');
						$("#tUserEmail").attr('style', 'display:inline;');
						$("#tUserEmail").after(
								$('<span>').html('  다시 입력해 주십시오.').addClass(
										'error'));

					} else {
						$("#userEmail").siblings('span').remove();
						$("#userEmail").removeClass('error');
						$("#tUserEmail").attr('style', 'display:block;');

					}
				});
		// 전화번호 정규표현식 적용
		$("#userPhone").change(
				function() {
					if (!phoneRule.test($("#userPhone").val())) {
						$("#userPhone").siblings('span').remove();
						$("#userPhone").addClass('error');
						$("#tUserPhone").attr('style', 'display:inline;');
						$("#tUserPhone").after(
								$('<span>').html('  다시 입력해 주십시오.').addClass(
										'error'));

					} else {
						$("#userPhone").siblings('span').remove();
						$("#userPhone").removeClass('error');
						$("#tUserPhone").attr('style', 'display:block;');

					}
				});
		//비밀번호 정규표현식 적용
		$("#userPwd").change(
				function() {
					if (!pwdRule.test($("#userPwd").val())) {
						$("#userPwd").siblings('span').remove();
						$("#userPwd").addClass('error');
						$("#userPwd").after(
								$('<span>').html('숫자+영어+특수문자로 입력해주시기 바랍니다.')
										.addClass('error'));

					} else {
						$("#userPwd").siblings('span').remove();
						$("#userPwd").removeClass('error');

					}
				});

		//비밀번호 확인
		$("#userPwd2").blur(
				function() {
					let pwd = $("#userPwd").val();
					let pwd2 = $("#userPwd2").val();
					if (pwd != pwd2) {
						$("#userPwd2").siblings('span').remove();
						$("#userPwd2").addClass('error');
						$("#userPwd2").after(
								$('<span>').html('비밀번호를 확인해 주십시오.').addClass(
										'error'));
					} else {
						$("#userPwd2").siblings('span').remove();
						$("#userPwd2").removeClass('error');
					}
				});
		//비밀번호 변경
		function pwdModify() {
			let pwd = $("#userPwd").val();
			let pwd2 = $("#userPwd2").val();
			var result = confirm('비밀번호를 변경하시겠습니까?');
			if (result) {
				if (pwd == pwd2 && pwdRule.test($("#userPwd").val())) {
					$("#pwdF").submit();
				} else {
					alert("비밀번호를 확인해 주십시오.")
				}
			}
		}
		//회원정보 변경()
		function proChange() {
			let emailTest = emailRule.test($("#userEmail").val());
			let phoneTest = phoneRule.test($("#userPhone").val());
			var result = confirm('회원정보를 변경하시겠습니까?');
			if (result) {
				console.log(phoneTest);
				console.log($("#userName").val() != '');
				console.log($("#userEmail").val() != '');
				console.log($("#userPhone").val() != '');
				console.log($("#postcode").val() != '');
				console.log($("#address").val() != '');
				console.log($("#detailAddress").val() != '');
				if (phoneTest && $("#userName").val() != ''
						&& $("#userEmail").val() != ''
						&& $("#userPhone").val() != ''
						&& $("#postcode").val() != ''
						&& $("#address").val() != ''
						&& $("#detailAddress").val() != '') {
					$("#profileForm").submit();
				} else {
					alert("변경할 정보를 확인해 주십시오.")
				}
			}
		}
		//ajax사업자번호 체크 확인
		$("#businessNumber").blur(function() {
			let flag;

			if (businessCheck()) {
				bsCheck = true;
				$("#businessCk").html("사용가능한 사업자 번호입니다.").addClass("pass");
			} else {
				$("#businessCk").removeClass("pass");
				$("#businessCk").addClass("error");
				$("#businessCk").html("존재하는 사업자 번호입니다.");
				bsCheck = false;
			}
		});

		function sellerUpdate() {
			if (bsCheck) {
				$("#seller").submit();
			}
		}
		function businessCheck() {
			$("#businessCk").html("");
			let flag;
			$.ajax({
				url : "${path}/member/checkBusiness.do",
				type : "POST",
				async : false,
				data : {
					"businessNumber" : $("#businessNumber").val()
				},
				success : function(data) {
					flag = data.flag;
				},
				error : function(request, status) {
					if (request.status == 404)
						//$("#content").append(request.status);
						alert("페이지를 찾을 수 없습니다.");
				}

			});
			return flag;
		}
	</script>
</body>
</html>
