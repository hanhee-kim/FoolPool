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
			var form = document.forms[0]; // 폼의 ID를 사용하여 폼 요소를 가져옴
            var checkboxInput = document.createElement("input");
            checkboxInput.type = "checkbox";
            checkboxInput.name = "keywordForSubmit";
            checkboxInput.className = "pfCheckboxKeyword";
            checkboxInput.value = keyword;
            checkboxInput.checked = true;
            form.appendChild(checkboxInput);

            // 폼 제출
            // form.submit();
		} else {
			Swal.fire({
				text:"더 이상 텍스트를 추가할 수 없습니다. 최대 " + maxKeywords + "개까지만 가능합니다.",
				icon:'warning'
					});
			pfKeyword.value = "";
		}
	} else {
		Swal.fire({
			title:'키워드를 입력하세요.',
			icon:'warning'
					});
		pfKeyword.value = "";
	}
}

function pfRemoveKeywordBtn(element) {
    
    var listItem = element.parentNode;
    var spanValue = listItem.querySelector("span[name]").textContent;

    // span 태그 삭제
    listItem.parentNode.removeChild(listItem);

    // input 태그 삭제
    /*var form = document.getElementById("poolentarierForm");*/
    var form = document.forms[0];
    var inputToDelete = form.querySelector("input[type='checkbox'][value='" + spanValue + "']");
    if (inputToDelete) {
        form.removeChild(inputToDelete);
    }
    
}

// 게시글 삭제
function pdRemovePoolentarier(no) {
	Swal.fire({
		title: '게시글을 삭제하시겠습니까?',
		text:'삭제 후 복구가 불가능합니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#5196d7', // confrim 버튼 색깔 지정
		cancelButtonColor: '#e75959', // cancel 버튼 색깔 지정
		confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		closeOnClickOutside: false
		}).then(function(result) {
			if (result.isConfirmed) {
			// 확인 버튼을 눌렀을 때, 게시글을 삭제
			window.location.href = "poolentarierDelete?no=" + no;
			}
		})
}

// 특수문자 제한
function characterCheck(obj){
	var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

	if( regExp.test(obj.value) ){
		Swal.fire({
			title:'특수문자는 입력하실수 없습니다.',
			icon:'warning'
					});
		obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	}
}


/* poolentarierDetail*/

// 댓글 삭제
function pdRemoveComment(commentNo, postNo) {
	Swal.fire({
		title: '댓글을 삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#5196d7', // confrim 버튼 색깔 지정
		cancelButtonColor: '#e75959', // cancel 버튼 색깔 지정
		confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		closeOnClickOutside: false
		}).then(function(result) {
			if (result.isConfirmed) {
			// 확인 버튼을 눌렀을 때, 댓글을 삭제
			window.location.href = "poolentarierCommentDelete?commentNo=" + commentNo + "&postNo=" + postNo;
			}
		})
	
}

// 댓글 유효성 검사
function pdCommentValidation() {
	let commentValue = $('#pdCommentValue').val();
	let validationMsg = $('#pdCommentValidationMsg');
	const resetCommentbtn = $('#pdResetCommentbtn')[0];
	
	// 입력값이 생기면 input[type=reset] 버튼의 비활성화속성을 제거
	if(commentValue.length>0) {
		resetCommentbtn.disabled = false;
	} else {
		resetCommentbtn.disabled = true;
	}
	
	if(commentValue.includes('나쁜말')) {
		validationMsg.text('댓글에 비속어 사용을 자제해주세요');
	}
	if(commentValue.length>298) {
		validationMsg.text('댓글은 최대 300자까지 작성하실 수 있습니다');
	}
	if(commentValue.length<=298) {
		validationMsg.text('');
	}
}

// 작성
$(document).ready(function() {
	// input[type=reset]을 눌렀을때 기본동작으로는 입력값을 제거하면서 reset버튼을 다시 비활성화상태로 바꿔주지 않으므로 명시적으로 수행하게함
	$('pdResetCommentbtn').click(function() {
    	$('#pdCommentValue').val('');
    	this.disabled = true;
	});
	
	/* 풀랜테리어 목록 - 검색바 유효성 검사 */
    $('#plSearchForm').submit(function(event) {
        let sOption = $("#plSearchOption").val();
        let sValue = $("#plSearchValue").val().trim();
        // 수행1. trim된 값을 검색어input태그에 value로 넣어줌
        $("#plSearchValue").val(sValue); 
        // 수행2. null값 검색제출을 막음 - 404에러 방지
        if (searchOption === "unselected" || searchValue === "") {
            console.log("검색옵션 혹은 검색어가 없으므로 기본제출이 막아짐");
            event.preventDefault();
        }
    });
    
    /* 풀랜테리어 작성폼 - 커스텀한 파일선택 버튼에 선택된 파일명 표시(input태그의 value값 넣기) */
	$("#pfFileforwrite").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".pfSelectedFileName").val(selectedFileName);
	});
	$("#pfFileforedit").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".pfSelectedFileName").val(selectedFileName);
	});
    
	/* 풀랜테리어 작성폼, 수정폼 - 파일선택 유효성 검사 (커스텀버튼을 사용하기 위해 파일input에 display=none스타일이 적용했기때문에 required속성 사용하여 체크하지 못함) */
    $('.pfForm').submit(function(event) {
        let fileName = $(".pfSelectedFileName").val();
        if (fileName=='첨부파일 미선택') {
//            console.log("파일이 선택되지 않았으므로 기본제출이 막아짐"); // 404에러 방지
            Swal.fire({
				title: '글을 등록하기 위해서 첨부파일을 선택해주세요.',
				icon: 'warning'
					});
            event.preventDefault();
        }
    });
    
    /* 풀랜테리어 작성폼 - 제목 유효성 검사 */
    $('.pfTitleValidationMsg').text('');
    $('.pfFormTitle').keyup(function(e) {
        let titleValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.pfTitleValidationMsg');

        if(titleValue.length > 98) {
            console.log('제목 유효성검사에 걸림...');
            validationMsg.text('제목은 100자를 초과할 수 없습니다');
        }
        if(titleValue.length <= 98) {
			validationMsg.text('');
		}
    });
    
    /* 풀랜테리어 작성 - 내용 유효성 검사 */
    $('.pfContentValidationMsg').text('');
    $('.pfFormContent').keyup(function(e) {
        let contentValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.pfContentValidationMsg');

        if(contentValue.length > 1998) {
            console.log('내용 유효성검사에 걸림...');
            validationMsg.text('내용은 최대 2000자까지 작성하실 수 있습니다');
        }
        if(contentValue.length <= 1998) {
			validationMsg.text('');
		}
    });
    
    
    
    // 풀풀박사 작성폼, 수정폼 - 업로드이미지 미리보기(파일을 읽어서 img태그에 표시)
    $('#pfFileforwrite').change(function () {
		console.log('이미지input값 변경됨...');
		
        let uploadImg = this;
        let uploadImgPreview = $('.pfFormImgPreview');

		// 선택된 파일이 존재할때
        if (uploadImg.files && uploadImg.files[0]) {
            let reader = new FileReader();
            
            // 파일을 내용을 읽어서 데이터url로 변환(이미지를 인코딩하는 작업)
            reader.readAsDataURL(uploadImg.files[0]);

            // 파일 읽기 완료시 호출되는 콜백함수 선언
            reader.onload = function (e) {
                uploadImgPreview.attr('src', e.target.result);
                uploadImgPreview.show();
                // src속성에 데이터url로 인코딩된값을 세팅하고 display:none이던 img태그를 표시
            };
        }
    });
    // 수정폼
    $('#pfFileforedit').change(function () {
		// 기존 이미지를 표시하는 img태그가 보여지지 않도록 속성 추가
		$('#pfFormImgExisting').attr("style", "display: none"); 
		
        let uploadImg = this;
        let uploadImgPreview = $('.pfFormImgPreview');

		// 선택된 파일이 존재할때
        if (uploadImg.files && uploadImg.files[0]) {
            let reader = new FileReader();
            
            // 파일을 내용을 읽어서 데이터url로 변환(이미지를 인코딩하는 작업)
            reader.readAsDataURL(uploadImg.files[0]);

            // 파일 읽기 완료시 호출되는 콜백함수 선언
            reader.onload = function (e) {
                uploadImgPreview.attr('src', e.target.result);
                uploadImgPreview.show();
                // src속성에 데이터url로 인코딩된값을 세팅하고 display:none이던 img태그를 표시
            };
        }
    });
});