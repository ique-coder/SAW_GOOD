<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;1,100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&family=Noto+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

	<!-- 다음주소 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="${path }/resources/js/jquery-3.4.1.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <%-- <script src="${path }/resources/js/bootstrap-grid.min.css"></script> --%>
    
    <title>Document</title>
	<link rel="stylesheet" href="${path }/resources/css/signup.css"/>
	
</head>
<body>
<div id="container" class="row col-md-12">
<form action="${path }/member/signup.do" method="post" >
        <section>
            <div id="pic-container" class="row col-md-12">
                <div class="col-md-6">
                    <div id="content-container">
                        <div id="content1">
                            <div>
                                <h3>Sign up</h3>
                                <p>당신을 위한 자리가 준비되어 있습니다.</p>
                            </div>
                        	
                            <table>
                                <tr>
                                    <th>아이디 ID<span id="validation_id"></span></th>
                                </tr>
                                <tr>
                                    <td><input id="userId" type="text" name="userId" class="inputStyle" placeholder="아이디 입력"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호 PASSWORD<span id="validation_pw"></span></th>
                                </tr>
                                <tr>
                                    <td><input type="password" id="pwd" name="password" maxlength="16" placeholder="비밀번호" class="inputStyle"  minlength="8"maxlength="16"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호 확인
                                    	<span id="validation_pw2" class="warn-text">정확하게 입력해주세요.</span>
                                    </th>
                                </tr>
                                <tr>
                                    <td><input type="password" id="chk-pwd" name="chk-password" maxlength="16" placeholder="비밀번호 확인" class="inputStyle"  minlength="8"maxlength="16"></td>
                                </tr>
                                <tr>
                                    <th>이메일 Email<span id="validation_email"></span></th>
                                </tr>
                                <tr>
                                    <td>
                                    <input type="text" id="email1" class="inputStyle" name="email1"  placeholder="example" style="width: 22%;">
                                    <span class="txt_email">@</span>
                                    <input type="text" id="email2" class="inputStyle" name="email2" placeholder="직접 입력" class="mail_domain" style="width: 22%;">
                                    <input type="hidden" name="email" />
                                    <select id="emailSelect" title="select color"  onchange="selectEmail();" class="selectStyle">
                                        <option value="write" >직접 입력</option>
                                        <option value="1">naver.com</option>
                                        <option value="2">gmail.com</option>
                                        <option value="3">hanmail.net</option>
                                        <option value="4">nate.com</option>
                                    </select>
                                    <input type="hidden" name="email" id="email">
                                    
                                   
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button class="submit-btn" type="button" id="nextBtn">Next</button>
                                        <button class="login-btn" type="button">login</button>
                                    </td>
                                </tr> 
                            </table>
                        </div>
                        <!-- content1끝 -->
                    </div>
                </div>
                <!-- col-md-6 끝 -->
                <div class="col-md-6">
                    
                </div>
            </div>
            <!-- pic-container끝 -->
        </section>
        <section>
            <div id="pic-container2" class="row col-md-12">
                <div class="col-md-6">
                    <div id="content-container2">
                        <div id="content2">
                            <div>
                                <h3>Sign up</h3>
                                <p>거의 다 되었습니다!</p>
                            </div>
                        
                            <table>
                                <tr>
                                    <th>이름 Name<span id="checkName" class="warn-text">정확하게 입력해 주세요.</span></th>
                                    </tr>
                                <tr>
                                    <td><input id="" type="text" name="userName" class="inputStyle" placeholder="아이디 입력"></td>
                                </tr>
                                <tr>
                                    <th>전화번호 Phone<span id="checkPhone" class="warn-text">정확한 번호를 입력해주세요.</span></th>
                                </tr>
                                <tr>
                                    <td id="phone-td">
                                        <span>
                                            <select id="selectNum" name="phone1" class="selectStyle">
                                                <option selected>010</option>
                                                <option>011</option>
                                                <option>016</option>
                                                <option>017</option>
                                                <option>019</option>
                                                <option>070</option>
                                            </select>
                                        </span>
                                        <span class="phone_num">
                                            <input type="text" class="inputStyle" name="phone2" minlength=3 maxlength=4 id="phone2">
                                        </span>
                                        <span class="phone_num">
                                            <input type="text" class="inputStyle" name="phone3" minlength=4 maxlength=4 id="phone3">
                                        </span>
                                        <input type="hidden" name="phone" id="phone"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소 Address<span id="checkAddr"></span></th>
                                </tr>
                                <tr>
                                    <td id="address-td">
                                        <input type="text" id="sample6_postcode" placeholder="우편번호" class="inputStyle postcode" name="postCode" onclick="sample6_execDaumPostcode()">
                                        <button type="button" onclick="sample6_execDaumPostcode()" id="btn-Addr">주소 검색</button><br>
                                        
                                        <input type="text" id="sample6_address" placeholder="주소" class="inputStyle searchAddrUnder" name="address1" onclick="sample6_execDaumPostcode()">
                                        <br>
                                        <input type="text" id="sample6_detailAddress" placeholder="상세주소"class="inputStyle searchAddrUnder" name="address2">
                                        <span id="guide" style="color:#999"></span>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td>
                                        <button class="login-btn" type="button" onclick="previous();">Previous</button>
                                        <button class="submit-btn" type="button" id="submit-btn">Sign Up</button>
                                    </td>
                                </tr>
                            </table>
                        
                        </div>
                        <!-- content2끝 -->
                    </div>
                </div>
                <div class="col-md-6">
                   
                </div>
            </div>
        </section>
    </form>
    </div>
    
    <script>
    	function idCheck(){
    		$("#validation_id").html("");
    		let flag;
    		$.ajax({
    			url:"${path}/signup/checkId.do",
    			type:"POST",
    			async:false,
    			data:{"userId":$("#userId").val()},
    			success:function(data){
    				
    				flag=data.flag;
    				
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
    <script src="${path }/resources/js/signup.js"></script>
    </body>
</html>
