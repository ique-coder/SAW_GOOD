var main = $("#main"),
	main_offset = $("#main").offset(), 
	parent = $("#main").parent(), 
	position = $("#main").position();
	

$(window).scroll(function() {
	var bottom = parent.offset().top + parent.height();
	//탑에 붙이기
	if ($(window).scrollTop() >= main_offset.top) {
	parentSize();
	$("#main").addClass("wrapper");
	$("#main").removeClass("attachBottom");
	if ($("#main").height() >= bottom - $(window).scrollTop()) {
		$("#main").removeClass("wrapper");
		$("#main").addClass("attachBottom");
	}
	} else {
	$("#main").removeClass("wrapper");
	}
//	//바텀에 붙이기
//	if($(window).scrollTop()+$(window).height()>=main_offset.top+main.height()){
//		parentSize();
//		$("#main").addClass("wrapper");
//		$("#main").removeClass("attachBottom");
//		//특정 위치를 넘어가면 fixed해제
//		if($(window).scrollTop()+$(window).height()>=bottom ){
//			$("#main").removeClass("wrapper");
//			$("#main").addClass("attachBottom");
//		}
//	}else{
//		$("#main").removeClass("wrapper");
//	}

})
function parentSize() {
	//fixed로틀어지는 사이즈를 맞춰줌
	var pWidth = parent.width(),
		pHeight = parent.height() /2;
	$("#main").width(pWidth);
	$("#main").height(pHeight);

}


//페이징 처리하기

var flag = true;
$(window).scroll(function(){
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		
		if(flag){
			requestData();
			
		}
	}
})

function paging(data){
	var con = $("#item-container");
	
	var length = data.list.length%4 ==0? 4 : data.list.length%4;
	
	//console.log(data.list.length);
	if(data.list.length>0){
		for(let i = 0;i<data.list.length;i=i+4){
			const row = $("<div>").addClass("row");
			
			for(let j = 0; j<length; j++){
				const div = $("<div>").addClass("col-md-3");
				
				//받아온 날짜 포멧
				var today = new Date();
				var endDate = new Date(data.list[i+j].endDate);
				var result ="";
				if(Math.floor((endDate-today)/(60*24*60*1000))>=0){
					result = Math.floor((endDate-today)/(60*24*60*1000))+"일 남음";
				}
				//참여가격에 ,찍기
				var money = addComma(data.list[i+j].sum);
				
				const div2 = $("<div>").addClass("sub-item");
				div2.append($("<a>").attr("href","${path}/funding/detail?fdNo="+ data.list[i+j].fdNo));
				div2.append($("<img>").attr({src:"/resources/images/funding/"+data.list[i+j].mainImg,
											class:"images"}));
				
				
				
				var thead = $("<thead>").append($("<tr>").append($("<th>").attr("colspan","2").append($("<h1>").addClass("text-deco text-position").html(data.list[i+j].title))));
					
				var tr = $("<tr>").append($("<th>").html(data.list[i+j].designer)).append($("<td>").html(result));
				var tbody = $("<tbody>").append($("<td>").append($("<th>").attr("colspan","2").append($("<svg>").attr({
					width:"100%", height:"3px", xmlns:"http://w3.org/2000/svg",version:"1.1",class:"bar-container"
				}).append($("<rect>").attr({
					x:"0",y:"0",width:(data.list[i+j].sum)/(data.list[i+j].targetPrice)*100+"%",height:"3px",class:"bar"
				})))));
				var tfoot = $("<tfoot>").append($("<tr>").append($("<th>").html(money+"원")).append($("<td>").html(Math.floor((data.list[i+j].sum)/(data.list[i+j].targetPrice)*100)+"%")));
				
				div2.append($("<table>").append(thead).append(tr).append(tbody).append(tfoot));
				
				
//				div.append('<div class="sub-item">'
//									+'<a href="${path }/funding/detail?fdNo='+ data.list[i+j].fdNo+ '">'
//									+'<img src="${path }/resources/images/funding/'+data.list[i+j].mainImg+'" class="images" />'
//									+'<table><thead><tr><th colspan="2">'
//														+'<h1 class="text-deco text-position">'
//															+data.list[i+j].title+'</h1>'
//													+'</th></tr></thead>'
//													+'<tr><th>'+data.list[i+j].designer+'</th>'
//													+'<td>'
//													+result
//													+'</td></tr><tbody><tr>'
//													+'<th colspan="2">'
//													+'<svg width="100%" height="3px"xmlns="http://w3.org/2000/svg" version="1.1"class="bar-container">'
//					                                   +'<rect x="0" y="0" width="'+ (data.list[i+j].sum)/(data.list[i+j].targetPrice)*100+'%" height="3px" class="bar" /></svg></th>'
//					                        +'</tr></tbody><tfoot>'
//											+'<tr><th>'+ money+'원</th>'
//												+'<td>'+Math.floor((data.list[i+j].sum)/(data.list[i+j].targetPrice)*100)+'%</td>'
//										+'</tr></tfoot></table></a></div>');
//				
				row.append(div.append(div2));
			}
			con.append(row);
			
		} 
	}else{
		flag = false;
	}
}

function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
}

