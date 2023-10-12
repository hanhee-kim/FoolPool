<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="plLabel">풀풀박사</div>
            
            <div class="plDivLine">
            
            	<div class="plTopBorder"></div>
            	
            	<%-- 필터링 버튼 3개 + 글쓰기 버튼 --%>
            	<div class="plFilteringAndWriteBtn">
	                <div class="plFiltering">
	                    <span class="plFilterBtn plFilterBtnSelected">전체</span>
	                    <span class="plFilterBtn">미해결</span>
	                    <span class="plFilterBtn">해결</span>
	                </div>
                	<a href="drFoolpoolForm?num"><button class="plwriteBtn">질문하기</button></a>
                </div>
                
                <%-- 카드그리드 3x2 --%>
			    <div class="plCardGrid">
			        <%-- 첫 번째 행 --%>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard plCardHover">
				        	<div class="plCardTitleArea">
						        <img alt="미해결이파리" src="./static/img/plleaf-unsolved.png" class="plleaf">
						        <label class="plCardTitle">제목1 이 꽃 이름 알려주세요</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지썸네일" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard">
				        	<div class="plCardTitleArea">
						        <img alt="해결이파리" src="./static/img/plleaf-solved.png" class="plleaf">
						        <label class="plCardTitle">제목2</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard">
				        	<div class="plCardTitleArea">
						        <img alt="미해결이파리" src="./static/img/plleaf-unsolved.png" class="plleaf">
						        <label class="plCardTitle">제목3생략되는긴제목생략되는긴제목긴제목긴제목긴제목긴제목긴제목긴제목</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
					
			        <%-- 두 번째 행 --%>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard">
				        	<div class="plCardTitleArea">
						        <img alt="미해결이파리" src="./static/img/plleaf-unsolved.png" class="plleaf">
						        <label class="plCardTitle">제목1 이 꽃 이름 알려주세요</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard">
				        	<div class="plCardTitleArea">
						        <img alt="해결이파리" src="./static/img/plleaf-solved.png" class="plleaf">
						        <label class="plCardTitle">제목2</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			        <a href="drFoolpoolDetail?num=${drfoolpool.num}"> <%-- 카드 자체를 클릭가능하도록 카드가 a태그 안에 위치 --%>
				        <div class="plCard">
				        	<div class="plCardTitleArea">
						        <img alt="미해결이파리" src="./static/img/plleaf-unsolved.png" class="plleaf">
						        <label class="plCardTitle">제목3생략되는긴제목생략되는긴제목긴제목긴제목긴제목긴제목긴제목긴제목</label>
					        </div>
					        <div class="plthumbnailArea">
								<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}"/>
					        </div>
				        </div>
					</a>
			    </div> <%-- plCardGrid --%>
                
                
                <%-- 검색바 --%>
                <h5 class="plsearchBar">
                	<select name="type">
                		<option value="unselected">선택</option>
                		<option value="writer">작성자</option>
                		<option value="all">제목+내용</option>
                	</select>
                	<input type="text" name="keyword" id="keyword" value="${res.keyword }"/>
					<input type="submit" value="검색"/>
                </h5>
                
                <%-- 페이징 영역 --%>
                <div class="plpaging">
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
			      <div class="plpagingnumbs">
			      	<a href="1page" id="plpagingnumbs-selected">1</a><a href="2page">2</a><a>3</a><a>4</a><a>5</a><a>6</a><a>7</a><a>8</a><a>9</a><a>10</a>
			      </div>
			      <c:choose>
			         <c:when test="${res.pageInfo.curPage<res.pageInfo.allPage }">
			            <a href="drfoolpoollist?page=${res.pageInfo.curPage+1}">&gt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&gt;</a>
			         </c:otherwise>
			      </c:choose>
			   </div> <%-- plpaging --%>
               
               
               
               <div class="plBottomBorder"></div> 
                
            </div>
            <%-- plDivLine --%>
            
            <%-- 1011 dev pull 하기 전 --%>
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
</body>

</html>