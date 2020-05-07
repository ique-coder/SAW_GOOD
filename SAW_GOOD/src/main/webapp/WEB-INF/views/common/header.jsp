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
<link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;1,100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,400;0,700;1,400;1,700&family=News+Cycle:wght@400;700&family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

</head>
<body>
    <header>
        <div class="container-fluid" style="background-color: lightgray; padding: 10px 0;">
            <div class="container" style="padding: 0;">
                <ul class="top_menu1">
                    <li><a href="#">로그인</a></li>
                    <li><a href="${path }/signup">회원가입</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>
            </div>
        </div>
        <div class="container-fluid top_menu2">
            <div class="container">
                <div class="row">
                    <div class="col-md-2" style="margin-bottom: 15px;">
                        <img src="http://placehold.it/150x70">
                    </div>
                    <div class="col-md-10" style="padding-left: 0; padding-right: 0;">
                        <nav>
                            <ul class="top_menu3">
                                <li><a href="#">가구배치</a></li>
                                <li>
                                    <a href="#">새상품</a>
                                    <div class="sub_menu">
                                        <ul class="sub_menu2">
                                            <li><a href="#">테스트1</a></li>
                                            <li><a href="#">테스트2</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href="#">중고</a></li>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">1:1문의</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <script>
    	$(function(){
    		$(window).scroll(function(){
                var height = $(document).scrollTop();
                if(height>=36){
                    $(".top_menu2").attr({
                        style:"top: 0px"
                    });
                    $(".top_menu2").css("margin-top", "15px");
                }else{
                    $(".top_menu2").removeAttr("style");
                }
    		})
            
    	})
    </script>
