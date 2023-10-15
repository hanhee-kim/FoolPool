<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>

<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="notice-Label">공지사항</div>

	<div class="notice-DivLine">

		<div class="notice-TopBorder"></div>
		<%=request.getAttribute("err")%>
		
		<b>예외타입</b>: <%=exception.getClass().getName()%><br>
		<b>예외메세지</b>: <%=exception.getMessage()%><br>
		<div class="errorpage">
			<img src="static/img/404.png" style="border-radius: 20px"
				alt="error 페이지입니다." />






			<div class="notice-BottomBorder"></div>

		</div>
		<%-- notice-DivLine --%>


	</div>
	<%-- containerChild --%>
	</div>
	<%-- container --%>



</body>
</html>