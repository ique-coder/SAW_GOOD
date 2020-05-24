package com.saw.good.common;

public class ProductCategoryPage {
	
public static String getPage(int totalData,int cPage,int numPerPage, String[] category ,String url) {
		
		String pageBar="";
		if(category.length == 2) {	
			
			int pageBarSize=5;
			
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
			
			pageBar+="<div id='pageBar'>";
			//이전
			if(pageNo==1) {
				pageBar+="<span><</span>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+","+numPerPage+","+category[0]+","+category[1]+")'><</a>";
			}
			
			//페이지처리
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<span class='cPage'>"+pageNo+"</span>";
				}else {
					
					pageBar+="<a href='javascript:fn_paging("+pageNo+","+numPerPage+","+category[0]+","+category[1]+")'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			
			//다음
			if(pageNo>totalPage) {
				pageBar+="<span>></span>";
			}else {
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+numPerPage+","+category[0]+","+category[1]+")'>></a>";
			}
			
			pageBar+="</div>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage,numPerPage,category1,category2){";
			pageBar+="location.href='"+url+"?cPage='+cPage+'&numPerPage='+numPerPage+'&category='+category1+'&category='+category2";
			pageBar+="}";
			pageBar+="</script>";
			
			
		}else {
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		pageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+","+numPerPage+","+category[0]+")'><</a>";
		}
		
		//페이지처리
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
				
				pageBar+="<a href='javascript:fn_paging("+pageNo+","+numPerPage+","+category[0]+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+numPerPage+","+category[0]+")'>></a>";
		}
		
		pageBar+="</div>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage,category1){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&numPerPage='+numPerPage+'&category='+category1+";
		pageBar+="}";
		pageBar+="</script>";
	}
	return pageBar;
}
}
