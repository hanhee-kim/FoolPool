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
			//keywordCounter++;
			li.innerHTML = "<span name='keyword'>" + keyword
			+ "</span> <span class='pfRemove-button' onclick='pfRemoveKeywordBtn(this)'> X</span>";
			keywordList.appendChild(li);
			pfKeyword.value = "";

            // 폼에 값을 추가
			var form = document.getElementById("poolentarierForm"); // 폼의 ID를 사용하여 폼 요소를 가져옴
            var checkboxInput = document.createElement("input");
            checkboxInput.type = "checkbox";
            checkboxInput.name = "keywordForSubmit";
            checkboxInput.value = keyword;
            form.appendChild(checkboxInput);
            checkboxInput.checked = true;

            // 폼 제출
            // form.submit();
		} else {
			alert("더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxKeywords + "개까지만 가능합니다.");
			pfKeyword.value = "";
		}
	} else {
		alert("키워드를 입력하세요.");
		pfKeyword.value = "";
	}
}

function pfRemoveKeywordBtn(element) {
    
    var listItem = element.parentNode;
    var spanValue = listItem.querySelector("span[name]").textContent;

    // span 태그 삭제
    listItem.parentNode.removeChild(listItem);

    // input 태그 삭제
    var form = document.getElementById("poolentarierForm");
    var inputToDelete = form.querySelector("input[name='keywordForSubmit'][value='" + spanValue + "']");
    if (inputToDelete) {
        form.removeChild(inputToDelete);
    }
    
}

// 게시글 삭제
function pdRemovePoolentarier(no) {
	if (confirm("게시글을 삭제하시겠습니까?")) {
		window.location.href = "poolentarierDelete?no=" + no;
	} else {
		
	}
}


/* poolentarierDetail*/

// 댓글 삭제
function pdRemoveComment(commentNo, postNo) {
	if (confirm("댓글을 삭제하시겠습니까?")) {
		window.location.href = "poolentarierCommentDelete?commentNo=" + commentNo + "&postNo=" + postNo;
	} else {
		
	}
}

// 댓글 유효성 검사
function pdCommentValidation() {
	let commentValue = $('#pdCommentValue').val();
	let validationMsg = $('#pdCommentValidationMsg');

	if(commentValue.length>298) {
		validationMsg.text('댓글은 최대 300자까지 작성하실 수 있습니다');
	}
	if(commentValue.length<=298) {
		validationMsg.text('');
	}
}