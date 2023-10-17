// 공통 함수
// 작성, 수정 폼에서의 취소 버튼
function poolentarierCancelBtn() {
	history.back();
}

// poolentarierList

/* onclick="plCallBtn"인 a태그를 가지는 페이징에 대해, id가 searchform인 form을 호출하지만, return은 onclick이 포함된 곳에서 처리 */
function plCallBtn(num) {
	var keyword = $("#keyword").val();
	if(keyword!=null && keyword.trim()!='') {
		$('#page').val(num);
		$('#searchform').submit();
	}	
}

// poolenatarierForm

var maxKeywords = 5;
var keywordCounter = 0;

function pfAddKeywordBtn(event) {
	event.preventDefault();
	var pfKeyword = document.getElementById("pfKeyword");
	var keyword = pfKeyword.value.trim();

	if (keyword !== "") {
		var keywordList = document.getElementById("keywordList");

		// 현재 텍스트 개수 확인
		var existingKeywordCount = keywordList.getElementsByTagName("li").length;

		if (existingKeywordCount < maxKeywords) {
			var li = document.createElement("li");
			keywordCounter++;
			li.innerHTML = "<span name='" + keywordCounter + "'>" + keyword
			+ "</span> <span class='remove-button' onclick='pfRemoveKeywordBtn(this)'>X</span>";
			keywordList.appendChild(li);
			pfKeyword.value = "";

            // 폼에 값을 추가
			var form = document.getElementById("poolentarierForm"); // 폼의 ID를 사용하여 폼 요소를 가져옴
            var hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = keywordCounter;
            hiddenInput.value = keyword;
            form.appendChild(hiddenInput);

            // 폼 제출
            // form.submit();
		}
	} else {
		alert("더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxKeywords + "개까지만 가능합니다.");
		pfKeyword.value = "";
	}
}

function pfRemoveKeywordBtn(element) {
	var listItem = element.parentNode;
	var spanName = listItem.querySelector("span[name]").getAttribute("name");

	// span 태그 삭제
	listItem.parentNode.removeChild(listItem);
	keywordCounter = 0;
	
	// input 태그 삭제
    var form = document.getElementById("poolentarierForm");
    var inputToDelete = document.querySelector("input[name='" + spanName + "']");
    form.removeChild(inputToDelete);
	
	// 순번 재설정
	var listLi = document.querySelectorAll("#keywordList li");
	var listHiddenInput = form.querySelectorAll('input[type="hidden"]');
	for (var i = 0; i < listLi.length; i++) {
		keywordCounter++;
		var item = listLi[i];
		var itemSpan = item.querySelector("span[name]");
		itemSpan.setAttribute("name", i + 1);
		
		item = listHiddenInput[i];
		itemSpan = item.querySelector("input[name]");
		itemSpan.setAttribute("name", i + 1);
	}
}

// poolentarierDetail
