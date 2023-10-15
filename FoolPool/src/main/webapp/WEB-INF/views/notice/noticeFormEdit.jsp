<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>

<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeWrapper">
	<article class="noticemove-up">
	
	<!-- form 태그 추가하기 -->
	<form action="./noticeformedit" method="post">
	
	<!-- 보여지지않는 hidden속성으로, 게시글 번호를 가지고 있어야함. -->
	<input type="hidden" name="no" value="${notice.no }"/>
	
	
	<table class="noticeDetailView">
            <tr>
               <td class="td_left"><label for="subject">제목</label></td>
               <td class="td_right"><input name="title" type="text" id="title"   value="${notice.title }"/></td>
            </tr>
            <tr>
               <td class="td_left"><label for="date">등록일</label></td>
               <td class="td_right"><input type="text" name="date" id="date" readonly="readonly" value="${notice.date }" /></td>
            </tr>
	<tr>
               <td class="td_left"><label for="content">내용</label></td>
               <td><textarea id="content" name="content" cols="40" rows="15" >${notice.content }</textarea></td>
            </tr>

         </table>
	
	
	<input type="submit" class="w-btn-green" id="w-btn-green" value="수정완료">
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