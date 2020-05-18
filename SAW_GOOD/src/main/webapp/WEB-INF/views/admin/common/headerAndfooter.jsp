<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html lang="en">

<head>
<title>Sidebar 03</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://kit.fontawesome.com/3299fcc8f1.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path }/resources/css/admin/style.css?ver=9">

<!-- IonIcons -->
<link rel="stylesheet"
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${path }/resources/css/admin/adminlte.min.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- bxslider -->
	
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- chart.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
/* 기본설정 및 사이드바 */
html {
	height: 100%;
}

body {
	height: 100%;
	overflow-x: hidden;
}

div.submenu {
	display: none;
}

nav#sidebar {
	min-height: 100%;
	position: relative;
}

/* 푸터 설정 */
div.p-4 {
	padding-bottom: 50px;
}

div.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
}
</style>

</head>

<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="active">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
					<i class="fa fa-bars"></i> <span class="sr-only">Toggle Menu</span>
				</button>
			</div>
			<div class="p-4">
				<h1>
					<a href="#" class="logo">Saw Good</a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li class="menu"><a href="${path }/admin"><span
							class="fa fa-chart-bar mr-3"></span>DashBoard</a></li>
					<div></div>
					<li class="menu"><a href="${path }/admin/fundingDisAgreeList"><span
							class="fa-hourglass  mr-3"></span> funding</a></li>
					<div></div>
					<li class="menu"><a href="${path }/admin/auction"><span class="fa fa-font mr-3"></span>
							Auction</a></li>
					<div></div>
					<li class="menu"><a href="#"><span
							class="fa fa-couch mr-3"></span> Product</a></li>
					<div class="submenu">
						<ul>
							<li class="activemenu"><a href="${path }/admin/productRegist">ProductRegist</a></li>
							<li class="activemenu"><a href="${path }/admin/productManager">ProductManager</a></li>
						</ul>
					</div>
					<li class="menu"><a href="#"><span
							class="fa fa-users mr-3"></span> Member</a></li>
					<div class="submenu">
						<ul>
							<li class="activemenu"><a href="${path }/admin/memberStatus">MemberStatus</a></li>
							<li class="activemenu"><a href="${path }/admin/memberManager">MemberManager</a></li>
						</ul>
					</div>
				</ul>
			</div>
			<script>
				$(".menu").click(function() {
					$(".menu").next().not($(this).next()).slideUp();
					$(this).next().slideToggle();
					$(this).addClass("active");
					$(".menu").not($(this)).removeClass("active");
				})
				$(".activemenu").click(function() {
					$(this).addClass("active");
					$(".activemenu").not($(this)).removeClass("active");
				})
			</script>
			<div class="footer">
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib.com</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</nav>
		<script src="${path }/resources/js/main.js"></script>