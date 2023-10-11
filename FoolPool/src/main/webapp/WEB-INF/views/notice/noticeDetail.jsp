<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<div class="noticeWrapper">
   <article class="noticemove-up">
   
         <table class="noticeDetailView">
            <tr>
               <td class="td_left"><label for="subject">제목</label></td>
               <td class="td_right"><input name="subject" type="text" id="subject" readonly="readonly" value="${notice.subject}"/></td>
            </tr>
            <tr>
               <td class="td_left"><label for="writer">등록일</label></td>
               <td class="td_right"><input type="text" name="date" id="date" readonly="readonly" value="${notice.date}"/></td>
            </tr>
            <tr>
               <td class="td_left"><label for="content">내용</label></td>
               <td><textarea id="content" name="content" readonly="readonly" cols="40" rows="15">${notice.content}</textarea></td>
            </tr>

         
         </table>
         
           <div class="noticebtn_list">
           <!-- ADMIN일때만 수정,삭제 버튼 보임. -->
           <c:if test="${notice.writer =='ADMIN' }">
            <a href="noticeFormEdit.jsp">수정</a>&nbsp;&nbsp;</c:if>
            <a href=notice>목록</a>&nbsp;&nbsp;
             <c:if test="${notice.writer =='ADMIN' }">
            <a href="./noticeList.jsp" id="delOk">삭제</a></c:if>
            </div>
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