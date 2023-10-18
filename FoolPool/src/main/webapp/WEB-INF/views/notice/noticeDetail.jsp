<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>
<c@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
$(document).ready(function() {
    $("#delOk").on("click", function(e) {
        e.preventDefault(); // 기본 동작 중지

        Swal.fire({
            title: '삭제하면 글 내용을 되돌릴 수 없습니다.',
            text: '정말 삭제 하시겠습니까??',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: true,
        }).then(result => {
            if (result.isConfirmed) {
                // 서버로 삭제 요청 보내기 (AJAX)
                $.ajax({
                    type: "GET",
                    url: "noticedelete?no=${notice.no}",
                    success: function(response) {
                    	console.log(response);
                        if (response!= null) {
                            Swal.fire('승인이 완료되었습니다.', 'success').then(result => {
                            	   // 만약 Promise리턴을 받으면,
                            	   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
                            		   location.href="notice";
                            	      
                            	   }
                            	});;sss
                        } else {
                            Swal.fire('오류 발생', '삭제에 실패했습니다.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('서버 오류', '서버와 통신 중 오류가 발생했습니다.', 'error');
                    }
                });
            }
        });
    });
});
</script>


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