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
	            		<div class="plWriteFormDiv">
	            			<c:if test="${member ne Empty}">
	            				<div class="plWriteFormDivForBtn plOption" onclick="location.href='poolentarierForm'">
									<div class="plWriteBtn">글쓰기</div>
								</div>
	            			</c:if>
	            		</div>
		            	
						<div class="plSortDiv">
							<div class="plSortNewDiv plOption">
								<a href="goPoolentarier?sortOption=new&page=1" class="${sortOption eq 'new' ? 'plSortBtn plSortBtnSelected' : plSortBtn}">최신순</a>
							</div>
							<div class="plSortViewDiv plOption">
								<a href="goPoolentarier?sortOption=view&page=1" class="${sortOption eq 'view' ? 'plSortBtn plSortBtnSelected' : plSortBtn}">조회순</a>
							</div>
						</div>
	            	</div>
				    
	            	<%-- 카드그리드 2x2 --%>
	            	<div class="plCardGrid">
	            		<c:if test="${res.poolentarierList eq Empty}">
	            			<div class="plEmptyList">...</div>
	            		</c:if>
	            		<c:if test="${res.poolentarierList ne Empty}">
	            			<c:forEach items="${res.poolentarierList }" var="poolentarier">
			            		<a href="poolentarierDetail?no=${poolentarier.no}">
			            			<div class="plCard">
			            				<img alt="풀랜테리어 사진" class="plFace plFront" src="image?file=${poolentarier.fileName}">
										<div class="plFace plBack">
											<h1>${poolentarier.title}</h1><br>
											<h3>${poolentarier.plantsName}</h3>
											<p>${poolentarier.content}</p>
										</div>
			            			</div>
			            		</a>
	            			</c:forEach>
	            		</c:if>
	            	</div>
					
					<%-- 검색창 --%>
					<div class=plSearchOptionDiv>
						<form action="poolentarierSearch" method="post" id="plSearchform">
							<input type="hidden" name="page" id="plPage" value="${res.pageInfo.curPage}"/>
							<input type="hidden" name="sortOption" id="plSort" value="${sortOption}"/>
							<h5>
								<select name="searchOption" class="plSearchOption">
									<option value="unselected">선택</option>
									<option value="all" ${res.searchOption eq 'all'? 'selected':''}>제목+내용</option>
									<option value="writer_Nickname" ${res.searchOption eq 'writer_Nickname'? 'selected':''}>작성자</option>
									<option value="keyword" ${res.searchOption eq 'keyword'? 'selected':''}>키워드</option>
									<option value="plantsName" ${res.searchOption eq 'plantsName'? 'selected':''}>식물명</option>
								</select>
								<input type="text" name="searchText" id="plSearchText" value="${res.searchText}" />
								<button class="plSearchBtn" type="submit" onclick="plkeepSearch()">검색</button>
							</h5>
						</form>
					</div>
            	</div>
            	
				<div class="plBottomBorder"></div>
				<%-- 페이징 영역--%>
				<div id="plPagingArea">
					<c:choose>
						<c:when test="${res.pageInfo.curPage>1 }">
							<a href="goPoolentarier?page=${res.pageInfo.curPage-1}">&lt;</a>
						</c:when>
						<c:otherwise>
			               <a>&lt;</a>
			            </c:otherwise>
					</c:choose>
			
			
					<%--startPage번호부터 endPage번호까지 돌면서 번호를 출력 --%>
					<c:forEach begin="${res.pageInfo.startPage}" end="${res.pageInfo.endPage}" var="i">
						<c:choose>
							<c:when test="${res.pageInfo.curPage==i}">
								<%-- callBtn에 대한 return 처리를 callBtn에서 하지 않고, 호출한 이곳에서 return --%>
								<a href="goPoolentarier?page=${i}" onclick="plCallBtn(${i});return ${res.searchText==null};">${i}</a>&nbsp;
				         	</c:when>
							<c:otherwise>
								<a href="goPoolentarier?page=${i}" onclick="plCallBtn(${i});return ${res.searchText==null};">${i}</a>&nbsp;
				         	</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
							<a href="goPoolentarier?page=${res.pageInfo.curPage+1}">&gt;</a>
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