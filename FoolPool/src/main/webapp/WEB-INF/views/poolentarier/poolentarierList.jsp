<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

<%@ page import="bean.Poolentarier" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
			
			<div class="plLabel">풀랜테리어</div>
			<div class="plDivLine">
            	<div class="plTopBorder"></div>
            	<div class="plListArea">
					<div class="plTopMenuDiv">
						<div class="plSortDiv">
							<c:url var="urlsortoptionnew" value="goPoolentarier">
								<c:param name="page" value="1" />
								<c:param name="sortOption" value="new" />
								<c:if test="${searchOption ne null && searchText ne null}">
									<c:param name="searchOption" value="${searchOption }" />
									<c:param name="searchText" value="${searchText }" />
								</c:if>
							</c:url>
							<a href="${urlsortoptionnew}" class="${sortOption eq 'new' ? 'plSortBtn plSortBtnSelected plOption' : 'plSortBtn plOption'}">최신순</a>
							
							<c:url var="urlsortoptionview" value="goPoolentarier">
								<c:param name="page" value="1" />
								<c:param name="sortOption" value="view" />
								<c:if test="${searchOption ne null && searchText ne null}">
									<c:param name="searchOption" value="${searchOption }" />
									<c:param name="searchText" value="${searchText }" />
								</c:if>
							</c:url>
							<a href="${urlsortoptionview}" class="${sortOption eq 'view' ? 'plSortBtn plSortBtnSelected plOption' : 'plSortBtn plOption'}">조회순</a>
						</div>
						
						<div class="plWriteFormDiv">
	            			<c:if test="${member ne Empty}">
	            				<div class="plOption" onclick="location.href='poolentarierForm?num'">
									<div class="plWriteBtn">글쓰기</div>
								</div>
	            			</c:if>
	            		</div>
	            	</div>
	            	
				    
	            	
				     <%-- 카드그리드 2x2 --%>
					<c:if test="${res['poolentarierList'].size()==0}">
						<div id="plEmptyList">
							<p>게시물이 존재하지 않습니다.</p>
							<img alt="예외처리이파리" src="./static/img/leaf-exception.png" id="plLeafException">
						</div>
					</c:if>
					<c:if test="${res['poolentarierList'].size()>0}">
						<div class="plCardGrid">
							<c:forEach items="${res.poolentarierList }" var="poolentarier">
								<a href="poolentarierDetail?no=${poolentarier.no}">
									<div class="plCard">
										<img alt="풀랜테리어 사진" class="plFace plFront"
											src="image?file=${poolentarier.fileName}">
										<div class="plFace plBack">
											<h1>${poolentarier.plantsName}</h1>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</c:if>
			
					<%-- 검색창 --%>
					<div class=plSearchOptionDiv>
						<form action="goPoolentarier" method="get" id="plSearchform">
							<h5>
								<select name="searchOption" class="plSearchOption" value="${searchOption} }">
									<option value="all" ${searchOption eq 'all'? 'selected':''}>제목+내용</option>
									<option value="writer_Nickname" ${searchOption eq 'writer_Nickname'? 'selected':''}>작성자</option>
									<option value="keyword" ${searchOption eq 'keyword'? 'selected':''}>키워드</option>
									<option value="plants_Name" ${searchOption eq 'plantsName'? 'selected':''}>식물명</option>
								</select>
								<input type="text" maxlength="100" name="searchText" id="plSearchText" value="${searchText}" />
								<button class="plSearchBtn" type="submit">검색</button>
							</h5>
						</form>
					</div>
            	</div>
            	
				<div class="plBottomBorder"></div>
				<%-- 페이징 영역--%>
				<div id="plPagingArea">
					<c:choose>
						<c:when test="${res.pageInfo.curPage>1 }">
							<c:url var="urlprevpagenumber" value="goPoolentarier">
							    <c:param name="page" value="${res.pageInfo.curPage-1}" />
							    <c:param name="sortOption" value="${sortOption}" />
							    <c:if test="${searchOption ne null && searchText ne null}">
							        <c:param name="searchOption" value="${searchOption}" />
							        <c:param name="searchText" value="${searchText}" />
							    </c:if>
							</c:url>
				            <a href="${urlprevpagenumber}">&lt;</a>
						</c:when>
						<c:when test="${res['poolentarierList'].size()==0}">
							<b></b>
						</c:when>
						<c:otherwise>
			               <a>&lt;</a>
			            </c:otherwise>
					</c:choose>
			
			
					<%--startPage번호부터 endPage번호까지 돌면서 번호를 출력 --%>
					<c:forEach begin="${res.pageInfo.startPage}" end="${res.pageInfo.endPage}" var="i">
						<c:choose>
							<c:when test="${res.pageInfo.curPage==i}">
								<%-- c:url태그로 searchOption과 searchText 유무에 따라 동적으로 get 요청 url 생성하여 a태그의 href에 할당 --%>
								<c:url var="urlcurpagenumber" value="goPoolentarier">
								    <c:param name="page" value="${i}" />
								    <c:param name="sortOption" value="${sortOption}" />
								    <c:if test="${searchOption ne null && searchText ne null}">
								        <c:param name="searchOption" value="${searchOption}" />
								        <c:param name="searchText" value="${searchText}" />
								    </c:if>
								</c:url>
								<a href="${urlcurpagenumber}" id="plSelectedPage">${i}</a>
				         	</c:when>
							<c:otherwise>
								<c:url var="urlpagenumberschange" value="goPoolentarier">
									<c:param name="page" value="${i}" />
									<c:param name="sortOption" value="${sortOption}" />
									<c:if test="${searchOption ne null && searchText ne null }">
										<c:param name="searchOption" value="${searchOption }" />
										<c:param name="searchText" value="${searchText }" />
									</c:if>
								</c:url>
								<a href="${urlpagenumberschange}" class="plUnSelectedPage">${i}</a>
				         	</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
							<c:url var="urlnextpagenumber" value="goPoolentarier">
							    <c:param name="page" value="${res.pageInfo.curPage+1}" />
							    <c:param name="sortOption" value="${sortOption}" />
							    <c:if test="${searchOption ne null && searchText ne null}">
							        <c:param name="searchOption" value="${searchOption}" />
							        <c:param name="searchText" value="${searchText}" />
							    </c:if>
							</c:url>
							<a href="${urlnextpagenumber}">&gt;</a>
						</c:when>
						<c:when test="${res['poolentarierList'].size()==0}">
							<b></b>
						</c:when>
						<c:otherwise>
			               <a>&gt;</a>
			            </c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- plDivLine -->
		</div>
	</div>
</body>
</html>