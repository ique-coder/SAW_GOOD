<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/common/base.css"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/login/login.css"/>
<link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;1,100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${path }/resources/js/parallax.min.js"></script>
</head>
<style>
   a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color:  #3C5946; text-decoration: none;}
</style>
<body>
    <header class="container-fluid fixed-show">
       <div class="row " id="header">
          <div class="col-md-3"href="#">
             <a href="#" class="col-md-6"><img id="logo" src="" alt="로고"/></a>
          </div>
          <ul class="col-md-6 row text-design">
                <li class="col-md-3 ">
                    <a href="${path }/furniture/furniture.do?userId=${loginMember.userId!=null?loginMember.userId:''}" class="target"><span>SHOW ROOM</span></a>
                </li>
                <li class="col-md-3">
                    <a href="${path }/product/productList" class="target"><span>NEW ARRIVAL</span></a>
                </li>
                <li class="col-md-3">
                    <a href="${path }/funding/list" class="target"><span>FUNDING</span></a>
                </li>
                <li class="col-md-3">
                    <a href="${path }/auction/list" class="target"><span>AUCTION</span></a>
                </li>
          </ul>
          <c:if test="${empty loginMember }">
	          <ol class="col-md-3 row">
	             <li class="col-md-4"><a href="${path }/signup">sign up</a></li>
	             <li class="col-md-4"><a href="javascript:void(0)" id="login">login</a></li>
	          </ol>
          </c:if>
          <c:if test="${not empty loginMember }">
          	  <ol class="col-md-3 row">
	             <li class="col-md-3"><a href="${path }/signup">my page</a></li>
	             <li class="col-md-3"><a href="${path }//member/info.do">my Info</a></li>
	             <li class="col-md-3"><a href="${path }/payment/cart">cart</a></li>
	             <li class="col-md-3"><a href="${path }/member/logout">logout</a></li>
	          </ol>
          </c:if>
       </div>
       <div class="container-fluid modal_container" id="modal_container">
        	<div class="my_modal">
	            <h5>로그인</h5>
	            <p>로그인 하시려면 이메일과 비밀번호를 입력하세요</p>
	            <span class="login_Xbutton" onclick="closeLogin();">x</span>
	            <form action="${path }/member/memberLogin" id="login" onsubmit="return fn_login_validate();" method="post">
	                <input id="userId" type="text" name="userId" placeholder="id">
	                <input id="password" type="password" name="password" placeholder="password">
	                <div style="margin-bottom: 16px;">
	                    <label class="saveId"><input type="checkbox" name="saveId" id="saveId" value="saveId">아이디저장</label>
	                </div>
	                <div style="text-align: left; clear:both;">
	                    <a href="${path }/search/searchForm">아이디 / 비밀번호 찾기</a>
	                </div>
	                <button type="submit" id="buttonLogin">로그인</button>
	            </form>
	            <button type="button" id="buttonJoin" onclick="location.href='${path}/signup'">회원가입</button>
	            
	        </div>
	    </div>
    </header>
    <script>
        $(".target>span").mouseover(function(){
            $(event.target).addClass("underline");
        })
        $(".target>span").mouseleave(function(){
            $(event.target).removeClass("underline");
        })
        
        $(function(){
           var didScroll;
           $(window).scroll(function(event){
              didScroll=true;
           })
           
           setInterval(function(){
              if(didScroll){
                 hasScrolled();
                 didScroll=false;
              }
           },250);
           
           var lastScrollTop =0;
           var delta = 5;
           var navbarHeight=$("header.container-fluid").outerHeight();
           
           function hasScrolled(){
               var st = $(this).scrollTop();
                   if(Math.abs(lastScrollTop-st)<-delta) return;
                   if(st>lastScrollTop && st> navbarHeight){
                      $("header.container-fluid").addClass("fixed-hide").removeClass("fixed-show");
                   }else{
                      if(st+$(window).height()<$(document).height()){
                         $("header.container-fluid").removeClass("fixed-hide").addClass("fixed-show");
                      }
                   }
                lastScrollTop = st;
           }
           $("#header ol li:last a#login").click(function(){
               var v=document.getElementById("modal_container");
               // v.style.transitionDelay="background-color 0.8s";
               $(".modal_container").css({
                   right:"0",
                   "z-index":"9998",
                   backgroundColor:"rgba(0,0,0,0.5)"
               });
               $("section").removeAttr("style");
               $("#userId").focus();
               $(".modal_container").show(800);
           });
           $("#autoLogin").click(function(){
               if($("input[id='autoLogin']").is(":checked")){
                   $("input:checkbox[id='saveId']").prop("checked",false);
               }
           })
           $("#saveId").click(function(){
               if($("input[id='autoLogin']").is(":checked")){
                   $("input:checkbox[id='autoLogin']").prop("checked",false);
               }
           })
        })
      	
	      	function closeLogin(){
	           var v=document.getElementById("modal_container");
	           v.style.right='-400px';
	           v.style.transition="right 0.8s ease-out, z-index 0.8s";
	           v.style.zIndex="-1";
	           $("#userId").val("");
	           $("#password").val("");
	           $("input[type='checkbox']").prop("checked",false);
	           $(".modal_container").css("backgroundColor", "");
	           $(".modal_container").delay(800).hide(0);
	       }
        $(function(){

        	// 쿠키값을 가져온다.
        	var cookie_user_id = getLogin();

        	/**

        	* 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤

        	* 체크박스를 체크상태로 변경

        	*/

        	if(cookie_user_id != "") {
	        	$("#userId").val(cookie_user_id);
	        	$("#saveId").attr("checked", true);
        	}

        	// 아이디 저장 체크시
        	$("#saveId").on("click", function(){
	        	var _this = this;
	        	var isRemember;

	        	if($(this).is(":checked")) {
        			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

        					

        	if(!isRemember)    
        		$(this).attr("checked", false);

        		}
        	});



        	// 로그인 버튼 클릭시
        	$("#buttonLogin").on("click", function(){

        		if($("#saveId").is(":checked")){ // 저장 체크시
        			saveLogin($("#userId").val());
        		}else{ // 체크 해제시는 공백
        			saveLogin("");
        		}
        	});
        });



        	/**

        	* saveLogin

        	* 로그인 정보 저장

        	* @param id

        	*/

        	function saveLogin(id) {
        		if(id != "") {
        		// userid 쿠키에 id 값을 7일간 저장
	        	setSave("userId", id, 7);
	        	}else{
	        	// userid 쿠키 삭제
	        	setSave("userId", id, -1);
        		}
        	}



        	/**

        	* setSave

        	* Cookie에 user_id를 저장

        	* @param name

        	* @param value

        	* @param expiredays

        	*/

        	function setSave(name, value, expiredays) {

        		var today = new Date();
        		today.setDate( today.getDate() + expiredays );
        		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
        	}



        	/**

        	* getLogin

        	* 쿠키값을 가져온다.

        	* @returns {String}

        	*/

        	function getLogin() {

	        	// userid 쿠키에서 id 값을 가져온다.
	        	var cook = document.cookie + ";";
	        	var idx = cook.indexOf("userId", 0);
	        	var val = "";

	        	if(idx != -1) {
		        	cook = cook.substring(idx, cook.length);
		        	begin = cook.indexOf("=", 0) + 1;
		        	end = cook.indexOf(";", begin);
		        	val = unescape(cook.substring(begin, end));
	        	}
        	return val;
        	}
        	function fn_login_validate(){
        		
        	}
        
       
    </script>