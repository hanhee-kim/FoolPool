/**
 * search_flower . js
 * 
 */
//꽃검색 제목 옵션이 선택될 때 


$(document).ready(function() {
	$("#searchFlowerTitleOption").change(function() {
		var selectedOption = $(this).val();
		var inputBox = $("#searchFlowerOptionInputBox");

		// 비우기
		inputBox.empty();

		// 선택된 옵션에 따라 입력 요소 생성
		if (selectedOption === "singleDate") {	//날짜(단일)
			var selectBox = $(`<select class="searchFlowerStartMonth searchFlower_pd_r_22" id="searchFlowerStartMonth">
						            <c:forEach var="month" begin="1" end="12">
						                <option value="${month}">${month < 10 ? '0' + month : month}월</option>
						            </c:forEach>
						        </select>
						        <select class="searchFlowerStartDay searchFlower_pd_r_22" id="searchFlowerStartDay">
						            <c:forEach var="day" begin="1" end="31">
						                <option value="${day}">${day > 9 ? day : '0' + day}일</option>
						            </c:forEach>
						        </select>`);


			inputBox.append(selectBox);
		} else if (selectedOption === "periodDate") {	//날짜(기간)
			var selectBox = $(`<select class="searchFlowerStartMonth searchFlower_pd_r_22" id="searchFlowerStartMonth">
									<c:set var="n" value="1" />
									<c:forEach var="n" begin="1" end="12">
										<option value="${n}">${n < 10 ? '0' : ''}${n}월</option>
									</c:forEach>
			                    </select>
			                    <select class="searchFlowerStartDay searchFlower_pd_r_22" id="searchFlowerStartDay">
									<c:set var="n" value="1" />
									<c:forEach begin="1" end="31">
										<option value="${n}">${n > 9 ? n : '0'}${n > 9 ? '' : n}일</option>
										<c:set var="n" value="${n + 1}" />
									</c:forEach>
			                    </select>
			                    <div></div>
			                    <select class="searchFlowerEndMonth searchFlower_pd_r_22" id="searchFlowerEndMonth">
			                        <c:set var="n" value="1" />
									<c:forEach var="n" begin="1" end="12">
										<option value="${n}">${n < 10 ? '0' : ''}${n}월</option>
									</c:forEach>
			                    </select>
			                    <select class="searchFlowerEndDay searchFlower_pd_r_22" id="searchFlowerEndDay">
			                        <c:set var="n" value="1" />
									<c:forEach begin="1" end="31">
										<option value="${n}">${n > 9 ? n : '0'}${n > 9 ? '' : n}일</option>
										<c:set var="n" value="${n + 1}" />
									</c:forEach>
			                    </select>`);
			inputBox.append(selectBox);

		} else if (selectedOption === "flowerName") {	//꽃 이름
			var inputTextBox = $("<input type='text' class='searchFlowerByName' name='searchFlowerByName' id='searchFlowerByName'/>");
			inputBox.append(inputTextBox);
		} else if (selectedOption === "flowerLang") {	//꽃말
			var inputTextBox = $("<input type='text' class='searchFlowerByLang' name='searchFlowerByLang' id='searchFlowerByLang'/>");
			inputBox.append(inputTextBox);
		}
	});
});
