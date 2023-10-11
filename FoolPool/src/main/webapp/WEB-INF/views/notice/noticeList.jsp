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
				<ul class="notice_ul" onclick="noticeDetail(${list.no})">
					<li class="no">${list.no }</li>	
					<li class="title"><a href="noticedetail?no=${list.no}">${list.title }</a></li>					
					<li class="date">${list.date }</li>
					<li class="count">${list.view }</li>
				</ul>
				</c:forEach>
			</div>
			
               

			
			<div class="noticesearch_area">
				<form method="get">
					<select id="searchCondition" name="searchCondition">
						<option value="title" <c:if test="${ param.searchCondition == 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${ param.searchCondition == 'content'}">selected</c:if>>내용</option>
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
			
			
			 <%-- 페이징 영역 --%>
                <div class="drFP-paging">
			      <c:choose>
			         <c:when test="${res.pageInfo.curPage>1 }">
			            <a href="drfoolpoollist?page=${res.pageInfo.curPage-1}">&lt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&lt;</a>
			         </c:otherwise>
			      </c:choose>
			      <%--
			      <c:forEach begin="${res.pageInfo.startPage}" end="${res.pageInfo.endPage}" var="i">
			         <c:choose>
			            <c:when test="${res.pageInfo.curPage==i}">
			               <a href="drfoolpoollist?page=${i}" class="select" onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
			               </c:when>
			            <c:otherwise>
			               <a href="drfoolpoollist?page=${i}" class="btn" onclick="callBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
			               </c:otherwise>
			         </c:choose>
			      </c:forEach>
			      --%>
			      <div class="drFP-pagingnumbs">
			      	<a href="1page" id="drFP-pagingnumbs-selected">1</a><a href="2page">2</a><a>3</a><a>4</a><a>5</a><a>6</a><a>7</a><a>8</a><a>9</a><a>10</a>
			      </div>
			      <c:choose>
			         <c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
			            <a href="drfoolpoollist?page=${res.pageInfo.curPage+1}">&gt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&gt;</a>
			         </c:otherwise>
			      </c:choose>
			   </div> <%-- drFP-paging --%>
			
			
		
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