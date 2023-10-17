<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>

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
		
		
		
			<img src="static/img/error.png" style="border-radius: 20px"
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