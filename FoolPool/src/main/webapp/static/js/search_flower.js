/**
 * search_flower . js
 * 
 */
//문자열에서 숫자 추출
function findNum(str) {
	const regex = /[^0-9]/g;
	const result = str.replace(regex, "");
	const number = parseInt(result);
	return number;
}
//꽃검색 제목 옵션이 선택될 때 
function go_searchFlower() {
	var selectedVal = document.getElementById("searchFlowerTitleOption").value;
	console.log(selectedVal);
	$('#flowerCardsection_line').removeClass("searchFlower_disabled");

	var data;

	if (selectedVal === "singleDate") {
		var startMonth = $('#searchFlowerStartMonth').val();
		var startDay = $('#searchFlowerStartDay').val();
		data = 'option=singleDate&startMonth=' + startMonth + '&startDay=' + startDay;

	} else if (selectedVal === "periodDate") {
		var startMonth = $('#searchFlowerStartMonth').val();
		var startDay = $('#searchFlowerStartDay').val();
		var endMonth = $('#searchFlowerEndMonth').val();
		var endDay = $('#searchFlowerEndDay').val();
		data = 'option=periodDate&startMonth=' + startMonth + '&startDay=' + startDay + '&endMonth=' + endMonth + '&endDay=' + endDay;
	} else if (selectedVal === "flowerName") {
		var byName = $('#searchFlowerByName').val();
		data = 'option=flowerName&byName=' + byName;
	} else if (selectedVal === "flowerLang") {
		var byLang = $('#searchFlowerByLang').val();
		data = 'option=flowerLang&byLang=' + byLang;
	}
	//버튼 클릭시 searchflower로 태그마다 변경된 데이터 들고 이동
	location.href = 'searchflower?' + data;
}

//페이지 로드시 
$(document).ready(function() {
	//큰옵션이 바뀌면
	$("#searchFlowerTitleOption").change(function() {
		var selectedOption = $(this).val();

		$('#searchFlowerStartMonth').addClass("searchFlower_disabled");
		$('#searchFlowerStartDay').addClass("searchFlower_disabled");
		$('#searchFlowerHyphen').addClass("searchFlower_disabled");
		$('#searchFlowerEndMonth').addClass("searchFlower_disabled");
		$('#searchFlowerEndDay').addClass("searchFlower_disabled");
		$('#searchFlowerByName').addClass("searchFlower_disabled");
		$('#searchFlowerByLang').addClass("searchFlower_disabled");

		// 선택된 옵션에 따라 입력 요소 생성
		if (selectedOption === "singleDate") {	//날짜(단일)
			$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
		} else if (selectedOption === "periodDate") {	//날짜(기간)
			$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
			$('#searchFlowerHyphen').removeClass("searchFlower_disabled");
			$('#searchFlowerEndMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerEndDay').removeClass("searchFlower_disabled");
		} else if (selectedOption === "flowerName") {	//꽃 이름
			$('#searchFlowerByName').removeClass("searchFlower_disabled");
			$('#searchFlowerByName').focus();
		} else if (selectedOption === "flowerLang") {	//꽃말
			$('#searchFlowerByLang').removeClass("searchFlower_disabled");
			$('#searchFlowerByLang').focus();
		}
	});//disabled function

	//조회목록 조작(페이지 로드 후)
	var fCardLen = $(".flowerCard").length;
	$(".flowerCard").each(function(idx, obj) {
		var cardId = obj.id;
		if (idx >= 4) {
			$('#' + cardId).addClass("searchFlower_disabled");
		}
	});
	//더보기 
	//var showCardLen = fCardLen;
	var showeMoreCnt = 1;
	$("#searchFlowerSeeMore").on("click", function (){
		//보여지는게 처음부터 4개여서 카운트를 1로놓고 클릭할때 2로 만들어서 8개를 보여줌
		showeMoreCnt++;
		if(0<fCardLen-(4*showeMoreCnt)){
			$('#searchFlowerSeeMore').removeClass("searchFlower_disabled");
			
		}else if(fCardLen-(4*showeMoreCnt) <=0 ){
			$('#searchFlowerSeeMore').addClass("searchFlower_disabled");
		}
		
		$(".flowerCard").each(function(idx, obj) {
		var cardId = obj.id;
		if (idx < (4*showeMoreCnt)) {
			$('#' + cardId).removeClass("searchFlower_disabled");
		}
	});
		
	})
	
	
});

$(function(){
	//day의 값 다르게 뽑는 함수
	function showDaySelect(month,day){
		if(month == 2){
			for(var i=1; i<=29; i++) {
				var option = `<option value="${i}">${i > 9 ? i : '0'}${i>9 ? '' : i}일</option>`;
				day.append(option);
			}						
		} else if(month==1 || month==3 || month==5 || month==7 || month==8 ||month==10){
			for(var i=1; i<=31; i++) {
				var option = `<option value="${i}">${i > 9 ? i : '0'}${i>9 ? '' : i}일</option>`;
				day.append(option);
			}	
		} else{
			for(var i=1; i<=30; i++) {
				var option = `<option value="${i}">${i > 9 ? i : '0'}${i>9 ? '' : i}일</option>`;
				day.append(option);
			}			
		}
	}
	
	//startMonth 셀렉트박스 변경시 옵션에 따른 day값 다르게 표기
	//시작날셀렉트박스
	$('#searchFlowerStartMonth').change(function(){
		var s_month = $('#searchFlowerStartMonth option:selected').val();
		var s_day = $('#searchFlowerStartDay');
		$('#searchFlowerStartDay option').remove();
		showDaySelect(s_month,s_day);
	})
	//끝날 셀렉트박스
	$('#searchFlowerEndMonth').change(function(){
		var e_month = $('#searchFlowerEndMonth  option:selected').val();
		var e_day = $('#searchFlowerEndDay');
		$('#searchFlowerEndDay option').remove();
		showDaySelect(e_month,e_day);
	});
	
	
	$('#searchFlowerStartMonth').change();
	$('#searchFlowerEndMonth').change();
	
});




	
