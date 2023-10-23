// 공통 함수
// 작성, 수정 폼에서의 취소 버튼
function poolentarierCancelBtn() {
	history.back();
}

// poolentarierList

// onclick="plCallBtn"인 a태그를 가지는 페이징에 대해, id가 searchform인 form을 호출하지만, return은 onclick이 포함된 곳에서 처리
function plCallBtn(no) {
	var keyword = $("#keyword").val();
	if(keyword!=null && keyword.trim()!='') {
		$('#page').val(no);
		$('#searchform').submit();
	}	
}

// poolenatarierForm

// 키워드 등록
var maxKeywords = 5;
function addKeywordBtn(event) {
	event.preventDefault();
	// 키워드 입력폼 값 가져옴 및 앞뒤 공백 제거
	var keywordIdValue = document.getElementById("keywordId");
	var keyword = keywordIdValue.value.trim();

	// 키워드가 공백이 아닌 경우
	if (keyword !== "") {
		var keywordList = document.getElementById("keywordList");
		
		// 현재 텍스트 개수 확인
		var existingKeywordCount = keywordList.getElementsByTagName("li").length;

		// 등록된 키워드 개수가 5개 미만일 경우
		if (existingKeywordCount < maxKeywords) {
			// 키워드 값들 가져오기
			var existingKeywords = keywordList.querySelectorAll("span[name='keyword']");
			var isExist = false;
			
			// 입력폼의 값과 중복되는 키워드 값이 있는지 비교
			for(var i = 0;i < existingKeywords.length;i++) {
				if (existingKeywords[i].textContent === keyword) {
	                isExist = true;
	                break;
	            }
			}
			
			// 중복되는 키워드 값이 없는 경우
			if(!isExist) {
				var li = document.createElement("li");
					
				li.innerHTML = "<span name='keyword'>" + keyword
				+ "</span> <span class='remove-button' onclick='removeKeywordBtn(this)'> X</span>";
				keywordList.appendChild(li);
				keywordIdValue.value = "";
			
			    // 폼에 값을 추가
				var form = document.forms[0]; // 폼의 ID를 사용하여 폼 요소를 가져옴
			    var checkboxInput = document.createElement("input");
			    checkboxInput.type = "checkbox";
			    checkboxInput.name = "keywordForSubmit";
			    checkboxInput.className = "checkboxKeyword";
				checkboxInput.value = keyword;
				checkboxInput.checked = true;
				form.appendChild(checkboxInput);
			} else {
				Swal.fire({
					title:'중복된 키워드는 입력할 수 없습니다.',
					icon:'warning'
				});
				keywordIdValue.value = "";
			}
		}  else {
			Swal.fire({
				text:"키워드는 최대 " + maxKeywords + "개까지만 추가 가능합니다.",
				icon:'warning'
			});
			keywordIdValue.value = "";
		}
	} else {
		Swal.fire({
			title:'키워드를 입력하세요.',
			icon:'warning'
		});
		keywordIdValue.value = "";
	}
}

// 키워드 삭제
function removeKeywordBtn(element) {
    // span 클래스의 부모 노드를 찾아옴 (li 태그)
    var listItem = element.parentNode;
    // li 태그에서 span 태그 value 가져옴
    var spanValue = listItem.querySelector("span[name]").textContent;

    // li 태그 삭제
    listItem.parentNode.removeChild(listItem);

    // input 태그 삭제
    // span value 값과 동일한 value 가지는 input type=checkbox 태그를 삭제
    var form = document.forms[0];
    var inputToDelete = form.querySelector("input[type='checkbox'][value='" + spanValue + "']");
    if (inputToDelete) {
        form.removeChild(inputToDelete);
    }
    
}

// 게시글 등록
$(function(){
	$('#pfForm').submit(function(e){
		// 제목, 내용 입력값에서 앞뒤 공백 제거
		let titleValueAfterTrim = $('.pfFormTitle').val().trim();
		let contentValueAfterTrim = $('.pfFormContent').val().trim();
		let plantsNameValueAfterTrim = $('.pfPlantsName').val().trim();
		
		// 파일명 (servlet에서 받기 위한 input=[type=file] 태그)
		let fileName = $('#pfFileforwrite').val();
		
		// 앞뒤 공백 제거된 제목, 내용으로 값이 제출되도록 다시 지정
		$('.pfFormTitle').val(titleValueAfterTrim);
		$('.pfFormContent').val(contentValueAfterTrim);
		$('.pfPlantsName').val(plantsNameValueAfterTrim);
		
		if(titleValueAfterTrim=="" || contentValueAfterTrim=="" || plantsNameValueAfterTrim=="") {
			Swal.fire({
				title:'입력란을 다시 확인해주세요.',
				icon:'warning',
				confirmButtonColor:'orange'
			});
			e.preventDefault();
		} else {
			if(fileName==null || fileName=="") {
				Swal.fire({
					title:'글을 등록하기 위해서 첨부파일을 선택해주세요.',
					icon:'warning',
					confirmButtonColor: 'orange'
				});
				e.preventDefault();
			} else {
				e.preventDefault();
				Swal.fire({
					title:'게시글 등록 완료',
					icon:'success',
					confirmButtonColor: 'orange'
				}).then((result) => {
					if(result.isConfirmed) {
						document.getElementById('pfForm').submit();
					}
				});
			}
		}
	});
});

// 게시글 수정
$(function(){
	$('#peForm').submit(function(e){
		// 제목, 내용 입력값에서 앞뒤 공백 제거
		let titleValueAfterTrim = $('.peFormTitle').val().trim();
		let contentValueAfterTrim = $('.peFormContent').val().trim();
		let plantsNameValueAfterTrim = $('.pePlantsName').val().trim();
		
		// 앞뒤 공백 제거된 제목, 내용으로 값이 제출되도록 다시 지정
		$('.peFormTitle').val(titleValueAfterTrim);
		$('.peFormContent').val(contentValueAfterTrim);
		$('.pePlantsName').val(plantsNameValueAfterTrim);
		
		if(titleValueAfterTrim=="" || contentValueAfterTrim=="" || plantsNameValueAfterTrim=="") {
			Swal.fire({
				title:'입력란을 다시 확인해주세요.',
				icon:'warning',
				confirmButtonColor:'orange'
			});
			e.preventDefault();
		} else {
			e.preventDefault();
			Swal.fire({
				title:'게시글 수정 완료',
				icon:'success',
				confirmButtonColor: 'orange'
			}).then((result) => {
				if(result.isConfirmed) {
					document.getElementById('peForm').submit();
				}
			});
		}
	});
});

// 게시글 삭제
function pdRemovePoolentarier(no) {
	Swal.fire({
		title: '게시글을 삭제하시겠습니까?',
		text:'삭제 후 복구가 불가능합니다.',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#orange', // confrim 버튼 색깔 지정
      	cancelButtonColor: '#466b55', // cancel 버튼 색깔 지정
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


// poolentarierDetail

// 댓글 삭제
function pdRemoveComment(commentNo, postNo) {
	Swal.fire({
		title: '댓글을 삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		confirmButtonColor: '#orange', // confrim 버튼 색깔 지정
      	cancelButtonColor: '#466b55', // cancel 버튼 색깔 지정
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
	// 풀랜테리어 댓글 입력 취소 버튼
	// input[type=reset]을 눌렀을때 기본동작으로는 입력값을 제거하면서 reset버튼을 다시 비활성화상태로 바꿔주지 않으므로 명시적으로 수행하게함
	$('#pdResetCommentbtn').click(function() {
    	$('#pdCommentValue').val(''); // 입력값 지우기
    	$('#pdCommentValidationMsg').text(''); // 유효성 검사
    	this.disabled = true; // 리셋버튼 비활성화
    	$('#pdResetCommentbtn')[0].classList.remove('pdResetBtnEnable'); // css를 위한 클래스 속성 또한 지움
	});
	
	// 풀랜테리어 게시글
	// 댓글 유효성 검사
	$('#pdCommentForm').submit(function(event) {
		let commentValue = $("#pdCommentValue").val().trim();
		$("#pdCommentValue").val(commentValue); 
		if(commentValue === "") {
			Swal.fire({
				title:'댓글 입력값을 확인해주세요.',
				icon:'warning',
				confirmButtonColor: 'orange'
			});
			event.preventDefault();
		}
	});
	
	// 풀랜테리어 목록
	// 검색바 유효성 검사
    $('#plSearchForm').submit(function(event) {
        let searchText = $("#plSearchText").val().trim();
        // 수행1. trim된 값을 검색어 input 태그에 value로 넣어줌
        $("#plSearchText").val(searchText); 
        // 수행2. null값 검색 제출을 막음 - 404에러 방지
        if (searchText === "") {
            // console.log("검색옵션 혹은 검색어가 없으므로 기본제출이 막아짐");
            event.preventDefault();
        }
    });
    
    // 풀랜테리어 작성폼
    // 커스텀한 파일선택 버튼에 선택된 파일명 표시(input태그의 value값 넣기)
	$("#pfFileforwrite").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".pfSelectedFileName").val(selectedFileName);
	});
    
    // 풀랜테리어 수정폼
    // 커스텀한 파일선택 버튼에 선택된 파일명 표시(input태그의 value값 넣기)
    $("#peFileforedit").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".peSelectedFileName").val(selectedFileName);
	});
    
    // 풀랜테리어 작성폼
    // 제목 유효성 검사
    $('.pfTitleValidationMsg').text('');
    $('.pfFormTitle').keyup(function(e) {
        let titleValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.pfTitleValidationMsg');

        if(titleValue.length > 98) {
        	// console.log('제목 유효성검사에 걸림...');
            validationMsg.text('제목은 100자를 초과할 수 없습니다');
        }
        if(titleValue.length <= 98) {
			validationMsg.text('');
		}
    });
    
    // 풀랜테리어 수정폼
    // 제목 유효성 검사
    $('.peTitleValidationMsg').text('');
    $('.peFormTitle').keyup(function(e) {
        let titleValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.peTitleValidationMsg');

        if(titleValue.length > 98) {
            // console.log('제목 유효성검사에 걸림...');
            validationMsg.text('제목은 100자를 초과할 수 없습니다');
        }
        if(titleValue.length <= 98) {
			validationMsg.text('');
		}
    });
    
    // 풀랜테리어 작성
    // 내용 유효성 검사
    $('.pfContentValidationMsg').text('');
    $('.pfFormContent').keyup(function(e) {
        let contentValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.pfContentValidationMsg');

        if(contentValue.length > 1998) {
            // console.log('내용 유효성검사에 걸림...');
            validationMsg.text('내용은 최대 2000자까지 작성하실 수 있습니다');
        }
        if(contentValue.length <= 1998) {
			validationMsg.text('');
		}
    });
    
    // 풀랜테리어 수정
    // 내용 유효성 검사
    $('.peContentValidationMsg').text('');
    $('.peFormContent').keyup(function(e) {
        let contentValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.peContentValidationMsg');

        if(contentValue.length > 1998) {
            // console.log('내용 유효성검사에 걸림...');
            validationMsg.text('내용은 최대 2000자까지 작성하실 수 있습니다');
        }
        if(contentValue.length <= 1998) {
			validationMsg.text('');
		}
    });
    
    // 풀풀박사 작성폼
    // 업로드이미지 미리보기(파일을 읽어서 img태그에 표시)
    $('#pfFileforwrite').change(function () {
		// console.log('이미지input값 변경됨...');
		
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
    // 업로드이미지 미리보기(파일을 읽어서 img태그에 표시)
    $('#peFileforedit').change(function () {
		// 기존 이미지를 표시하는 img태그가 보여지지 않도록 속성 추가
		$('#peFormImgExisting').attr("style", "display: none"); 
		
        let uploadImg = this;
        let uploadImgPreview = $('.peFormImgPreview');

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