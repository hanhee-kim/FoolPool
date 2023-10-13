<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>

<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeWrapper">
	
	<!--  form 태그 써야함  -->
	<form action="./noticeform" method="post" name="noticeform">
	<h2 class="noticetitle">제목</h2>
	<input name="noticetitlewrite" type="text" id="noticetitlewrite",
        maxlength="50" ,required placeholder="your title*" />
	<h2 class="titlewrite">작성 내용</h2>
	<textarea name="revised" id="revised" placeholder="your text*" required></textarea>
	<button class="w-btn-green" type="button">등록</button>
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