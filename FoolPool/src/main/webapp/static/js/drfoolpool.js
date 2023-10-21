/* 풀풀박사 작성, 수정 - 취소 버튼 */
function drFPback() {
	// history.go(-1);
    history.back();
}

/* 풀풀박사 작성, 수정 - 등록 버튼(input[type=submit]) 클릭시 동작 */
$(function(){
	$('#drFP-writeform').submit(function(e){
		// 기본제출 동작을 막고 swal 띄운뒤 확인버튼 클릭시 제출되도록 함
		e.preventDefault();
		Swal.fire({
			title:'게시글 등록 완료',
			icon:'success',
			confirmButtonColor: 'orange'
		}).then((result) => {
			if(result.isConfirmed) {
				document.getElementById('drFP-writeform').submit();
			}
		});
	});
});
$(function(){
	$('#drFP-editform').submit(function(e){
		// 기본제출 동작을 막고 swal 띄운뒤 확인버튼 클릭시 제출되도록 함
		e.preventDefault();
		Swal.fire({
			title:'게시글 수정 완료',
			icon:'success',
			confirmButtonColor: 'orange'
		}).then((result) => {
			if(result.isConfirmed) {
				document.getElementById('drFP-editform').submit();
			}
		});
	});
});

/* 풀풀박사 상세 - 목록 버튼 (글수정 후에는 이전목록으로, 글작성 후에는 초기목록으로 이동) */
function drFPbackToList() {
	var page = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-page");
	var filter = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-filter");
	var sOption = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sOption");
	var sValue = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sValue");
	
	// alert("목록가기 page:"+page+",filter:"+filter+",sOption:"+sOption+",sValue:"+sValue);
	if(sOption!=null && sValue!=null && sOption!='' && sValue!='') {
		location.href="goDrFoolPool?page=" + page + "&filter=" + filter + "&sOption=" + sOption + "&sValue=" + sValue;
	} else {
		location.href="goDrFoolPool?page=" + page + "&filter=" + filter;
	}
}

/* 풀풀박사 상세 - 삭제 버튼 */
function drFPdelBtnfunction() {
	var no = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-no");
	var page = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-page");
	var filter = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-filter");
	var sOption = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sOption");
	var sValue = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sValue");
	// alert("no:"+no+",page:"+page+",filter:"+filter+",sOption:"+sOption+",sValue:"+sValue);
	Swal.fire({
		title: '게시글을 삭제하시겠습니까?',
		text: '삭제된 게시글은 복구가 불가능합니다.',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: 'orange',
		cancelButtonColor: '#466b55',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if(result.isConfirmed) {
			// alert('no:'+no+",page:"+page+",filter:"+filter+",sOption:"+sOption+",sValue:"+sValue);
			if(sOption!=null && sValue!=null && sOption!='' && sValue!='') {
				location.href="drFoolPoolDelete?no=" + no + "&page=" + page + "&filter=" + filter + "&sOption=" + sOption + "&sValue=" + sValue;
			} else {
				location.href="drFoolPoolDelete?no=" + no + "&page=" + page + "&filter=" + filter;
			}
		}
	});
}


/* 풀풀박사 상세 - 수정 버튼 */
function drFPedit(no) {
	// 1) var가 아닌 let으로 선언시 에러
	// 2) 순수JS문법으로는 검색값이 undefined가 아니지만 제이쿼리로는 undefined가 변수에 저장됨
	var no = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-no");
	var page = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-page");
	var filter = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-filter");
	var sOption = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sOption");
	var sValue = document.getElementsByClassName("drFP-detail-hiddenrow")[0].getAttribute("data-sValue");
	/*
	var no = $(".drFP-detail-hiddenrow").eq(0).data("no");
	var page = $(".drFP-detail-hiddenrow").eq(0).data("page");
	var filter = $(".drFP-detail-hiddenrow").eq(0).data("filter");
	var sOption = $(".drFP-detail-hiddenrow").eq(0).data("sOption");
	var sValue = $(".drFP-detail-hiddenrow").eq(0).data("sValue");
	*/
	
	 // alert('no:'+no+", page:"+page+",filter:"+filter+",sOption:"+sOption+",sValue:"+sValue);
	if(sOption!=null && sValue!=null && sOption!='' && sValue!='') {
		location.href="editDrFoolPool?no=" + no + "&page=" + page + "&filter=" + filter + "&sOption=" + sOption + "&sValue=" + sValue;
	} else {
		location.href="editDrFoolPool?no=" + no + "&page=" + page + "&filter=" + filter;
	}
}

/* 풀풀박사 댓글 삭제 버튼 */
function drFPCommDelete(commentNo, postNo) {
	Swal.fire({
		title: '댓글을 삭제하시겠습니까?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: 'orange',
		cancelButtonColor: '#466b55',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if(result.isConfirmed) {
			location.href = "deldrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
		}
	});
}
/* 풀풀박사 댓글 채택 버튼 */
function drFPCommPick(commentNo, postNo) {
	Swal.fire({
		title: '댓글을 채택하시겠습니까?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: 'orange',
		cancelButtonColor: '#466b55',
		confirmButtonText: '채택',
		cancelButtonText: '취소'
	}).then((result) => {
		if(result.isConfirmed) {
			location.href = "pickdrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
		}
	});
}

/* 풀풀박사 댓글 유효성 검사 메시지 추가 */
function drFPcommentValidation() {
	let commentValue = $('#drFP-commentValue').val();
	let validationMsg = $('#drFP-commentValidationMsg');
	const resetCommentbtn = $('#drFP-resetCommentbtn')[0];
	
	// 입력값이 생기면 input[type=reset] 버튼의 비활성화속성을 제거
	if(commentValue.length>0) {
		resetCommentbtn.disabled = false;
		resetCommentbtn.classList.add('drFP-resetBtnEnable'); // css 적용을 위해 클래스속성을 동적으로 추가
		
		/*
		let resetBtn = document.querySelector('.drFP-resetBtnEnable');
		resetBtn.addEventListener('mouseover', function() {
		  resetBtn.style.backgroundColor = 'orange';
		  resetBtn.style.border = 'none';
		});
		resetBtn.addEventListener('mouseout', function() {
		  resetBtn.style.backgroundColor = '#e0f4de';
		});
		*/
		
	} else {
		resetCommentbtn.disabled = true;
		resetCommentbtn.classList.remove('drFP-resetBtnEnable');
	}
	
	if(commentValue.includes('나쁜말')) {
		validationMsg.text('댓글에 비속어 사용을 자제해주세요');
	}
	if(commentValue.length>198) {
		validationMsg.text('댓글은 최대 200자까지 작성하실 수 있습니다');
	}
	if(commentValue.length<=198) {
		validationMsg.text('');
	}
}



$(document).ready(function() {
	
	// 댓글 입력취소 버튼(input[type=reset])을 눌렀을때 기본동작으로는 입력값을 제거하면서 reset버튼을 다시 비활성화상태로 바꿔주지 않으므로 명시적으로 수행하게함
	$('#drFP-resetCommentbtn').click(function() {
    	$('#drFP-commentValue').val(''); // 입력값 지우기
    	$('#drFP-commentValidationMsg').text(''); // 유효성검사 메시지가 있었다면 지우기
    	this.disabled = true; // 리셋버튼 비활성화
    	$('#drFP-resetCommentbtn')[0].classList.remove('drFP-resetBtnEnable'); // css를 위한 클래스속성 또한 지운다
	});
	
	// 댓글등록 버튼(input[type=submit])을 눌렀을때 
	$('#drFP-commentForm').submit(function(event) {
		let valueAfterTrim = $('#drFP-commentValue').val().trim();
		// 공백값만 댓글로 등록되지 않게 기본동작을 막고 안내해준다
		if(valueAfterTrim === "") {
            Swal.fire({
				title:'댓글 입력값을 확인해주세요.',
				icon:'warning',
				confirmButtonColor: 'orange'
			});
			event.preventDefault();
		}
	})
	
	/* 풀풀박사 목록 - 검색바 유효성 검사 */
    $('#drFP-searchForm').submit(function(event) {
        let sValue = $("#drFP-sValue").val().trim();
        
        // 수행1. trim된 값을 검색어input태그에 value로 넣어줌
        $("#drFP-sValue").val(sValue); 
        
        // 수행2. null값 검색제출을 막음 - 404에러 방지
        if (sValue === "") {
			Swal.fire({
				title:'검색어를 입력해주세요.',
				icon:'warning',
				confirmButtonColor: 'orange'
			});
			
            // console.log("검색옵션 혹은 검색어가 없으므로 기본제출이 막아짐");
            event.preventDefault();
        }
    });
    
    
    
    /* 풀풀박사 작성폼 - 선택파일을 바꿀때마다 호출 */
	$("#drFP-fileforwrite").on('change', function () {
		// 파일 선택 취소시 미리보기 이미지 안보이게함 
		let fileName = $("#drFP-fileforwrite").val();
		if(fileName == '첨부파일 미선택' || fileName == "") {
			$('.drFP-formImgPreview').attr("style", "display: none");
		}
		// 선택된 파일명 표시용 input태그의 value로 넣어줌 
	    let selectedFileName = $(this).val();
	    $(".drFP-selectedFileName").val(selectedFileName);
	});
	$("#drFP-fileforedit").on('change', function () {
		// 선택된 파일명 표시용 input태그의 value로 넣어줌 
	    let selectedFileName = $(this).val();
	    $(".drFP-selectedFileName").val(selectedFileName);
	});
	
    
    
	/* 풀풀박사 작성폼 - 파일선택 유효성 검사 (커스텀버튼을 사용하기 위해 파일input에 display=none스타일이 적용했기때문에 required속성 사용하여 체크하지 못함) */
    $('#drFP-writeform').submit(function(event) {
		//let fileName = $(".drFP-selectedFileName").val(); // 선택된 파일명 표시용 input태그
        let fileName = $("#drFP-fileforwrite").val(); // display:none인 input[type=file]태그
		
        // if (fileName=='첨부파일 미선택' || fileName=="") {
        if (fileName==null || fileName=="") {
			Swal.fire({
				title:'글을 등록하기 위해서 첨부파일을 선택해주세요.',
				icon:'warning',
				confirmButtonColor: 'orange'
			});
			event.preventDefault();
			// 파일미선택시 기본제출을 막아 404에러 방지
        }
    });
    
    /* 풀풀박사 작성폼 - 제목 유효성 검사 */
    $('.drFP-titleValidationMsg').text('');
    $('.drFP-formTitle').keyup(function(e) {
        let titleValue = $(this).val(); // 현재 입력된 제목 가져오기
        let validationMsg = $('.drFP-titleValidationMsg');

        if(titleValue.length > 98) {
            // console.log('제목 유효성검사에 걸림...');
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
            // console.log('내용 유효성검사에 걸림...');
            validationMsg.text('내용은 최대 2000자까지 작성하실 수 있습니다');
        }
        if(contentValue.length <= 1998) {
			validationMsg.text('');
		}
    });
    
    
    
    // 풀풀박사 (1)작성폼, (2)수정폼 - 업로드이미지 미리보기(파일을 읽어서 img태그에 표시)
    $('#drFP-fileforwrite').change(function () {
		// console.log('이미지input값 변경됨...');
		
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
    // (2)수정폼
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
    
    
    
}); //$(document).ready()




