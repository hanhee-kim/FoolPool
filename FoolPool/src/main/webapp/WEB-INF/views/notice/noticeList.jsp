<%@page import="bean.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/include/menubar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.active {
	background-color: #77af9c;
}

</style>
<script src="https://coode.jquery.com/jquery-3.7.1.js"></script>
<script>
	function callBtn(num) {
		var keyword=$("#keyword").val();
		if(keyword!=null && keyword.trim()!=''){
			$('#page').val(num);
			$('#searchform').submit();
			return false;
		}
		return true;
	}



</script>
</head>
<body>

<div class="notice-DivLine">

	
	
	
	<div class="noticeOuter">
	
		
			<div class="notice_area">
				<div class="notice_title">
					<h1>공지사항 <c:if test="${member.role == 'ADMIN' }"> 
				<a href="noticeform" style="float: right; font-size:20px; margiin-top:20ppx;">작성하기</a></c:if></h1>	 
				</div>
				<div class="notice_list">
					<ul class="notice_header">
						<li class="num">글번호</li>
						<li class="title">제목</li>
						<li class="date">작성일</li>
						<li class="count">조회수</li>
					</ul>
				
					<%--목록이 0행일때의 예외처리 --%>
					<c:if test="$res['noticeList'].size()==0}">
						<div id="notice-emptyList">데이터 넣으세요</div>
					</c:if>
					
				<c:if test="${res['noticeList'].size()>0 }">
				
				<%--동적으로 글번호 주고싶을때..? --%>
				<c:forEach var="list" items="${res.noticeList}" varStatus="loop">			
				 <c:set var="pageNumber" value="${res.pageInfo.curPage}" />
   				 <c:set var="itemsPerPage" value="10" /> <!-- 페이지당 보여지는 항목 수 -->
				
				<c:set var="startIndex" value="${(pageNumber - 1) * itemsPerPage + 1}" />
    			<c:set var="endIndex" value="${pageNumber * itemsPerPage}" />
				
			
				<ul class="notice_ul" onclick="noticedetail?no=(${list.no})">
					<li class="no" style="width=5%;">${loop.index +1 }</li>	
					<li class="title" style="width=70%; text-overflow: ellipsis; "><a href="noticedetail?no=${list.no}" >${list.title }</a></li>					
					<li class="date" style="width=15%;">${list.date }</li>
					<li class="count" style="width=5%;">${list.view }</li>
				</ul>
				 
				</c:forEach>
				</c:if>
			</div>
			
               

			
			<div class="noticesearch_area">
				<form action="./noticesearch" method="post" id="searchform" >
					<input type="hidden" name="page" value="1" id="page"/>
					<h5>
					<%--삼항연산자를 이용하여 사용자가 옵션 선택 검색했을때, 선택된 옵션 요소에 selected라는 속성을 동적으로 추가한다. --%>
					<select name="type">
					<option value="all">선택</option>
					<option value="title" ${res.type eq 'title'? 'selected':'' }>제목</option>
					<option value="content" ${res.type eq 'content'? 'selected':'' }>내용</option>
					</select>
					<input type="text" name="keyword" id="keyword" value="${res.keyword}"/>
					<input type="submit" value="검색"/>
					</h5>
				</form> 
				</div>
				
				
				
				<!-- ADMIN 권한을 가진 사용자만 이 부분에 접근 가능한 코드 + sessoin로그인 확인하기 -->
				<%--<c:if test="${sessionScope.user != null && sessionScope.user.role == 'ADMIN'}">
    			<a href="noticeform">작성하기</a>	
				</c:if>--%>
				
			
			
			
			
                
			 <%-- 페이징 영역 --%>
               <div id="noticePaging" class="noticePaging" style="justify-content: center;
    			align-items: center;font-family: 'Cafe24SsurroundAir';font-size: larger;font-weight: bold;display: flex;margin-top:3px;">
               	<c:choose>
               		<c:when test="${res.pageInfo.curPage>1 }">
               			<a href="notice?page=${res.pageInfo.curPage-1}" onclick="return callBtn(${res.pageInfo.curPage-1})">&lt;</a>
               		</c:when>
               		<c:otherwise>
               		&lt;
               		</c:otherwise>
            	</c:choose>
               
                <%-- statPage번호부터 endPage 번호까지 돌면서 번호를 출력 --%>
               <c:forEach begin="${res.pageInfo.startPage}" end="${res.pageInfo.endPage}" var="i">
               		<c:choose>
               			<c:when test="${res.pageInfo.curPage==i}">
               				<a href="notice?page=${i}" id="notice-selectedPage" class="btn active" onclick="return callBtn(${i})">${i}</a>&nbsp;&nbsp;
               			</c:when>
               		<c:otherwise>
               			<a href="notice?page=${i}" class="btn" onclick="return callBtn(${i})">${i}</a>&nbsp;&nbsp;
               		</c:otherwise>
               		</c:choose>
               </c:forEach>
               
               <c:choose>
               		<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
               			<a href="notice?page=${res.pageInfo.curPage+1}" onclick="return callBtn(${res.pageInfo.curPage+1})">&gt;</a>
               </c:when>
               <c:otherwise>
               &gt;
               </c:otherwise>
               </c:choose>
			   </div> <%-- notice-paging --%>
			
			
		
	</div>
	
	
	
	
	
	
	

</div>
<%-- notice-DivLine --%>


</div>


</div>
<%-- container --%>
</body>
</html>