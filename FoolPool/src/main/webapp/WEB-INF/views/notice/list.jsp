<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
.noticeListWrapper {
        width: 1350px;
        position: relative;
        left: 25px;
        max-width: 100%;
        margin: 0 auto;
        outline: 2px solid #524638;
        outline: radius 10px;
        padding: 20px;
        border-radius: 10px;
        margin-top: 10px;
      }
.outer {
	width: 800px;
	margin: auto;
}

.wrap {
	width: 780px;
	margin: 100px auto;
}

ul, li {
	margin: 0;
	padding: 0;
}

.board_title {
	border-bottom: 1px solid #282A35;
}

.board_list {
	margin: 20px 30px;
	min-height: 565px;
}

.board_list>ul {
	border-bottom: 1px solid #f3f5f7;
	height: 50px;
	line-height: 50px;
	display: flex;
	justify-content: space-around;
	list-style: none;
}

.board_list>ul.last {
	border: 0;
}

.board_list>ul>li {
	text-align: center;
}

.board_header {
	background: #77af9c;
	color: white;
	font-weight: bold;
}

.board_list .id {
	width: 60px;
}

.board_list .category {
	width: 60px;
}

.board_list .title {
	width: 350px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.board_list .writer {
	width: 80px;
}

.board_list .count {
	width: 60px;
}

.board_list .date {
	width: 100px;
}

.onmouseover {
	background: #f3f5f7;
	cursor: pointer;
}

.board_paging {
	height: 50px;
	line-height: 50px;
	display: flex;
	justify-content: center;
	list-style: none;
	width: 480px;
	margin: auto;
}

.board_paging a {
	text-decoration: none;
	color: #282A35;
	width: 40px;
	display: block;
	text-align: center;
}

.board_paging a.current_page {
	border-bottom: 2px solid #282A35;
	font-weight: bold;
}

.search_area {
	text-align: center;
	padding: 30px;
}

.search_area select {
	width: 150px;
	height: 30px;
	border: 0px;
}

.input_area {
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	margin-right: 20px;
	background: white;
}

.input_area input {
	width: 250px;
	height: 30px;
	border: 0px;
}

.input_area input:focus, .search_area select:focus {
	outline: none;
}

.search_area button {
	width: 100px;
	height: 35px;
	border: 0px;
	color: white;
	background: #282A35;
	margin: 5px;
}
</style>
</head>
<body>
	<div class="noticeWrapper">
	<div class="outer">
		<div class="wrap">
			<div class="board_area">
				<div class="board_title">
					<h1>공지사항</h1>
				</div>
				<div class="board_list">
					<ul class="board_header">
						<li class="id">글번호</li>
						<li class="title">제목</li>
						<li class="date">작성일</li>
						<li class="count">조회수</li>
					</ul>
				
				<c:forEach var="list" items="${boardList}">
				<ul class="board_ul" onclick="detailView(${list.bid})">
					<li class="id">${list.bid }</li>
					<li class="category">${list.cname }</li>
					<li class="title">${list.btitle }</li>
					<li class="writer">${list.userName }</li>
					<li class="count">${list.bcount }</li>
					<li class="date">${list.createDate }</li>
				</ul>
				</c:forEach>
			</div>
			
			<c:if test="${param.searchCondition != null && param.searchValue != null }">
				<c:set var="searchStatus" value="&searchCondition=${param.searchCondition}&searchValue=${param.searchValue}"/>
			</c:if>
			<ul class="board_paging">
			
				<!-- 첫페이지로  -->
				<li>
					<a href="${contextPath}/board/list?page=1${searchStatus}">&lt;&lt;</a>
				</li>
				
				<!-- 이전 페이지로 -->
				<li>
				<c:choose>
					<c:when test="${pi.page == 1}">
						<a href="javascript:;">&lt;</a>
					</c:when>
					<c:otherwise>
						<a href="${ contextPath }/board/list?page=${pi.page - 1}${searchStatus}">&lt;</a>
					</c:otherwise>				
				</c:choose>
				</li>
				
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<li>
						<a href="${contextPath}/board/list?page=${p}${searchStatus}" <c:if test="${p == pi.page }">
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
						<a href="${ contextPath }/board/list?page=${pi.page + 1}${searchStatus}">&gt;</a>
					</c:otherwise>				
				</c:choose>
				</li>
				
				<!-- 끝페이지로  -->
				<li>
					<a href="${contextPath}/board/list?page=${pi.maxPage}${searchStatus}">&gt;&gt;</a>
				</li>
			</ul>
			<div class="search_area">
				<form method="get">
					<select id="searchCondition" name="searchCondition">
						<option value="title" <c:if test="${ param.searchCondition == 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${ param.searchCondition == 'content'}">selected</c:if>>내용</option>
						<option value="writer" <c:if test="${ param.searchCondition == 'writer'}">selected</c:if>>작성자</option>
					</select> 
					<span class="input_area"> 
						<input type="search" name="searchValue" value="${ param.searchValue }">
					</span>
					<button type="submit">검색하기</button>
					<c:if test="${!empty userLogin}">
						<button type="button" onclick="location.href='${contextPath}/board/insert'">작성하기</button>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script>
	const board_ul = document.querySelector('.board_list');
	board_ul.addEventListener('mouseover', function(){
		if(event.target.classList.contains("board_ul")){
			event.target.classList.add('onmouseover');
		}else if(event.target.parentNode.classList.contains('board_ul')){
			event.target.parentNode.classList.add('onmouseover');
		}
	})
	
	board_ul.addEventListener('mouseout', function(){
		if(event.target.classList.contains("board_ul")){
			event.target.classList.remove('onmouseover');
		}else if(event.target.parentNode.classList.contains('board_ul')){
			event.target.parentNode.classList.remove('onmouseover');
		}
	})
	
	function detailView(bid){
		location.href = '${contextPath}/board/detailView?bid=' + bid;
	}
	
	</script>
</body>
</html>