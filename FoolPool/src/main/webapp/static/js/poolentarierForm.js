var maxTags = 5;

function addTag() {
	var pfTag = document.getElementById("pfTag");
	var tag = pfTag.value.trim();

	if (tag !== "") {
		var tagList = document.getElementById("tagList");

		// 현재 텍스트 개수 확인
		var existingTagCount = tagList
			.getElementsByTagName("li").length;

		if (existingTagCount < maxTags) {
			var li = document.createElement("li");
			li.innerHTML = tag
				+ " <span class='pfRemove-button' onclick='removeTag(this)'>X</span>";
			tagList.appendChild(li);
			pfTag.value = "";
		} else {
			alert("더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxTags + "개까지만 가능합니다.");
			pfTag.value = "";
		}
	}
}

function removeTag(element) {
	var listItem = element.parentNode;
	listItem.parentNode.removeChild(listItem);
}