var maxKeywords = 5;

function addKeyword() {
	var pfKeyword = document.getElementById("pfKeyword");
	var keyword = pfKeyword.value.trim();

	if (keyword !== "") {
		var keywordList = document.getElementById("keywordList");

		// 현재 텍스트 개수 확인
		var existingKeywordCount = keywordList
			.getElementsByKeywordName("li").length;

		if (existingKeywordCount < maxKeywords) {
			var li = document.createElement("li");
			li.innerHTML = keyword
				+ " <span class='pfRemove-button' onclick='removeKeywrod(this)'>X</span>";
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
}