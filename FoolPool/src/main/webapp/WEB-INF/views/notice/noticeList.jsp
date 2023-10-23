<%@page import="bean.Notice"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp"%>
<div class="notice-DivLine">

		<div class="noticeOuter">


			<div class="notice_area">
			
				<div class="notice_title">
					<h1>
						공지사항
						<c:if test="${member.role == 'ADMIN'  }">
							<a href="noticeform" id="noticeformbtn"
								>작성하기</a>
						</c:if>
					</h1>
				</div> <%-- notice_title --%>
				
				
				<div class="notice_list">
					<ul class="notice_header">
						<li class="num">글번호</li>
						<li class="title">제목</li>
						<li class="date">작성일</li>
						<li class="count">조회수</li>
					</ul>

					<%--목록이 0행일때의 예외처리 --%>
					<c:if test="${res['noticeList'].size()==0}">
						<div id="notice-emptyList">
						<p>게시글이 존재하지 않습니다</p>
						<img alt="예외처리이파리" src="./static/img/leaf-exception.png" id="notice-leafException">
						</div>
					</c:if>

					<c:if test="${res['noticeList'].size()>0 }">

						<%--동적으로 글번호 주고싶을때..? --%>
						<c:forEach var="list" items="${res.noticeList}" varStatus="loop">
							<c:set var="pageNumber" value="${res.pageInfo.curPage}" />
							<c:set var="itemsPerPage" value="10" />
							<!-- 페이지당 보여지는 항목 수 -->

							<c:set var="startIndex"
								value="${(pageNumber - 1) * itemsPerPage + loop.index+1}" />
							<c:set var="endIndex" value="${pageNumber * itemsPerPage}" />


							<ul class="notice_ul" onclick="noticedetail?no=(${list.no})">
								<li class="no" style="">${startIndex }</li>
								<li class="title" style="text-overflow: ellipsis;">
								<a href="noticedetail?no=${list.no}" id="noticeaBtn">${list.title }</a></li>
								<li class="date" style="">${list.date }</li>
								<li class="count" style="">${list.view }</li>
							</ul>

						</c:forEach>
					</c:if>
				</div><%--notice_list --%>
			




				<h5 class="notice-searchBar">
					<form action="./noticesearch" method="post" id="searchform">
						<input type="hidden" name="page" value="1" id="page" />

						<%--삼항연산자를 이용하여 사용자가 옵션 선택 검색했을때, 선택된 옵션 요소에 selected라는 속성을 동적으로 추가한다. --%>
						<select name="type" id="noticeType">
							<option value="all">선택</option>
							<option value="title" ${res.type eq 'title'? 'selected':'' }>제목</option>
							<option value="content" ${res.type eq 'content'? 'selected':'' }>내용</option>
						</select> <input type="text" name="keyword" id="keyword"
							value="${res.keyword}" /> <input type="submit" value="검색" />
				</h5>
				</form>
				



		</div>
		
		<%-- notice-DivLine --%>
		<%-- 페이징 영역 --%>
				<div class="noticePaging">
					<c:choose>
						<c:when test="${res.pageInfo.curPage>1 }">
							<a href="notice?page=${res.pageInfo.curPage-1}"
								onclick="return callBtn(${res.pageInfo.curPage-1})">&lt;</a>
						</c:when>
						  <%-- 검색결과 없을때 --%>
			         <c:when test="${res['noticeList'].size()==0}">
			            <b></b>
			         </c:when>
						<c:otherwise>
							<a>&lt;</a>
						</c:otherwise>
					</c:choose>

					<%-- statPage번호부터 endPage 번호까지 돌면서 번호를 출력 --%>
					<c:forEach begin="${res.pageInfo.startPage}"
						end="${res.pageInfo.endPage}" var="i">
						<c:choose>
							<c:when test="${res.pageInfo.curPage==i}">
								<a href="notice?page=${i}" id="notice-selectedPage"
									onclick="return callBtn(${i})">${i}</a>
               			</c:when>
							<c:otherwise>
								<a href="notice?page=${i}" class="notice-unselectedPage"
									onclick="return callBtn(${i})">${i}</a>
               		</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage}">
							<a href="notice?page=${res.pageInfo.curPage+1}"
								onclick="return callBtn(${res.pageInfo.curPage+1})">&gt;</a>
						</c:when>
						<c:otherwise>
							<a>&gt;</a>
						</c:otherwise>
					</c:choose>
				</div>
				<%-- notice-paging --%>


	</div>
	<%-- containerChild --%>

	</div>
	<%-- container --%>
</body>
</html>