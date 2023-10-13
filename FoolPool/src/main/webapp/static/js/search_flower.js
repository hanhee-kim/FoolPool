/**
 * search_flower . js
 * 
 */

//꽃검색 제목 옵션이 선택될 때 

$(document).ready(function() {

	$("#searchFlowerTitleOption").change(function() {
		var selectedOption = $(this).val();

		// 선택이 되면 모든 요소에 안보이는 클래스 집어넣기

		$('#searchFlowerStartMonth').addClass("searchFlower_disabled");
		$('#searchFlowerStartDay').addClass("searchFlower_disabled");
		$('#searchFlowerHyphen').addClass("searchFlower_disabled");
		$('#searchFlowerEndMonth').addClass("searchFlower_disabled");
		$('#searchFlowerEndDay').addClass("searchFlower_disabled");
		$('#searchFlowerByName').addClass("searchFlower_disabled");
		$('#searchFlowerByLang').addClass("searchFlower_disabled");

		// 보이는 클래스 지우기

		$('#searchFlowerStartMonth').removeClass("searchFlower_abled");
		$('#searchFlowerStartDay').removeClass("searchFlower_abled");
		$('#searchFlowerHyphen').removeClass("searchFlower_abled");
		$('#searchFlowerEndMonth').removeClass("searchFlower_abled");
		$('#searchFlowerEndDay').removeClass("searchFlower_abled");
		$('#searchFlowerByName').removeClass("searchFlower_abled");
		$('#searchFlowerByLang').removeClass("searchFlower_abled");


		// 선택된 옵션에 따라 입력 요소 생성
		if (selectedOption === "singleDate") {	//날짜(단일)
			$('#searchFlowerStartMonth').addClass("searchFlower_abled");
			$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerStartDay').addClass("searchFlower_abled");
			$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
		} else if (selectedOption === "periodDate") {	//날짜(기간)
			$('#searchFlowerStartMonth').addClass("searchFlower_abled");
			$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerStartDay').addClass("searchFlower_abled");
			$('#searchFlowerStartDay').removeClass("searchFlower_disabled");

			$('#searchFlowerHyphen').addClass("searchFlower_abled");
			$('#searchFlowerHyphen').removeClass("searchFlower_disabled");

			$('#searchFlowerEndMonth').addClass("searchFlower_abled");
			$('#searchFlowerEndMonth').removeClass("searchFlower_disabled");
			$('#searchFlowerEndDay').addClass("searchFlower_abled");
			$('#searchFlowerEndDay').removeClass("searchFlower_disabled");
		} else if (selectedOption === "flowerName") {	//꽃 이름
			$('#searchFlowerByName').addClass("searchFlower_abled");
			$('#searchFlowerByName').removeClass("searchFlower_disabled");
		} else if (selectedOption === "flowerLang") {	//꽃말
			$('#searchFlowerByLang').addClass("searchFlower_abled");
			$('#searchFlowerByLang').removeClass("searchFlower_disabled");
		}
	});//disabled function
	
		function go_searchFlower() {
		var selectedVal = document.getElementById("searchFlowerTitleOption").val();
		console.log(selectedVal);
		}
		//		var data = {
		//		if( selectedVal === "singleDate"){
		//	
		//		} else if(selectedVal === "periodDate"){
		//	
		//		} else if(selectedVal === "flowerName"){
		//			
		//		} else if(selectedVal === "flowerLang") {
		//				
		//			}
		//		
		//		$.ajax({
		//			url:'searchflower',
		//			type:'post',
		//			data:{},
		//			success:'',
		//			error:''
		//		})//ajax			
		//	}}

});