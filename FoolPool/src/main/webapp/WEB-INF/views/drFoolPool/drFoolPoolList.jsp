<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
            	<%-- 필터링 버튼 3개 + 글쓰기 버튼 --%>
            	<div class="drFP-FilteringAndWriteBtn">
	                <div class="drFP-Filtering">
	                    <span class="drFP-FilterBtn drFP-FilterBtnSelected">전체</span>
	                    <span class="drFP-FilterBtn">미해결</span>
	                    <span class="drFP-FilterBtn">해결</span>
	                </div>
                	<a href="drFoolpoolForm?num"><button class="drFP-writeBtn">질문하기</button></a>
                </div>
                
                <%-- 카드그리드 3x2 --%>
			    <div class="drFP-CardGrid">
			        <%-- 첫 번째 행 --%>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card drFP-CardHover">
				        	<div class="drFP-CardTitleArea">
						        <img alt="미해결이파리" src="./static/img/drFP-leaf-unsolved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목1 이 꽃 이름 알려주세요</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지썸네일" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
						        <img alt="해결이파리" src="./static/img/drFP-leaf-solved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목2</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
						        <img alt="미해결이파리" src="./static/img/drFP-leaf-unsolved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목3생략되는긴제목생략되는긴제목긴제목긴제목긴제목긴제목긴제목긴제목</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
					
			        <%-- 두 번째 행 --%>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
						        <img alt="미해결이파리" src="./static/img/drFP-leaf-unsolved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목1 이 꽃 이름 알려주세요</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
						        <img alt="해결이파리" src="./static/img/drFP-leaf-solved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목2</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
						        <img alt="미해결이파리" src="./static/img/drFP-leaf-unsolved.png" class="drFP-leaf">
						        <label class="drFP-CardTitle">제목3생략되는긴제목생략되는긴제목긴제목긴제목긴제목긴제목긴제목긴제목</label>
					        </div>
					        <div class="drFP-thumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			    </div> <%-- drFP-CardGrid --%>
                
                
                <%-- 검색바 --%>
                <h5 class="drFP-searchBar">
                	<select name="type" class="drFP-searchSelect">
                		<option value="unselected" class="drFP-searchOption">선택</option>
                		<option value="writer" class="drFP-searchOption">작성자</option>
                		<option value="all" class="drFP-searchOption">제목+내용</option>
                	</select>
                	<input type="text" name="keyword" id="keyword" class="drFP-searchInput" value="${res.keyword }"/>
					<input type="submit" class="drFP-searchInput drFP-searchSubmit" value="검색"/>
                </h5>
                
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
               
               
               
               <div class="drFP-BottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            <%-- 1011 dev pull 하기 전 --%>
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
</body>

</html>