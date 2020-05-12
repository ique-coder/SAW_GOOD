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
        .btn-black {
            padding: 0 20px;
			line-height: 30px;
			font-size: 15px;
			color: #fff;
			text-align: center;
			background-color: #303030;
			border: 1px solid #303030;

        }
        .preViewImg{
        	width:100px;
        	height:100px;
        }
</style>
 <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        <h2 id="titeltwo">Product</h2>
        <div class="container-fluid">
        <form method="post" enctype="multipart/form-data">
            <table id="product-tbl" class="table-responsive-md">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tr>
                    <th>상품이름</th>
                    <td><input type="text" name="productName"></td>
                </tr>
                <tr>
                    <th>상품가격</th>
                    <td><input type="number" name="productPrice"><span>원</span></td>
                </tr>
                <tr>
                    <th>상품정보</th>
                    <td><textarea id="text" name="productContent"></textarea></td>
                </tr>
                <tr>
                    <th>가구별 카테고리</th>
                    <td>
                    <!-- 대문자영어로 바꾸기  -->
                        <select id="category" name="category" style="width:100px">
                            <option value="bed">bed</option>
                            <option value="sofa">sofa</option>
                            <option value="chair">chair</option>
                            <option value="light">light</option>
                            <option value="table">table</option>
                            <option value="desk">desk</option>
                            <option value="carpet">carpet</option>
                            <option value="lug">lug</option>
                            <option value="storage">storage</option>
                            <option value="others">others</option>
                        </select>
                    </td>
                </tr>
                <tr>
                <!-- 맞춰서 -->
                    <th>브랜드 카테고리</th>
                    <td>
                        <select id="brand" style="width:100px">
                            <option value="에이스">에이스</option>
                            <option value="한샘">한샘</option>
                            <option value="이케아">이케아</option>
                            <option value="파로마">파로마</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>썸네일</th>
                    <td>
                        <input type="file" name="productImg" id="thumbImg">
                        <div id="thumb" style="display: inline-block;">
                         </div>
                    </td>
                </tr>
                <tr>
                    <th>탑이미지</th>
                    <td>
                        <input type="file" name="topImg" id="topImg">
                        <div id="top" style="display: inline-block;">
                         </div>
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td>
                        <input type="file" name="detailImg" id="detailImg" multiple>
                        <div id="detail" style="display: inline-block;">
                         </div>
                    </td>
                </tr>
                <tr>
                    <th>상세페이지이미지</th>
                    <td>
                        <input type="file" name="detailPageImg" id="detailPageImg" multiple>
                        <div id="detailPage" style="display: inline-block;">
                         </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right; padding:30px 30px 0 0; border:0;" colspan="2">
                        <button type="button" class="btn-black" id="insertPro">등록</button>
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
			console.log(fileArr);
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
			console.log(fileArr);
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
		
		$("#insertPro").click(function(){
			console.log("클릭");
			const fd=new FormData();
			fd.append("productImg",$("[name=productImg]")[0].files[0]);
			fd.append("topImg",$("[name=topImg]")[0].files[0]);
			$.each($("[name=detailImg]")[0].files,function(index,item){
				fd.append("detailImg"+index,item);
			})
			fd.append("productName",$("[name=productName]").val());
			fd.append("productPrice",$("[name=productPrice]").val());
			fd.append("productContent",$("[name=productContent]").val());
			
			$.ajax({
				url:"${path}/admin/productRegistEnd",
				data:fd,
				type:"post",
				processData:false,
				contentType:false,
				success:function(data){
					alert("성공");
					location.replace("${path}/admin/productManager");
				},
				error:function(r,e,m){
					alert("공지사항 등록을 실패하였습니다. 확장자를 확인해주세요");
				}
			})
			
		})
	</script>
	
    
  </body>
</html>