// 공통 함수
// 작성, 수정 폼에서의 취소 버튼
function poolentarierCancelBtn() {
	history.back();
}

// poolentarierList

/* onclick="plCallBtn"인 a태그를 가지는 페이징에 대해, id가 searchform인 form을 호출하지만, return은 onclick이 포함된 곳에서 처리 */
function plCallBtn(no) {
	var keyword = $("#keyword").val();
	if(keyword!=null && keyword.trim()!='') {
		$('#page').val(no);
		$('#searchform').submit();
	}	
}

// poolenatarierForm

var maxKeywords = 5;
var keywordCounter = 0;

function addKeyword(event) {
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
			li.innerHTML = "<span name='" + keywordCounter + "thKeyword'>" + keyword
			+ "</span> <span class='remove-button' onclick='removeKeyword(this)'>X</span>";
			keywordList.appendChild(li);
			pfKeyword.value = "";
		} else {
			alert("더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxKeywords + "개까지만 가능합니다.");
			pfKeyword.value = "";
		}
	}
}

function removeKeyword(element) {
	var listItem = element.parentNode;
	listItem.parentNode.removeChild(listItem);
	keywordCounter = 0;
	
	// 순번 재설정
	var listItems = document.querySelectorAll("#keywordList li");
	for (var i = 0; i < listItems.length; i++) {
		keywordCounter++;
		var item = listItems[i];
		var itemSpan = item.querySelector("span[name]");
		itemSpan.setAttribute("name", i + 1 + "thKeyword");
	}
	
}

// poolentarierDetail

// 댓글 삭제
// 
function pdRemoveComment(commentNo, postNo) {
	if (confirm("댓글을 삭제하시겠습니까?") == true) {
		window.location.href = "poolentarierCommentDelete?commentNo=" + commentNo + "&postNo=" + postNo;
	}
}