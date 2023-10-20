 /* noticeDetail  */
 function callBtn(num) {
		var keyword=$("#keyword").val();
		if(keyword!=null && keyword.trim()!=''){
			$('#page').val(num);
			$('#searchform').submit();
			return false;
		}
		return true;
	}

	
	$(document).ready(function() {
    $("#delOk").on("click", function(e) {
        e.preventDefault(); // 기본 동작 중지
		var notice_no = $('#noticeGetno').val();
        Swal.fire({
            title: '삭제하면 글 내용을 되돌릴 수 없습니다.',
            text: '정말 삭제 하시겠습니까??',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true,
        }).then(result => {
            if (result.isConfirmed) {
                // 서버로 삭제 요청 보내기 (AJAX)
                $.ajax({
                    type: "GET",
                    url: "noticedelete?no="+notice_no,
                    success: function(response) {
                        if (response!= null) {
                            Swal.fire('승인이 완료되었습니다.', 'success').then(result => {
                            	   // 만약 Promise리턴을 받으면,
                            	   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                            		   location.href="notice";
                            	      
                            	   }
                            	});;
                        } else {
                            Swal.fire('오류 발생', '삭제에 실패했습니다.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('서버 오류', '서버와 통신 중 오류가 발생했습니다.', 'error');
                    }
                });
            }
        });
    });
});