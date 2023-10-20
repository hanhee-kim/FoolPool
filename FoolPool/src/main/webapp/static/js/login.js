/**
 * login js
 */
$(function(){
	
	//로그인 확인 누를 시
	$("#loginForm").submit(function(e) {
		//기본 submit 동작 막아놈
		e.preventDefault();
		$.ajax({
			url:"loginCheck",
			type:"post",
			data:{"id":$("#loginMemberId").val(),"password":$("#loginMemberPassword").val()},
			success:function(res){
//				console.log("res: "+res+"res_type: "+typeof res);
				if(res == "noId"){
					Swal.fire({
						title:'ID가 일치하지 않습니다.',
						icon:'warning'
					});
					
				}else if(res == "noPW"){
					Swal.fire({
						title:'비밀번호가 일치하지 않습니다.',
						icon:'warning'
					});
					
				}else{
					Swal.fire({
						title:'로그인 되었습니다.',
						icon:'success',
					}).then(function(result){
						if (result.isConfirmed) {
				            // 확인 버튼을 눌렀을 때, form을 수동으로 제출
							document.getElementById('loginForm').submit();
				        }
					})
					
				}
			},//ajax-success
			error:function(err){
				console.log(err);
				Swal.fire({
					title:'로그인 오류.',
					icon:'error'
				});
			}//ajax-error
		})//ajax
	});//로그인폼 확인
});