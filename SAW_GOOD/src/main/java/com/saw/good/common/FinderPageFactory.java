package com.saw.good.common;

public class FinderPageFactory {
	
		public static String getPage(int totalData,int cPage,int numPerPage,String searchType,String keyword ,String url) {
			
			String pageBar="";
			
			int pageBarSize=5;
			
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			
			int totalPage=(int)Math.ceil((double)totalData/numPerPage);
			
			pageBar+="<div id='pageBar'>";
			//이전
			if(pageNo==1) {
				pageBar+="<span><</span>";
			}else {
				pageBar+="<a href='javascript:fn_paging("+(pageNo-1)+","+numPerPage+","+searchType+","+keyword+")'><</a>";
			}
			
			//페이지처리
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<span class='cPage'>"+pageNo+"</span>";
				}else {

					pageBar+="<a href='javascript:fn_paging("+pageNo+","+numPerPage+","+searchType+","+keyword+")'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			
			//다음
			if(pageNo>totalPage) {
				pageBar+="<span>></span>";
			}else {
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+","+numPerPage+","+searchType+","+keyword+")'>></a>";
			}
			
			pageBar+="</div>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage,numPerPage,searchType,keyword){";
			pageBar+="location.href='"+url+"?cPage='+cPage+'&numPerPage='+numPerPage+'&searchType='+searchType+'&keyword='+keyword";
			pageBar+="}";
			pageBar+="</script>";
			
			return pageBar;
			
		}

}
