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

<div class="notice-DivLine">

	
	
	
	<div class="noticeOuter">
		<div class="noticeListwrap">
			<div class="notice_area">
				<div class="notice_title">
					<h1>공지사항</h1>
				</div>
				<div class="notice_list">
					<ul class="notice_header">
						<li class="num">글번호</li>
						<li class="title">제목</li>
						<li class="date">작성일</li>
						<li class="count">조회수</li>
					</ul>
				
				<c:forEach var="list" items="${noticeList}">
				<ul class="notice_ul" onclick="noticeDetail(${list.num})">
					<li class="num">${list.num }</li>
					<li class="title">${list.title }</li>
					<li class="count">${list.count }</li>
					<li class="date">${list.createDate }</li>
				</ul>
				</c:forEach>
			</div>
			
			<c:if test="${param.searchCondition != null && param.searchValue != null }">
				<c:set var="searchStatus" value="&searchCondition=${param.searchCondition}&searchValue=${param.searchValue}"/>
			</c:if>
			<ul class="notice_paging">
			
				<!-- 첫페이지로  -->
				<li>
					<a href="${contextPath}/notice/list?page=1${searchStatus}">&lt;&lt;</a>
				</li>
				
				<!-- 이전 페이지로 -->
				<li>
				<c:choose>
					<c:when test="${pi.page == 1}">
						<a href="javascript:;">&lt;</a>
					</c:when>
					<c:otherwise>
						<a href="${ contextPath }/notice/list?page=${pi.page - 1}${searchStatus}">&lt;</a>
					</c:otherwise>				
				</c:choose>
				</li>
				
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li>
						<a href="${contextPath}/notice/list?page=${p}${searchStatus}" <c:if test="${p == pi.page }">
						 class = 'current_page'
					</c:if>>${p}</a>
					</li>
				</c:forEach>
				
				<!-- 다음페이지로 -->
				<li>
				<c:choose>
					<c:when test="${pi.page == pi.maxPage}">
						<a href="javascript:;">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="${ contextPath }/notice/list?page=${pi.page + 1}${searchStatus}">&gt;</a>
					</c:otherwise>				
				</c:choose>
				</li>
				
				<!-- 끝페이지로  -->
				<li>
					<a href="${contextPath}/notice/list?page=${pi.maxPage}${searchStatus}">&gt;&gt;</a>
				</li>
			</ul>
			<div class="noticesearch_area">
				<form method="get">
					<select id="searchCondition" name="searchCondition">
						<option value="title" <c:if test="${ param.searchCondition == 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${ param.searchCondition == 'content'}">selected</c:if>>내용</option>
						<option value="writer" <c:if test="${ param.searchCondition == 'writer'}">selected</c:if>>작성자</option>
					</select> 
					<span class="noticeinput_area"> 
						<input type="search" name="searchValue" value="${ param.searchValue }">
					</span>
					<button type="submit">검색하기</button>
					<c:if test="${!empty userLogin}">
						<button type="button" onclick="location.href='${contextPath}/notice/insert'">작성하기</button>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	const notice_ul = document.querySelector('.notice_list');
	notice_ul.addEventListener('mouseover', function(){
		if(event.target.classList.contains("notice_ul")){
			event.target.classList.add('onmouseover');
		}else if(event.target.parentNode.classList.contains('notice_ul')){
			event.target.parentNode.classList.add('onmouseover');
		}
	})
	
	notice_ul.addEventListener('mouseout', function(){
		if(event.target.classList.contains("notice_ul")){
			event.target.classList.remove('onmouseover');
		}else if(event.target.parentNode.classList.contains('notice_ul')){
			event.target.parentNode.classList.remove('onmouseover');
		}
	})
	
	function detailView(bid){
		location.href = '${contextPath}/notice/detailView?bid=' + bid;
	}
	
	
	
	
	
	
	

</div>
<%-- notice-DivLine --%>


</div>
<%-- containerChild --%>
</div>
<%-- container --%>
</body>
</html>