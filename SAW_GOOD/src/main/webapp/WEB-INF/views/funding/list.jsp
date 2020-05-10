<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/funding/list.css"/>

<section id="section">
	<div class="container padding">
            <div class="row">
                <div class="col-md-2">
                    <!-- 서브네비게이션 바 -->
                    <ul class="category">          
                        <li><a href="#">bed</a></li>
                        <li><a href="#">couch / chair</a></li>
                        <li><a href="#">light</a></li>
                        <li><a href="#">table / desk</a></li>
                        <li><a href="#">carpet / lug</a></li>
                        <li><a href="#">storage</a></li>
                        <li><a href="#">others</a></li>
                    </ul>
                    <!-- 검색기능 -->
                    <span class="block-span">
                        <input type="text" />
                        <button>
                            <img src="${path }/resources/images/search-icon.png" width="20px" height="18px"/>
                        </button>
                    </span>
                </div>
                
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-6" id="main-container">
                            <div id="main" class="main product-container">
                                <a href="${path }/funding/detail" >
                                    <img src="${path }/resources/images/signup.jpg" class="images" />
                                    <h1 class="text-deco text-position" >
                                        Title and sub
                                    </h1>
                                    <p class="sub">
                                        Company or Designer
                                    </p>
                                    <h5 class="text-position">
                                        설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명
                                    </h5>
                                    <svg width="80%" height="3px" xmlns="http://w3.org/2000/svg" version="1.1" class="bar-container">
                                        <rect x="0" y="0" width="50%" height="3px" class="bar"/>
                                    </svg>
                                    <i><img></i>
                                    <span><b>27</b>일 남음</span>
                                    <span><b>1,203,400</b>원</span>
                                    <span><b>200</b>%</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 sub-container">
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                           
                        </div>
                        <div class="col-md-3 sub-container">
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                            <div class="test2" ></div>
                            <div class="test2"></div>
                          
                        </div>
                        
                    </div>
                </div>
            </div>
            
        </div>
    </section>
    
    
    <script>
            var main_offset = $("#main").offset(),
                parent = $("#main").parent(),
                position = $("#main").position(),
                scrollTop = $("#main").scrollTop();
        $(window).scroll(function(){
                var bottom = parent.offset().top+parent.height();
               
            if($(window).scrollTop()>=main_offset.top){
                parentSize();
                $("#main").addClass("wrapper");
                $("#main").removeClass("attachBottom");
                if($("#main").height()>=bottom-$(window).scrollTop()){
                    $("#main").removeClass("wrapper");
                    $("#main").addClass("attachBottom");
                }
            }else{
                $("#main").removeClass("wrapper");
            }
        })
        function parentSize(){
           var pWidth = $("#main").parent().width();
           var pHeight = $("#main").parent().height()/2;
            $("#main").width(pWidth);
            $("#main").height(pHeight);
        }
       
    
    </script>
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>