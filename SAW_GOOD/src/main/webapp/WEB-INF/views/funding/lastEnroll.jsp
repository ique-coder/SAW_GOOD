<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>

<link rel="stylesheet" href="${path }/resources/css/funding/lastEnroll.css?ver=6"/>
<div class="container-fluid col-md-12" id="detail-header">
	<c:if test="${empty img }">
    <div class="bg-image" style="background-image: url(${path}/resources/images/signup2.jpg);"></div>
    </c:if>
    <c:if test="${not empty img }">
    <div class="bg-image" style="background-image:  url(${path}/resources/images/funding/${img[0].subImg });"></div>
   
    </c:if>
    
    <i>
        <c:out value="${f.category }"/>
    </i>
    <h1>${f.title }</h1> 
</div>

	<form action="${path }/funding/enroll/modifyEnd" method="post" enctype="multipart/form-data" id="enroll"> 
	<section>
         <div class="container">
            <div class="col-md-12">
                <section class="row first-row">
                    <div class="col-md-7 img-container" style="height:100%;">
                    	<input type="hidden" name="fdNo" value="${f.fdNo }"/>
                    	<input type="hidden" name="userId" value="${f.userId }"/>
                        <img src="${path }/resources/images/funding/${f.mainImg}"
                         class="images col-md-12" style="height: 700px;" id="main"/> 
                        
                         <div class="col-md-12 row" style="height:100px; margin:0;">
                          <c:if test="${not empty img }">
                         	<c:forEach items="${img }" varStatus='status' var="item">
	                         	<img class="col-md-3 images" src="${path }/resources/images/funding/${item.subImg}"
	                         	id="sub${status.index}"/>
	                         	<input type="hidden" name="sub" value="${item.subImg }"/>
                         	</c:forEach>
                          </c:if>
                         
                         
                         <c:if test ='${empty img }'>
                         	<img class="col-md-3 images" src="" 
                         	id="sub0"/>
                         	<img class="col-md-3 images"src=""
                         	id="sub1" />
                         	<img class="col-md-3 images"src="" 
                         	id="sub2"/>
                         	<img class="col-md-3 images"src="" id="sub3"/>
                         	</c:if>
                         
                         </div>
                    </div>
                    <div id="p-table" class="col-md-5" style="height: 100%;">
                        <caption>
                            <h5>
	                        	등록하시면 바로 노출됩니다.
                            </h5>
                        </caption>
                        <table id= "item-info">
                         
                            <thead>
                                <tr>
                                    <th>DESIGNER / BRAND</th>
                                    <th>${f.designer }</th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                            	
                                <tr>
                                    <td>목표금액<i>(단위: 원)</i></td>
                                    <td>
	                                    <p>
	                                    	<fmt:formatNumber type="number" value="${f.targetPrice }"/>
	                                    </p>
	                                  </td>
                                </tr>
                               <tr>
                                   <td id="style">상품 설명</td>
                                    <td>${f.subContent }</td>
                                </tr>
                                <tr>
                                   
                                </tr>
                                
                                 <tr>
                                 	<td>종료일자 </td>
                                 	<td>
                                 		<fmt:formatDate type="date" value="${ f.endDate}"/>
                                 	</td>
                                 	
                                </tr>
                            
                            </tbody>
                             <tbody id="reword-container">
                           		 <tr>
                           			 <th>
                                    	리워드
                                    </th>
                                    <th>
                                       참여가격
                                    </th>
                                    
                                </tr>
                                <tr>
                                	 <th>
                                    	ex)테이블1
                                    </th>
                                    <th>
                                       ex)200000
                                    </th>
                                    
                                </tr>
                            	 <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                               
	                        </tbody>
	                         <tfoot>
                          		<tr>
                          			<td colspan="2">
                          				<button type="button" onclick="addRow()">reword추가하기</button>
                          				<button type="button" onclick="removeRow()">reword삭제하기</button>
                          			</td>
                          		<tr>
                            
                              
                            </tfoot> 
                          
                        </table>

                    </div>
                </section>
                <ul class="detail row">
                    <li class="col-md-12"><span class="underline" >상세정보 입력</span></li>
                    
                </ul>
                <div id="item-detail-info"class="row">
                	<div class="col-md-6">
                	
                	<table>
                		<thead>
	                		<tr>
	                			<td colspan="2" >치수 입력하기</td>
	                			
	                		</tr>
                		</thead>
                		<tbody id="size-container">
	                		<tr>
	                			<th>제품</th>
	                			<td>가로 x 세로 x 높이 (cm)</td>
	                		</tr>
	                		<tr>
	                			<th>ex)테이블</th>
	                			<td>120 x 60 x 100</td>
	                		</tr>
	                		 <tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text" class="size" name="size"></td>
	                			 
	                		</tr>
	                		
                		</tbody>
                		<tfoot>
                			<tr>
                				<th colspan="2">
                					<button type="button" onclick="addSize()">추가하기</button>
                					<button type="button" onclick="removeSize()">삭제하기</button>
                				</th>
                			</tr>
                		</tfoot> 
                	</table>
                	</div>
                	<div class="col-md-6">
                	<table >
                		<tr>
                			<td> 디테일 정보</td>
                			
                		</tr>
                		<tr>
                			<td>
                				<p>${f.detail }</p>
                			</td>
                		</tr>
                		
                	</table>
                	</div>
                </div>
            
            
        	</div>
        	<div class="col-md-12 end">
        		<button type="button" class="col-md-3" onclick="enroll()">
        			등록하기
        		</button>
        	</div>
		</div>
    </section> 
    </form>
    <script>
function addRow(){
	$("#reword-container").append('<tr class="addRow"><td><input type="text" class="inputStyle" name="reword"></td>'
       +'<td><input type="text" class="inputStyle" name="partPrice"></td></tr>');
       
}
function addSize(){
	$("#size-container").append('<tr class="addSize"><th><input type="text" name="item"></th>'
			+'<td><input type="text" class="size" name="size"></td></tr>');

}
function removeRow(){
	$("#reword-container").children("tr[class='addRow']").last().remove();
}

function removeSize(){
	$("#size-container").find("tr[class='addSize']").last().remove();
}


let checkCount = 0;
function enroll(){
	
	var reword = $("input[name='reword']");
	if(reword.length>0){
		
		$.each(reword,function(){
			if(checkCount == 1) {
				
			} else if($(this).val() == null || $(this).val() == ''){
				alert("리워드를 입력해주세요.");
				checkCount++;
			}
		})
		checkCount = 0;
	}else{
		alert("리워드를 1개이상 입력해주세요");
	}
	
	var partPrice = $("input[name='partPrice']");
	if(partPrice.length>0){
		$.each(partPrice,function(){
			if(checkCount == 1) {
				
			} else if($(this).val() == null || $(this).val() == ''){
				alert("리워드에 대한 가격을 입력해주세요.");
				checkCount++;
			}
		})
		checkCount = 0;
	}else{
		alert("가격을 1개이상 입력해주세요");
	}
	
	var item = $("input[name='item']");
	
	
	var size = $("input[name='size']");
	
	
	
	
	
	
	
	
	
	
	
}
    
    </script>
  	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>