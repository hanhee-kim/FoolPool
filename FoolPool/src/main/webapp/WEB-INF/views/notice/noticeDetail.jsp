<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>
<c@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core">


<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeWrapper">
   <article class="noticemove-up">
   
         <table class="noticeDetailView">
            <tr>
               <td class="td_left"><label for="subject">제목</label></td>
               <td class="td_right"><input name="subject" type="text" id="title" readonly="readonly"  value="${notice.title }"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="date">등록일</label></td>
               <td class="td_right"><input type="text" name="date" id="date" readonly="readonly" value="${notice.date }" ></td>
            </tr>
            <tr>
               <td class="td_left"><label for="content">내용</label></td>
               <td><textarea id="content" name="content"  readonly="readonly"cols="40" rows="15" >${notice.content }</textarea></td>
            </tr>

         </table>
         
           <div class="noticebtn_list">
           <%-- ADMIN일때만 수정,삭제 버튼 보임.<c:if test="${notice.writer =='ADMIN' }">  </c:if> --%>
          
            
            <c:if test="${member.role == 'ADMIN' }"> 
            <a href="noticeformedit?no=${notice.no}">수정</a>&nbsp;&nbsp;</c:if>
            <%--<a href=noticeformedit>수정</a>&nbsp;&nbsp;--%>
            <a href=notice>목록</a>&nbsp;&nbsp;

				<c:if test="${member.role == 'ADMIN' }"> 
					<a href="noticedelete?no=${notice.no }"
						id="delOk">삭제</a></c:if>
				

				<%--<a href="noticedelete?no=${notice.no}&page=${res.pageInfo.curPage}" id="delOk">삭제</a> --%>
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