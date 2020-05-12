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
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
                    <a href="#" class="target"><span>SHOW ROOM</span></a>
                </li>
                <li class="col-md-3">
                    <a href="${path }/product/detail" class="target"><span>NEW ARRIVAL</span></a>
                </li>
                <li class="col-md-3">
                    <a href="${path }/funding/list" class="target"><span>FUNDING</span></a>
                </li>
                <li class="col-md-3">
                    <a href="#" class="target"><span>AUCTION</span></a>
                </li>
    		</ul>
    		<ol class="col-md-3 row">
    			<li class="col-md-4"><a href="${path }/signup">sign up</a></li>
    			<li class="col-md-4"><a href="javascript:void(0)">login</a></li>
    		</ol>
    	</div>
    	<div class="container-fluid modal_container" id="modal_container">
        	<div class="my_modal">
	            <h5>로그인</h5>
	            <p>로그인 하시려면 이메일과 비밀번호를 입력하세요</p>
	            <span class="login_Xbutton" onclick="closeLogin();">x</span>
	            <form id="login" onsubmit="return fn_login_validate();" method="post">
	                <input id="userId" type="text" name="id" placeholder="id">
	                <input id="password" type="password" name="password" placeholder="password">
	                <div style="margin-bottom: 16px;">
	                    <label class="saveId"><input type="checkbox" name="saveId" id="saveId" value="saveId">아이디저장</label>
	                    <label><input type="checkbox" name="autoLogin" id="autoLogin" value="autoLogin">자동로그인</label>
	                </div>
	                <div style="text-align: left;">
	                    <a href="#">아이디 / 비밀번호 찾기</a>
	                </div>
	                <button type="submit" id="buttonLogin">로그인</button>
	            </form>
	            <button type="button" id="buttonJoin">회원가입</button>
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
        	$("#header ol li:last a").click(function(){
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
            })
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
        
    	
    </script>
