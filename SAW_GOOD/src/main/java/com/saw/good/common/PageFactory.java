package com.saw.good.common;

public class PageFactory {

	public static String getPage(int totalData,int cPage,int numPerPage, String url) {
		
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		
		pageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+","+numPerPage+")'><</a>";
		}
		
		//페이지처리
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {

				pageBar+="<a href='javascript:fn_paging("+pageNo+","+numPerPage+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+numPerPage+")'>></a>";
		}
		
		pageBar+="</div>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,numPerPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&numPerPage='+numPerPage";
		pageBar+="}";
		pageBar+="</script>";
		
		return pageBar;
	}

	
	public static Object getPageForAjax(int totalData, int cPage, int numPerPage) {
		
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		pageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='javascript:partlist("+(pageNo-1)+")'><</a>";
		}
		
		//페이지처리
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {

				pageBar+="<a href='javascript:partlist("+pageNo+")'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a href='javascript:partlist("+pageNo+")'>></a>";
		}
		
		pageBar+="</div>";
		
		
		return pageBar;
	}
}
