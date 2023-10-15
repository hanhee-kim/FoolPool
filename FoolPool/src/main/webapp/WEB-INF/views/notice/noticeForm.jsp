<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeWrapper">
	
	<!--  form 태그 써야함  -->
	<form action="./noticeform" method="post" name="noticeform">
	<h2 class="noticetitle">작성자</h2>
	<input name="writer_id" type="text" id="noticetitlewrite",
       readonly="readonly" value="admin" />
	<h2 class="noticetitle">제목</h2>
	<input name="title" type="text" id="noticetitlewrite",
        maxlength="50" ,required="required", placeholder="your title*" />
	<h2 class="titlewrite">작성 내용</h2>
	<textarea name="content" id="revised" placeholder="your text*" required="required"></textarea>
	<input type="submit" value="등록" class="w-btn-green"/>&nbsp;&nbsp; 
	</form>
	</div>
	



<div class="notice-BottomBorder"></div>

</div>
<%-- notice-DivLine --%>


</div>
<%-- containerChild --%>
</div>
<%-- container --%>
</body>

</html>