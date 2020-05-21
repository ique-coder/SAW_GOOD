<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="" name=""/>
	</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/funding/enroll.css?ver=6"/>

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
                         <input type="hidden" name = "main" value="${f.mainImg}"/>
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
	                        	정보 입력
                            </h5>
                        </caption>
                        <table id= "item-info">
                         
                            <thead>
                                <tr>
                                    <th>TITLE</th>
                                    <th><input type="text" id="title" class="inputStyle"
                                        name="title" placeholder="제목 12자 이하 " value="${f.title }"></th>
                                </tr>
                            </thead>
                            <tbody id="main-info">
                            	<tr>
                                    <th>DESIGNER / BRAND</th>
                                    <th><input type="text" id="designer" class="inputStyle"
                                        name="designer" placeholder="디자이너 혹은 브랜드 입력" value="${f.designer }"></th>
                                </tr>
                                <tr>
                                    <td>목표금액<i>(단위: 원)</i></td>
                                    <td>
	                                    <p>
	                                    	<input type="text" id="targetPrice" class="inputStyle"
                                        name="targetPrice" placeholder="숫자만 입력" value="${f.targetPrice }">
	                                    </p>
	                                  </td>
                                </tr>
                               <tr>
                                   <td id="style">상품 설명</td>
                                    <td><textarea cols="20" rows="7" name="subContent" placeholder="130자 이내" id="subContent" >${f.subContent }</textarea></td>
                                </tr>
                                <tr>
                                    <td>CATEGORY</td> 
                                    <td><p><select name="category" class="inputStyle">
                                            <option value="bed" <c:if test="${f.category =='bed' }">selected</c:if>>침대</option>
                                            <option value="sofa"<c:if test="${f.category =='sofa' }">selected</c:if>>소파</option>
                                            <option value="chair" <c:if test="${f.category =='chair' }">selected</c:if>>의자</option>
                                            <option value="table" <c:if test="${f.category =='table' }">selected</c:if>>테이블</option>
                                            <option value="desk" <c:if test="${f.category =='desk' }">selected</c:if>>책상</option>
                                            <option value="lug" <c:if test="${f.category =='lug' }">selected</c:if>>카펫 / 러그</option>
                                            <option value="storage" <c:if test="${f.category =='storage' }">selected</c:if>>서랍 / 수납함</option>
                                            <option value="others"<c:if test="${f.category =='others' }">selected</c:if>>기타</option>
                                        </select></p></td> 
                                </tr>
                                
                                 <tr>
                                 	<td>종료일자 </td>
                                 	<td>
                                 		<fmt:formatDate type="date" value="${ f.endDate}"/>
                                 	</td>
                                 	
                                </tr>
                                <tr>
                                 	<td>변경하기</td>
                                 	<td>
                                 		<input type="date" name="finalDate" id="endDate"/>
                                 	</td>
                                 	
                                </tr>
                            </tbody>
                           <!--  <tbody id="reword-container">
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
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="inputStyle" name="reword">
                                    </td>
                                    <td>
                                    	<input type="text" class="inputStyle" name="partPrice">
                                    </td>
                                    
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
                          			</td>
                          		<tr>
                            
                              
                            </tfoot> 
                           -->
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
                				<td colspan="2" >사진 등록하기</td>
                			</tr>
                			  <tr>
                				<th>
                				메인 사진 추가하기 
                				</th>
                				<td>
                					<input  type="file"  name="mainPic" id ="mainPic" onchange="imagePreview(event);" accept="image/*" value="">
                				</td>
                			
                			</tr> 
                			<tr>
                				<th>
                				제품 사진 추가하기 (4장)
                				</th>
                				<td>
                					<input  type="file" name="subPic" onchange="imagePreviewArr(event);" accept="image/*" multiple id="subPic">
                				</td>
                			</tr> 
                		</thead>
                		<!-- <thead>
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
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                			 
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
	                		<tr>
	                			<th><input type="text" name="item"></th>
	                			<td><input type="text"  name="size" placeholder="형식에 맞게 적어주세요"></td>
	                		</tr>
                		</tbody> -->
                		<!-- <tfoot>
                			<tr>
                				<td colspan="2"><button type="button" onclick="addSize()">추가하기</button></td>
                			</tr>
                		</tfoot> -->
                	</table>
                	</div>
                	<div class="col-md-6">
                	<table >
                		<tr>
                			<td> 디테일 정보</td>
                			
                		</tr>
                		<tr>
                			<td>
                				<p><textarea cols="60" rows="12" name="detail">${f.detail }</textarea></p>
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
  	<script src="${path }/resources/js/funding/updateFunding.js"></script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>