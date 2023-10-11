<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
			
			<div class="plLabel">풀랜테리어</div>
			<div class="plDicLine">
            	<div class="plTopBorder"></div>
				<div class="plSortBox">
					<div class="plSortNewDiv plOption" onclick="">
						<div class="plBtn">최신순</div>
					</div>
					<div class="plSortViewDiv plOption" onclick="">
						<div class="plBtn">조회순</div>
					</div>
				</div>
				
				<div class="plBoardCardsection">
					<div class="plBoardCardsection_line">
						<div class="plBoardCard">
							<img class="plFace plFront" src="static/img/flower.jpeg">
							<div class="plFace plBack">
								<h1>제목</h1>
								<br>
								<h3>식물 이름</h3>
								<p>내용</p>
							</div>
						</div>
			
						<div class="plBoardCard">
							<img class="plFace plFront" src="static/img/flower.jpeg">
							<div class="plFace plBack">
								<h1>제목</h1>
								<br>
								<h3>식물 이름</h3>
								<p>내용</p>
							</div>
						</div>
					</div>
				</div>
			
				<div class="plBoardCardsection">
					<div class="plBoardCardsection_line">
						<div class="plBoardCard">
							<img class="plFace plFront" src="static/img/flower.jpeg">
							<div class="plFace plBack">
								<h1>제목</h1>
								<br>
								<h3>식물 이름</h3>
								<p>내용</p>
							</div>
						</div>
			
						<div class="plBoardCard">
							<img class="plFace plFront" src="static/img/flower.jpeg">
							<div class="plFace plBack">
								<h1>제목</h1>
								<br>
								<h3>식물 이름</h3>
								<p>내용</p>
							</div>
						</div>
					</div>
				</div>
				
				<%-- 페이징 영역--%>
				<div id="plPagingArea">
					<c:choose>
						<c:when test="${res.pageInfo.curPage>1 }">
							<a href="boardlist?page=${res.pageInfo.curPage-1}">&lt;</a>
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
								<a href="boardlist?page=${i}" onclick="plCallBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
				         	</c:when>
							<c:otherwise>
								<a href="boardlist?page=${i}" onclick="plCallBtn(${i});return ${res.keyword==null};">${i}</a>&nbsp;
				         	</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
							<a href="boardlist?page=${res.pageInfo.curPage+1}">&gt;</a>
						</c:when>
						<c:otherwise>
			               <a>&gt;</a>
			            </c:otherwise>
					</c:choose>
				</div>
				
				<div class=plSearchOptionDiv>
					<form action="./boardsearch" method="post" id="plSearchform">
						<input type="hidden" name="page" id="plPage" value="1">
						<h5>
							<select class="plSearchType" name="type">
								<option value="all">전체</option>
								<option value="subjectcontent" ${res.type eq 'subjectcontent'? 'selected':''}>제목+내용</option>
								<option value="writer" ${res.type eq 'writer'? 'selected':''}>작성자</option>
								<option value="tag" ${res.type eq 'tag'? 'selected':''}>태그</option>
								<option value="plant" ${res.type eq 'plant'? 'selected':''}>식물명</option>
							</select>
							<input type="text" name="keyword" id="plKeyword" value="${res.keyword}" />
							<button class="plSearchBtn" type="submit">검색</button>
						</h5>
					</form>
					<div class="plWriteFormDiv plOption" onclick="location.href='poolentarierForm'">
						<div class="plBtn">글쓰기</div>
					</div>
				</div>
				<div class="plBottomBorder"></div>
			</div>
		</div>
	</div>
</body>
</html>