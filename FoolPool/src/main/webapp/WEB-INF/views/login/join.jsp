<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<div class="joinBox">
                <form action="join" method="post" class="joinForm">
                    <div class="joinTitle">회원가입</div>
                    <div class="joinLabelText">
                        <div class="joinLabel">아이디</div>
                        <input type="text" class="joinText" id="joinMemberId" name="joinMemberId" required="required">
                        <div class="joinMemberIdCheckBtn"><button class="joinDuplicateBtn">중복체크</button></div>
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">닉네임</div>
                        <input type="text" class="joinText" id="joinMemberNickname" name="joinMemberNickname" required="required">
                        <div class="joinMemberNicknameCheckBtn"><button class="joinDuplicateBtn">중복체크</button></div>
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">비밀번호</div>
                        <input type="password" class="joinText" id="joinMemberPassword" name="joinMemberPassword" required="required">                        
                    </div>
                    <div class="joinLabelText">
                        <div class="joinLabel">비밀번호 확인</div>
                        <input type="password" class="joinText" id="joinMemberPasswordCheck" name="joinMemberPasswordCheck" required="joinMemberPasswordCheck">
                        <div class="joinPasswordCheck">비밀번호가 일치하지않습니다.</div>
                    </div>
                    
                    <div class="joinBtnDiv">
                        <input type="submit" class="boxBtn joinSubmitBtn" value="확인">
                        <input type="reset" class="boxBtn joinResetBtn" value="취소">
                    </div>
                </form>
                
            </div>
        </div>
    </div>

</body>
</html>