<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
            <div class="loginFormBox">
                <form action="login" method="post" class="loginForm">
                    <div class="loginTitle">로그인</div>
                    <div class="loginLabelText">
                        <div class="loginLabel">아이디</div>
                        <input type="text" class="loginText" id="loginMemberId" name="loginMemberId" required="required">

                    </div>
                    <div class="loginLabelText">
                        <div class="loginLabel">비밀번호</div>
                        <input type="password" class="loginText" id="loginMemberPassword" name="loginMemberPassword" required="required">                        
                    </div>
                    <div class="loginBtnDiv">
                        <input type="submit" class="boxBtn loginSubmitBtn" value="확인">
                        <input type="reset" class="boxBtn loginResetBtn" value="취소">
                    </div>
                </form>
                
            </div>
        </div>
    </div>
</body>
</html>