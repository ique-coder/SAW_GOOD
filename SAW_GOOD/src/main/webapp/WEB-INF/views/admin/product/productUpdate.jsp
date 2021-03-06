<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/admin/common/headerAndfooter.jsp"/>

<style>
/* 섹션부분 */
        #titeltwo{
            padding-bottom:30px;
        }
        #product-tbl{
            border-top:1px solid black;
            width:100%;
        }
        #product-tbl tr td{
            border-bottom:1px solid black;
            padding: 15px 0;
        }
        #product-tbl tr th{
            border-bottom:1px solid black;
            padding: 15px 0;
        }
        #text{
            width:80%;
            height:100%;
            resize: none;
        }
        /* 버튼 */
        /* 버튼 */
.btn-white {
	width:80px;
	line-height: 30px;
	font-size: 15px;
	color: skyblue;
	text-align: center;
	background-color: white;
	border: 1px solid skyblue;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;

}
.btn-white:hover {
	width:80px;
	line-height: 30px;
	font-size: 15px;
	color: white;
	text-align: center;
	background-color: skyblue;
	border: 1px solid skyblue;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px;
}
        .preViewImg{
        	width:100px;
        	height:100px;
        }
</style>
<!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        <h2 id="titeltwo">Product Update</h2>
        <div class="container-fluid">
        <form action="${path }/admin/productUpdateEnd" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="productno" value="${product.productNo }"/>
            <table id="product-tbl" class="table-responsive-md">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tr>
                    <th>상품이름</th>
                    <td><input type="text" name="productName" value="${product.productName }" required></td>
                </tr>
                <tr>
                    <th>상품가격</th>
                    <td><input type="number" name="productPrice" value="${product.productPrice }" required><span>원</span></td>
                </tr>
                <tr>
                    <th>상품정보</th>
                    <td><textarea id="text" name="productContent">${product.productContent }</textarea></td>
                </tr>
                <tr>
                    <th>가구별 카테고리</th>
                    <td>
                        <select id="category" name="category" style="width:100px">
                            <option value="bed" ${product.category=='bed'?"selected":""}>bed</option>
                            <option value="sofa" ${product.category=='sofa'?"selected":""}>sofa</option>
                            <option value="chair" ${product.category=='chair'?"selected":""}>chair</option>
                            <option value="light" ${product.category=='light'?"selected":""}>light</option>
                            <option value="table" ${product.category=='table'?"selected":""}>table</option>
                            <option value="desk" ${product.category=='desk'?"selected":""}>desk</option>
                            <option value="carpet" ${product.category=='carpet'?"selected":""}>carpet</option>
                            <option value="lug" ${product.category=='lug'?"selected":""}>lug</option>
                            <option value="storage" ${product.category=='storage'?"selected":""}>storage</option>
                            <option value="others" ${product.category=='others'?"selected":""}>others</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>브랜드 카테고리</th>
                    <td>
                        <select id="brand" name="brand" style="width:100px">
                            <option value="에이스" ${product.brand=='에이스'?"selected":""}>에이스</option>
                            <option value="한샘" ${product.brand=='한샘'?"selected":""}>한샘</option>
                            <option value="이케아" ${product.brand=='이케아'?"selected":""}>이케아</option>
                            <option value="이브자리" ${product.brand=='이브자리'?"selected":""}>이브자리</option>
                            <option value="알레르망" ${product.brand=='알레르망'?"selected":""}>알레르망</option>
                            <option value="마틸라" ${product.brand=='마틸라'?"selected":""}>마틸라</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td>
                        <input type="file" name="productImg" id="thumbImg">
                        <div id="thumb" style="display: inline-block;">
                        	<c:if test="${product.renamedProductImg !=null }">
                            	<img src="${path }/resources/upload/newproduct/${product.renamedProductImg}" class="preViewImg"/>
                            </c:if>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <th>탑이미지</th>
                    <td>
                        <input type="file" name="topImg" id="topImg">
                        <div id="top" style="display: inline-block;">
                        	<c:if test="${product.renamedTopImg != null }">
                        		<img src="${path }/resources/upload/newproduct/${product.renamedTopImg}" class="preViewImg"/>
                        	</c:if>
                         </div>
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td>
                        <input type="file" name="detailImg" id="detailImg" multiple>
                        <div id="detail" style="display: inline-block;">
                        	<c:if test="${not empty detailImg }">
	                        	<c:forEach items="${detailImg }" var="di" >
	                        		<img src="${path }/resources/upload/newproduct/${di.diRenameFile}" class="preViewImg"/>
	                        	</c:forEach>
	                        </c:if>
                         </div>
                    </td>
                </tr>
                <tr>
                    <th>상세페이지이미지</th>
                    <td>
                        <input type="file" name="detailPageImg" id="detailPageImg" multiple>
                        <div id="detailPage" style="display: inline-block;">
                        	<c:if test="${not empty pageImg }">
	                        	<c:forEach items="${pageImg }" var="pi" >
	                        		<img src="${path }/resources/upload/newproduct/${pi.pdiRenameFile}" class="preViewImg"/>
	                        	</c:forEach>
	                        </c:if>
                         </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding:30px 30px 0 0; border:0;" colspan="2">
                        <button type="submit" class="btn-white">수정</button>
                    </td>
                </tr>
            </table>
            </form>
        </div>
	  </div>
<script>
	var viewImg;
	
	$(function(){
		$("#thumbImg").on("change",preViewFnc);
		$("#topImg").on("change",preViewFnc2);
		$("#detailImg").on("change",multiPreViewFnc);
		$("#detailPageImg").on("change",multiPreViewFnc2);
	})
	
	function preViewFnc(e){
		var files=e.target.files;
		var fileArr=Array.prototype.slice.call(files);
		$("#thumb").find($("img")).remove();
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 등록해주세요!");
				$("#thumbImg").val("");
				$("#thumb").find($("img")).remove();
				return;
			}
			viewImg=f;
			var reader=new FileReader();
			reader.onload=function(e){
				console.log(e.target);
				$("#thumb").append($("<img>").attr({"src":e.target.result,
					"class":"preViewImg"}));
			}
			reader.readAsDataURL(f);
		});
	}
	function preViewFnc2(e){
		var files=e.target.files;
		var fileArr=Array.prototype.slice.call(files);
		$("#top").find($("img")).remove();
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 등록해주세요!");
				$("#topImg").val("");
				$("#top").find($("img")).remove();
				return;
			}
			viewImg=f;
			var reader=new FileReader();
			reader.onload=function(e){
				console.log(e);
				$("#top").append($("<img>").attr({"src":e.target.result,
					"class":"preViewImg"}));
			}
			reader.readAsDataURL(f);
		});
	}
	
	var multiView=[];
	function multiPreViewFnc(e){
		var files=e.target.files;
		var fileArr=Array.prototype.slice.call(files);
		$("#detail").find($("img")).remove();
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 등록해주세요!");
				$("#detailImg").val("");
				$("#detail").find($("img")).remove();
				return;
			}
			multiView.push(f);
			
			var reader=new FileReader();
			reader.onload=function(e){
				console.log(e);
				$("#detail").append($("<img>").attr({"src":e.target.result,
					"class":"preViewImg"}));
			}
			reader.readAsDataURL(f);
		});
	}
	
	function multiPreViewFnc2(e){
		var files=e.target.files;
		var fileArr=Array.prototype.slice.call(files);
		$("#detailPage").find($("img")).remove();
		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 파일만 등록해주세요!");
				$("#detailPageImg").val("");
				$("#detailPage").find($("img")).remove();
				return;
			}
			multiView.push(f);
			
			var reader=new FileReader();
			reader.onload=function(e){
				console.log(e);
				$("#detailPage").append($("<img>").attr({"src":e.target.result,
					"class":"preViewImg"}));
			}
			reader.readAsDataURL(f);
		});
	}
</script>
  </body>
</html>