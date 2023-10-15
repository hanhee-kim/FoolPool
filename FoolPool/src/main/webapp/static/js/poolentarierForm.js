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

            // 폼에 값을 추가
            var form = document.getElementById("poolentarierFormForm"); // 폼의 ID를 사용하여 폼 요소를 가져옴
            var hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = "keyword" + keywordCounter;
            hiddenInput.value = keyword;
            form.appendChild(hiddenInput);

            // 폼 제출
            // form.submit();
		} else {
			alert("더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxKeywords + "개까지만 가능합니다.");
			pfKeyword.value = "";
		}
	}
}

function removeKeyword(element) {
	var listItem = element.parentNode;
	var inputToRemove = listItem.querySelector("input[type='hidden']");
	listItem.parentNode.removeChild(listItem);
	keywordCounter = 0;
	
	// 삭제된 input 요소의 순번을 찾고, 다음의 input 요소들의 순번을 갱신
	var removedInputIndex = parseInt(inputToRemove.getAttribute("name").replace("keyword", ""));
	var inputs = document.querySelectorAll("#poolentarierFormForm input[type='hidden']");
	for (var i = removedInputIndex; i < inputs.length; i++) {
		keywordCounter++;
		var input = inputs[i];
		var newName = "keyword" + keywordCounter; // 갱신할 순번으로 새 이름 생성
		input.setAttribute("name", newName);
	}
	
	// 삭제된 span 태그를 찾아 삭제
    var spanToRemove = listItem.querySelector("span[name]");
    spanToRemove.parentNode.removeChild(spanToRemove);
    
    // 남은 span 태그의 순번을 갱신
    var spanElements = document.querySelectorAll("#keywordList li span[name]");
    for (var i = 0; i < spanElements.length; i++) {
        var spanElement = spanElements[i];
        spanElement.setAttribute("name", (i + 1) + "thKeyword");
    }
}