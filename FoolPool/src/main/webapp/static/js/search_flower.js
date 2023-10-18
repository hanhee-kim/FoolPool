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
	$('#searchFlowerMSG').addClass("searchFlower_disabled");
	$('#searchFlowerOptionCheck').removeClass("searchFlower_disabled");

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
	var option = '${res.option}';
	console.log(option);
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
		} else if (selectedOption === "flowerLang") {	//꽃말
			$('#searchFlowerByLang').removeClass("searchFlower_disabled");
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
		showeMoreCnt++;
		console.log("더보기 클릭");
		console.log("showeMoreCnt"+showeMoreCnt);
		console.log("fCardLen :"+fCardLen)
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

	
