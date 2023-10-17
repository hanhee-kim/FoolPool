/**
 join js
 */
var isIdCheck = false;
var isNicknameCheck = false;
var isPasswordMatched = false;
var isIdEffec = false;
var isNicknameEffec = false;

//로그인시 아이디,닉네임 8글자까지 아이디는 영문,숫자만
$(function() {
	//id 중복버튼 클릭시
	$("#idDuplicateCheck").click(function() {
		$.ajax({
			url: "idcheck",
			type: "post",
			data: { id: $("#joinMemberId").val() },
			success: function(res) {

				if (res == "notexist") {
					isIdCheck = true;
					Swal.fire({
						title: '사용가능한 아이디입니다.',
						icon: 'success'
					});
				} else {
					Swal.fire({
						title: '아이디가 중복됩니다.',
						icon: 'warning'
					});
				}

			},
			error: function(err) {
				console.log(err);
				Swal.fire({
					title: '아이디 중복체크 오류.',
					icon: 'error'
				});
			}
		});
	});//아이디 중복확인

	//아이디값 바뀔시
	$("#joinMemberId").change(function() {
		isIdCheck = false;
	});

	//닉네임 중복체크 클릭시
	$("#nicknameDuplicateCheck").click(function() {
		$.ajax({
			url: "nicknamecheck",
			type: "post",
			data: { nickname: $("#joinMemberNickname").val() },
			success: function(res) {

				if (res === "notexist") {
					isNicknameCheck = true;
					Swal.fire({
						title: '사용가능한 닉네임입니다.',
						icon: 'success'
					});
				} else {
					Swal.fire({
						title: '닉네임이 중복됩니다.',
						icon: 'warning'
					});
				}

			},
			error: function(err) {
				console.log(err);
				Swal.fire({
					title: '닉네임 중복체크 오류.',
					icon: 'error'
				});
			}
		});
	});//닉네임 중복확인

	//닉네임값 바뀔시
	$("#joinMemberNickname").change(function() {
		isNicknameCheck = false;
	});

	//가입 누를 시
	$("#joinForm").submit(function(e) {
		//기본 submit 동작 막아놈
		e.preventDefault();
		if (isIdCheck == false) {
			Swal.fire({
				title: '아이디 중복체크를 해주세요.',
				icon: 'warning'
			});
		}
		else {
			if (isNicknameCheck == false) {
				Swal.fire({
					title: '닉네임 중복체크를 해주세요.',
					icon: 'warning'
				});
			}
			else {
				if (isPasswordMatched == false) {
					Swal.fire({
						title: '비밀번호를 확인해주세요.',
						icon: 'warning'
					});
				} else if(isIdEffec == false){
					Swal.fire({
						title: 'ID를 확인해주세요.',
						text: 'ID는 영문,숫자 4~8자만 가능합니다.',
						icon: 'warning'
					});
				} else if(isNicknameEffec == false){
					Swal.fire({
						title: '닉네임을 확인해주세요.',
						text: '닉네임은 특수문자를 제외한 8자까지 가능합니다.',
						icon: 'warning'
					});
				} else {
					Swal.fire({
						title: '회원가입 완료!',
						text: '회원가입이 완료되었습니다.',
						icon: 'success',
						closeOnClickOutside: false
					}).then(function(result) {
						if (result.isConfirmed) {
							// 확인 버튼을 눌렀을 때, form을 수동으로 제출
							document.getElementById('joinForm').submit();
						}
					})
				}
			}
		}
	});//join폼누를시
	
	//join_reset누를시 (div에 띄운 validation MSG삭제)
	var elementId = document.getElementById('idEffecMessage');
	var elementNick = document.getElementById('nicknameEffecMessage');
	var elementPass = document.getElementById('passwordMatchMessage');
	document.getElementById('joinReset').addEventListener('click',function() {
  		elementId.innerHTML = '';
  		elementNick.innerHTML = '';
  		elementPass.innerHTML = '';
		})

});//document.ready(function)
//비밀번호 확인
function checkPasswordMatch() {
	var password = document.getElementById("joinMemberPassword").value;
	var confirmPassword = document.getElementById("joinMemberPasswordCheck").value;
	var message = document.getElementById("passwordMatchMessage");

	if (password === confirmPassword) {
		message.innerHTML = "비밀번호가 일치합니다.";
		message.style.color = "#acacff";
		isPasswordMatched = true;
	} else {
		message.innerHTML = "비밀번호가 일치하지않습니다.";
		message.style.color = "#ff9393";
		isPasswordMatched = false;
	}
}

//id 유효성검사
var idRegExp = /^[a-zA-Z0-9]{4,8}$/;
function checkIdEffec() {
	var id = $('#joinMemberId').val();
	var message = document.getElementById('idEffecMessage');
	if (idRegExp.test(id)) {
		isIdEffec = true;
		message.innerHTML = '사용가능한 ID입니다!';
		message.style.color = "#acacff";

	} else {
		isIdEffec = false;
		message.innerHTML = "사용불가한 ID입니다.";
		message.style.color = "#ff9393";
	}
}
var nickRegExp = /^[a-zA-Z0-9가-힣]{2,8}$/;
//nickname 유효성검사
function checkNickEffec() {
	var nick = $('#joinMemberNickname').val();
	var message = document.getElementById('nicknameEffecMessage');
	if (nickRegExp.test(nick)) {
		isNicknameEffec = true;
		message.innerHTML = '사용가능한 닉네임입니다!';
		message.style.color = "#acacff";
	} else {
		isNicknameEffec = false;
		message.innerHTML = "사용불가한 닉네임입니다.";
		message.style.color = "#ff9393";
	}

}




