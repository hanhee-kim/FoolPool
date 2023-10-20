<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<div class="joinBox">
                <form action="join" method="post" class="joinForm" id="joinForm">
                    <div class="joinTitle">회원가입</div>
                    <div class="joinLabelText joinformDiv">
                        <div class="joinLabel">아이디</div>
                        <input type="text" class="joinText join_PH" id="joinMemberId" name="joinMemberId" required="required" onkeyup="checkIdEffec()" placeholder="ID는 영문,숫자 4~8자">
                        <div class="joinMemberIdCheckBtn"><button class="joinDuplicateBtn" id="idDuplicateCheck">중복체크</button></div>
                    </div>
                    <div id="idEffecMessage" class="joinformDiv joinCheckMsgDiv"></div>
                    <div class="joinLabelText joinformDiv">
                        <div class="joinLabel">닉네임</div>
                        <input type="text" class="joinText join_PH" id="joinMemberNickname" name="joinMemberNickname" required="required"  onkeyup="checkNickEffec()" maxlength="8" placeholder="특수문자 제외 최대 8자">
                        <div class="joinMemberNicknameCheckBtn"><button class="joinDuplicateBtn" id="nicknameDuplicateCheck">중복체크</button></div>
                    </div>
                    <div id="nicknameEffecMessage" class="joinformDiv joinCheckMsgDiv"></div>
                    <div class="joinLabelText joinformDiv">
                        <div class="joinLabel">비밀번호</div>
                        <input type="password" class="joinText" id="joinMemberPassword" name="joinMemberPassword" onkeyup="checkPasswordMatch()" required="required">                        
                    </div>
                    <div class="joinformDiv"></div>
                    <div class="joinLabelText joinformDiv">
                        <div class="joinLabel">비밀번호 확인</div>
                        <input type="password" class="joinText" id="joinMemberPasswordCheck" name="joinMemberPasswordCheck" onkeyup="checkPasswordMatch()" required="required">
                    </div>
                    <div class="joinPasswordCheck joinformDiv joinCheckMsgDiv" id="passwordMatchMessage"></div>
                    
                    <div class="joinBtnDiv">
                        <input type="submit" class="boxBtn joinSubmitBtn" value="가입">
                        <input type="reset" class="boxBtn joinResetBtn" id="joinReset" value="취소">
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</body>
</html>