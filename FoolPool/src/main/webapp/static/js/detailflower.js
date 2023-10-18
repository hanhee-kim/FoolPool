/**
 * 
 */

$(function() {
//	//큰이미지 눌렀을시 새창으로 띄우기
//	$("#searchFlower_bigImg").click(function() {
//		window.open($(this).attr('src'));
//	})
	//모달창
 // 이미지 클릭 시 모달 열기
    $("#searchFlower_bigImg").click(function() {
        var modal = document.getElementById('flower_d_Modal');
        var modalImage = document.getElementById('flowerModalImage');
        modal.style.display = 'flex';
        modalImage.src = $(this).attr('src');
    });

    // 모달 닫기
    $('#closeModal').click(function() {
        var modal = document.getElementById('flower_d_Modal');
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).click(function(e) {
        var modal = document.getElementById('flower_d_Modal');
        if (e.target == modal) {
            modal.style.display = 'none';
        }
    });
//	window.addEventListener("click", function(event) {
//		if (event.target === modal) {
//			modal.style.display = "none";
//		}
//	});

	//small이미지 클릭시 big이미지의 변환
	$(".searchFlowerDetailSmallImg").click(function() {
		$("#searchFlower_bigImg").attr('src', $(this).attr('src'));
	})

	//이전버튼
	$('#searchFlowerBeforeIcon').on("click", function() {
		//data-datano='';의 값을 가져오기
		var dataNo = $('#searchFlowerBeforeIcon').data('datano');
		console.log(dataNo);
		if (dataNo == 1) {
			location.href = "detailflower?flowerNumber=" + 365;
		} else {
			location.href = "detailflower?flowerNumber=" + (dataNo - 1);
		}
	})
	//다음버튼
	$('#searchFlowerNextIcon').on("click", function() {
		var dataNo = $('#searchFlowerBeforeIcon').data('datano');
		console.log(dataNo);
		if (dataNo == 365) {
			location.href = "detailflower?flowerNumber=" + 1;
		} else {
			location.href = "detailflower?flowerNumber=" + (dataNo + 1);
		}
	})

})






