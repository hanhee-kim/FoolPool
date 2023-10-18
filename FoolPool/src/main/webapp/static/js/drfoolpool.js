/* 풀풀박사 작성, 수정 - 취소 버튼 */
function drFPback() {
	// history.go(-1);
    history.back();
}

/* 풀풀박사 상세 - 목록 버튼 */
function drFPbackToList(no) {
	console.log("drFPbackToList 호출...");
	window.location.href = "goDrFoolPool";
}

/* swal.fire()로 변경 */
/* 풀풀박사 상세 - 삭제 버튼 */
function drFPdelete(no, prevpage, filter, sOption, sValue) {
	console.log('-------');
	Swal.fire({
		title: '게시글을 삭제하시겠습니까?',
		text: '삭제후엔 게시글의 복구가 불가능합니다.',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: 'orange',
		cancelButtonColor: '#466b55',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if(result.isConfirmed) {
			if(sOption!=null && sValue!=null) {
				location.href="drFoolPoolDelete?no=" + no + "&prevpage=" + prevpage + "&filter=" + filter + "&sOption=" + sOption + "sValue=" + sValue;
			} else {
				location.href="drFoolPoolDelete?no=" + no + "&prevpage=" + prevpage + "&filter=" + filter;
			}
		}
	})
	
	/*console.log("drFPdelete 호출...");
	if (confirm("게시글을 삭제하시겠습니까?") == true){ 
		window.location.href = "drFoolPoolDelete?no=" + no + "&prevpage=" + prevpage;
	 }*/
}

/* 풀풀박사 상세 - 수정 버튼 */
function drFPedit(no) {
	console.log("drFPedit 호출...");
	window.location.href = "editDrFoolPool?no=" + no;
}

/* 풀풀박사 댓글 삭제 버튼 */
function drFPCommDelete(commentNo, postNo) {
	console.log("dfFPCommdelete 호출...");
	if (confirm("댓글을 삭제하시겠습니까?") == true){ 
		window.location.href = "deldrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
	 }
}
/* 풀풀박사 댓글 채택 버튼 */
function drFPCommPick(commentNo, postNo) {
	console.log("drFPCommPick 호출...");
	if (confirm("이 댓글을 채택하시겠습니까?") == true){ 
		window.location.href = "pickdrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
	 }
}

/* 풀풀박사 댓글 유효성 검사 메시지 추가 */
function drFPcommentValidation() {
	let commentValue = $('#drFP-commentValue').val();
	let validationMsg = $('#drFP-commentValidationMsg');
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



$(document).ready(function() {
	/* 풀풀박사 목록 - 검색바 유효성 검사 */
    $('#drFP-searchForm').submit(function(event) {
        let sOption = $("#drFP-sOption").val();
        let sValue = $("#drFP-sValue").val().trim();
        // 수행1. trim된 값을 검색어input태그에 value로 넣어줌
        $("#drFP-sValue").val(sValue); 
        // 수행2. null값 검색제출을 막음 - 404에러 방지
        if (sOption === "unselected" || sValue === "") {
            console.log("검색옵션 혹은 검색어가 없으므로 기본제출이 막아짐");
            event.preventDefault();
        }
    });
    
    /* 풀풀박사 작성폼 - 커스텀한 파일선택 버튼에 선택된 파일명 표시(input태그의 value값 넣기) */
	$("#drFP-fileforwrite").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".drFP-selectedFileName").val(selectedFileName);
	});
	$("#drFP-fileforedit").on('change', function () {
	    let selectedFileName = $(this).val();
	    $(".drFP-selectedFileName").val(selectedFileName);
	});
    
	/* 풀풀박사 작성폼, 수정폼 - 파일선택 유효성 검사 (커스텀버튼을 사용하기 위해 파일input에 display=none스타일이 적용했기때문에 required속성 사용하여 체크하지 못함) */
    $('.drFP-form').submit(function(event) {
        let fileName = $(".drFP-selectedFileName").val();
        if (fileName=='첨부파일 미선택') {
            console.log("파일이 선택되지 않았으므로 기본제출이 막아짐"); // 404에러 방지
            alert('글을 등록하기 위해서 첨부파일을 선택해주세요.');
            event.preventDefault();
        }
    });
    
    /* 풀풀박사 작성폼 - 제목 유효성 검사 */
    $('.drFP-titleValidationMsg').text('');
    $('.drFP-formTitle').keyup(function(e) {
        let titleValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.drFP-titleValidationMsg');

        if(titleValue.length > 98) {
            console.log('제목 유효성검사에 걸림...');
            validationMsg.text('제목은 100자를 초과할 수 없습니다');
        }
        if(titleValue.length <= 98) {
			validationMsg.text('');
		}
    });
    
    /* 풀풀박사 작성 - 내용 유효성 검사 */
    $('.drFP-contentValidationMsg').text('');
    $('.drFP-formContent').keyup(function(e) {
        let contentValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.drFP-contentValidationMsg');

        if(contentValue.length > 1998) {
            console.log('내용 유효성검사에 걸림...');
            validationMsg.text('내용은 최대 2000자까지 작성하실 수 있습니다');
        }
        if(contentValue.length <= 1998) {
			validationMsg.text('');
		}
    });
    
    
    
    // 풀풀박사 작성폼, 수정폼 - 업로드이미지 미리보기(파일을 읽어서 img태그에 표시)
    $('#drFP-fileforwrite').change(function () {
		console.log('이미지input값 변경됨...');
		
        let uploadImg = this;
        let uploadImgPreview = $('.drFP-formImgPreview');

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
    $('#drFP-fileforedit').change(function () {
		// 기존 이미지를 표시하는 img태그가 보여지지 않도록 속성 추가
		$('#drFP-formImgExisting').attr("style", "display: none"); 
		
        let uploadImg = this;
        let uploadImgPreview = $('.drFP-formImgPreview');

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




