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
				
				<c:forEach var="list" items="${res.noticeList}">
				<ul class="notice_ul" onclick="noticedetail?no=(${list.no})">
					<li class="no">${list.no }</li>	
					<li class="title"><a href="noticedetail?no=${list.no}">${list.title }</a></li>					
					<li class="date">${list.date }</li>
					<li class="count">${list.view }</li>
				</ul>
				</c:forEach>
			</div>
			
               

			
			<div class="noticesearch_area">
				<form action="./noticeform" method="post" id="noticeform">
					<select id="searchCondition" name="searchCondition">
						<option value="title" <c:if test="${ param.searchCondition == 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${ param.searchCondition == 'content'}">selected</c:if>>내용</option>
					</select> 
					<span class="noticeinput_area"> 
						<input type="search" name="searchValue" value="${ param.searchValue }">
					</span>
					<button type="submit">검색하기</button>
					<%--
					<button type="button" id="noticeformbtn" onclick="btnClick('noticeform')">작성하기</button>
					 --%>
					<a href="noticeform">작성하기</a>
				</form> 
			</div>
			
			<%-- 검색바 --%>
			<form action="./noticeform" method="post" id="noticeform">
                <h5 class="drFP-searchBar">
                	<select name="type" class="drFP-searchSelect">
                		<option value="unselected" class="drFP-searchOption">선택</option>
                		<option value="writer" class="drFP-searchOption">제목</option>
                		<option value="all" class="drFP-searchOption">내용</option>
                	</select>
                	<input type="text" name="keyword" id="keyword" class="drFP-searchInput" value="${res.keyword }"/>
					<input type="submit" class="drFP-searchInput drFP-searchSubmit" value="검색"/>
                </h5>
                <a href="noticeform">작성하기</a>
                </form> 
			</div>
                
			 <%-- 페이징 영역 --%>
                <div class="drFP-paging ">
			      <c:choose>
			         <c:when test="${res.pageInfo.curPage>1 }">
			            <a href="noticelist?page=${res.pageInfo.curPage-1}">&lt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&lt;</a>
			         </c:otherwise>
			      </c:choose>
			      <div class="drFP-pagingnumbs">
			      	<a href="1page" id="notice-pagingnumbs-selected">1</a><a href="2page">2</a>
			      </div>
			      <c:choose>
			         <c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
			            <a href="noticelist?page=${res.pageInfo.curPage+1}">&gt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&gt;</a>
			         </c:otherwise>
			      </c:choose>
			   </div> <%-- drFP-paging --%>
			
			
		
	</div>
	
	
	
	
	
	
	

</div>
<%-- notice-DivLine --%>


</div>
<%-- containerChild --%>
</div>
<%-- container --%>
</body>
</html>