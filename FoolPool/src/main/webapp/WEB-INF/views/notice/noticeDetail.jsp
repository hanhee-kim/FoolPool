<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>


<div class="notice-Label">공지사항</div>

<div class="notice-DivLine">

	<div class="notice-TopBorder"></div>
	
	<div class="noticeDetailWrapper">
   <article class="noticeDetailmove-up" >
   
         <table class="noticeDetailView">
            <tr>
               <td class="td_left"><label for="subject">제목</label></td>
               <td class="td_right"><input name="subject" type="text" id="title" readonly="readonly" maxlength="30" value="${notice.title }"  class="noticeDetailTitle" ></td>
            </tr>
            <tr>
               <td class="td_left"><label for="date">등록일</label></td>
               <td class="td_right"><input type="text" name="date" id="date" readonly="readonly" value="${notice.date }" class="noticeDetailDate"  ></td>
            </tr>
            <tr>
               <td class="td_left"><label for="content">내용</label></td>
               <td><textarea id="content"  name="content"  readonly="readonly"cols="40" rows="15"  class="noticeDetailTextarea"  >${notice.content }</textarea></td>
            </tr>

         </table>
         
           <div class="noticebtn_list">
           <%-- ADMIN일때만 수정,삭제 버튼 보임.<c:if test="${notice.writer =='ADMIN' }">  </c:if> --%>
          
            
            <c:if test="${member.role == 'ADMIN' }"> 
            <a href="noticeformedit?no=${notice.no}" class="noticeDetailBtn1"  >수정</a>&nbsp;&nbsp;</c:if>
           
            <a href=notice class="noticeDetailBtn2"  >목록</a>&nbsp;&nbsp;

				<c:if test="${member.role == 'ADMIN' }"> 
					<a href="noticedelete?no=${notice.no }"
						id="delOk" class="noticeDetailBtn3" >삭제</a></c:if>
			
			<input type="hidden" value="${notice.no }" id="noticeGetno"	>
				<%-- js 코드 위에다 썼었는데, notice.js에 따로 담을려면 hidden해서 no를 넘겨줘야한다.  --%>
			
			

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