/**
 * search_flower . js
 * 
 */

//꽃검색 제목 옵션이 선택될 때 
function go_searchFlower() {
		var selectedVal = document.getElementById("searchFlowerTitleOption").value;
		console.log(selectedVal);
		var data;
		
		if( selectedVal === "singleDate"){ 
			var startMonth = $('#searchFlowerStartMonth').val();
			var startDay = $('#searchFlowerStartDay').val();
			data = {'option':'singleDate','startMonth':startMonth,'startDay':startDay};
			
		} else if(selectedVal === "periodDate"){
			var startMonth = $('#searchFlowerStartMonth').val();
			var startDay = $('#searchFlowerStartDay').val();
			var endMonth = $('#searchFlowerEndMonth').val();
			var endDay = $('#searchFlowerEndDay').val();
			data = {'option':'periodDate','startMonth':startMonth,'startDay':startDay,'endMonth':endMonth,'endDay':endDay};
		} else if(selectedVal === "flowerName"){
			var byName = $('#searchFlowerByName').val();
			data = {'option':'flowerName','byName':byName};	
		} else if(selectedVal === "flowerLang") {
			var byLang = $('#searchFlowerByLang').val();	
			data = {'option':'flowerLang','byLang':byLang};	
		}
		console.log(data);
		console.log(JSON.stringify(data));
		
//		location.href='gosearchflower?data='+data;		
//		$.ajax({
//					url:'searchflower',
//					type:'post',
//					data:data,
//					success:function(res){
//						console.log(res+","+typeof(res));
//						if(res == ''){
//							Swal.fire({
//								title:'조회된 데이터가 없습니다.',
//								icon:'warning'
//							});
//						}
//					},
//					error:''
//				})//ajax
		
		
		}
$(document).ready(function() {

	$("#searchFlowerTitleOption").change(function() {
		var selectedOption = $(this).val();

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
});