   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <c:set var="path" value="${pageContext.request.contextPath}"/>
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <link rel="stylesheet" type="text/css" href="${path }/resources/css/product/searchForm.css"/>
    <section>
        <div class="container-fluid">
            <div class="container">
                <div id="findWrap">
                    <form id="searchForm" name="searchForm" method="post">
                        <div id="find_id" class="find_idpw">
                            <h1 class="find_tit">아이디 찾기</h1>
                            <p class="sub_tit">
                                회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.
                            </p>
                            <ul class="frm_list">
                                <li>
                                    <input type="text" id="name" name="name" placeholder="NAME">
                                </li>
                                <li>
                                    <input type="email" id="email" name="email" placeholder="EMAIL">
                                </li>
                            </ul>
                            <div class="btn_area">
                                <a class="css_a" href="javascript:find_type('id')">아이디 찾기</a>
                            </div>
                        </div>
                        <div id="find_pw" class="find_idpw">
                            <h1 class="find_tit">임시 비밀번호 발급</h1>
                            <p class="sub_tit">
                                가입하신 아이디+이메일을 입력, 본인인증을 통해 이메일<br>
                                로 임시 비밀번호를 보내드립니다.<br>
                                확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다.
                            </p>
                            <ul class="frm_list">
                                <li>
                                    <input type="text" id="userId" name="userId" placeholder="ID">
                                </li>
                                <li>
                                    <input type="email" id="email1" name="email1" placeholder="EMAIL">
                                </li>
                            </ul>
                            <div class="btn_area">
                                <a class="css_a" href="javascript:find_type('pw')">임시 비밀번호 발급</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <script>
        function find_type(type){
            if(type == 'id'){
                var form = document.getElementById("searchForm");
                //form.action = "${path}/find/findId";
                //form.submit();
                $.ajax({
	    		url:"${path}/find/findId",
	    		type:"post",
				dataType:"json",
				data:{"userName":$("#name").val(),
					  "email":$("#email").val()},
				success:function(data){
					console.log(data);
					if(!data.flag){
						alert("등록된 회원이 존재하지 않습니다.");
						return false;
					}
					var span = "<span class='search-result'>아이디 찾기가 완료 되었습니다.</span>";
					var div = "<div class='search-id'>아이디 : "+data.member.userId+"</div>"
					$("#findWrap").html("");
					$("#findWrap").append($("<div style='text-align:center; width:100%;'>").append(span).append(div));
					
				}
	    	})
            }else if(type == 'pw'){
                var form = document.getElementById("searchForm");
                $.ajax({
    	    		url:"${path}/find/findPw",
    	    		type:"post",
    				dataType:"json",
    				data:{"userId":$("#userId").val(),
    					  "email":$("#email1").val()},
    				success:function(data){
    					console.log(data);
    					if(!data.flag){
    						alert("등록된 회원이 존재하지 않습니다.");
    						return false;
    					}else{    						
	    					var span = "<span class='search-result'>"+data.member.userId+"님의 임시 비밀번호를</span>";
	    					var div = "<div class='search-id'>"+data.email+"로 보내드렸습니다.</div>"
	    					$("#findWrap").html("");
	    					$("#findWrap").append($("<div style='text-align:center; width:100%;'>").append(span).append(div));
    					}
    					
    				}
            	})
            }
        }
        
    </script>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>