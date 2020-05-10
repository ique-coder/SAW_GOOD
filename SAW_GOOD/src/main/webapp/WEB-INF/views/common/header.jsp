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
<style>
	a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color:  #3C5946; text-decoration: none;}
</style>
<body>
    <header class="container-fluid" id="header">
    	<div class="row">
    		<div class="col-md-3 row">
    			<div class="col-md-4"></div>
    			<a href="#" class="col-md-4">
    				<img src="${path }/resources/images/logo.png" />
    			</a>
    			<div class="col-md-4"></div>
    		</div>
    		<ul class="col-md-6 row header-style">
                <li class="col-md-3">
                    <span><a href="#" class="target">SHOW ROOM</a></span>
                </li>
                <li class="col-md-3">
                    <span><a href="#" class="target">NEW ARRIVAL</a></span>
                </li>
                <li class="col-md-3">
                    <span><a href="${path }/funding/list" class="target">FUNDING</a></span>
                </li>
                <li class="col-md-3">
                    <span><a href="#" class="target">AUCTION</a></span>
                </li>
    		</ul>
    		<ol class="col-md-3 row">
    			<li class="col-md-4"><a href="${path }/signup">sign up</a></li>
    			<li class="col-md-4"><a href="javascript:void(0)">login</a></li>
    		</ol>
    	</div>
    </header>
    <script>
    $(".target").mouseover(function(){
        $(event.target).parent("span").addClass("underline");
    })
    $(".target").mouseleave(function(){
        $(event.target).parent("span").removeClass("underline");
    })
    	$(function(){
    		$(window).scroll(function(){
                var height = $(document).scrollTop();
                if(height>=30){
                    $("#header").addClass("fixed");
                  
                }else{
                	$("#header").removeClass("fixed");
                }
    		})
            
    	})
    </script>
