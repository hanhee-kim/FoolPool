<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeFormWrapper">
	<article class="noticeFormmove-up" >
	
	<!--  form 태그 써야함  -->
	<form action="./noticeform" method="post" name="noticeform" class="noticeForm">
	
	<h2 class="noticetitle">작성자</h2>
	<input name="writer_id" type="text" id="noticetitlewrite", class="noticeFormWriter"
       readonly="readonly" value="admin" />
	<h2 class="noticetitle">제목</h2>
	<input name="title" type="text" id="noticetitlewrite", class="noticeFormTitle"
        maxlength="30" ,required="required", placeholder="your title*" />
	<h2 class="titlewrite">작성 내용</h2>
	<textarea name="content" id="revised" placeholder="your text*" required="required" class="noticeFormText" ></textarea>
	<input type="submit" value="등록" class="noticeFormBtn"/>&nbsp;&nbsp; 
	</form>
	</article>
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