<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<div class="joinBox">
                <form action="join" method="post" class="joinForm" id="joinForm">
                    <div class="joinTitle">회원가입</div>
                    <div class="joinLabelText">
                        <div class="joinLabel">아이디</div>
                        <input type="text" class="joinText" id="joinMemberId" name="joinMemberId" required="required">
                        <div class="joinMemberIdCheckBtn"><button class="joinDuplicateBtn" id="idDuplicateCheck">중복체크</button></div>
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">닉네임</div>
                        <input type="text" class="joinText" id="joinMemberNickname" name="joinMemberNickname" required="required">
                        <div class="joinMemberNicknameCheckBtn"><button class="joinDuplicateBtn" id="nicknameDuplicateCheck">중복체크</button></div>
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">비밀번호</div>
                        <input type="password" class="joinText" id="joinMemberPassword" name="joinMemberPassword" required="required">                        
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">비밀번호 확인</div>
                        <input type="password" class="joinText" id="joinMemberPasswordCheck" name="joinMemberPasswordCheck" required="required">
                        <div class="joinPasswordCheck">비밀번호가 일치하지않습니다.</div>
                    </div>
                    
                    <div class="joinBtnDiv">
                        <input type="submit" class="boxBtn joinSubmitBtn" value="가입">
                        <input type="reset" class="boxBtn joinResetBtn" value="취소">
                    </div>
                </form>
                
            </div>
        </div>
    </div>
    

<script type="text/javascript">
var isIdCheck = false;
var isNicknameCheck = false;
$(function(){
	//id 중복버튼 클릭시
	$("#idDuplicateCheck").click(function(){
		console.log(($('#joinMemberId').val()));
		$.ajax({
			url:"idcheck",
			type:"post",
			data:{id:$("#joinMemberId").val()},
			success:function(res) {
				console.log("res값: " + res + "\ntypeof res: " + typeof res);
				
				if(res=="notexist") { 
					isIdCheck = true;
					Swal.fire({
						title:'사용가능한 아이디입니다.',
						icon:'success'
					});
				} else {
					Swal.fire({
						title:'아이디가 중복됩니다.',
						icon:'warning'
					});
				}
				
			},
			error:function(err) {
				console.log(err);
				Swal.fire({
					title:'아이디 중복체크 오류.',
					icon:'error'
				});
			}
		});
	});
	//아이디값 바뀔시
	$("#joinMemberId").change(function() {
		console.log("입력한 id값: " + $("#joinMemberId").val());
		console.log("isIdCheck값: " + isIdCheck + "\ntypeof isIdCheck: " + typeof isIdCheck);
		isIdCheck = false;
	});
	
	//닉네임 중복체크 클릭시
	$("#nicknameDuplicateCheck").click(function(){
		$.ajax({
			url:"nicknamecheck",
			type:"post",
			data:{nickname:$("#joinMemberNickname").val()},
			success:function(res) {
				console.log("res값: " + res + "\ntypeof res: " + typeof res);
				// res는 서블릿에서 이 ajax요청에 대해 response.getWriter().print(memberService.nicknameCheck(id));로 응답한 값이다
				
				if(res==="notexist") { 
					isNicknameCheck = true;
					Swal.fire({
						title:'사용가능한 닉네임입니다.',
						icon:'success'
					});
				} else {
					Swal.fire({
						title:'닉네임이 중복됩니다.',
						icon:'warning'
					});
				}
				
			},
			error:function(err) {
				console.log(err);
				Swal.fire({
					title:'닉네임 중복체크 오류.',
					icon:'error'
				});
			}
		});
	});
	//닉네임값 바뀔시
	$("#joinMemberNickname").change(function() {
		console.log("입력한 닉네임값: " + $("#joinMemberNickname").val());
		console.log("isNicknameCheck값: " + isNicknameCheck + "\ntypeof isIdCheck: " + typeof isNicknameCheck);
		isNicknameCheck = false;
	});
	
	
	//가입 누를 시
	$("#joinForm").submit(function(e) {
		if(isIdCheck==false) {
			Swal.fire({
				title:'아이디 중복체크를 해주세요.',
				icon:'warning'
			});
			e.preventDefault();
		} 
		else {
			if(isNicknameCheck==false){
				Swal.fire({
					title:'닉네임 중복체크를 해주세요.',
					icon:'warning'
				});
				e.preventDefault();
			}
			else{
			Swal.fire({
				title:'회원가입 완료!',
				text:'회원가입이 완료되었습니다.',
				icon:'success',
				closeOnClickOutside:false
			});
			}
		}
	});
});

</script>
</body>
</html>