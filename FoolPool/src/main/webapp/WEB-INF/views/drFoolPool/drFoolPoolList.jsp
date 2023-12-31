<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

<%-- 검색값 유무에 따라 &page=${}&filter=${} 전까지의 url을 생성한 뒤 (1)필터링, (2)페이징영역의 a태그의 href 등록 --%>
<c:choose>
	<c:when test="${sOption ne null && sValue ne null}">
		<c:set value="drFoolPoolDetail?sOption=${sOption}&sValue=${sValue}&" var="drFoolPoolDetailUrl"/>
		<c:set value="goDrFoolPool?sOption=${sOption}&sValue=${sValue}&" var="goDrFoolPoolUrl"/>
	</c:when>
	<c:otherwise>
		<c:set value="drFoolPoolDetail?" var="drFoolPoolDetailUrl"/>
		<c:set value="goDrFoolPool?" var="goDrFoolPoolUrl"/>
	</c:otherwise>
</c:choose>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
            	<%-- 필터링 + 글쓰기 버튼 --%>
            	<div class="drFP-FilteringAndWriteBtn">
	                <div class="drFP-Filtering">
						<a href="${goDrFoolPoolUrl}page=1&filter=all" class="${filter eq 'all' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">전체</a>
						<a href="${goDrFoolPoolUrl}page=1&filter=unsolved" class="${filter eq 'unsolved' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">미해결</a>
						<a href="${goDrFoolPoolUrl}page=1&filter=solved" class="${filter eq 'solved' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">해결</a>
					</div>
					
	                <c:if test="${member ne Empty}">
                		<a href="drFoolpoolForm"><button class="drFP-writeBtn">질문하기</button></a>
                	</c:if>
                </div>
                
                 
                <%-- 카드그리드 3x2 --%>
		    	<c:if test="${resMap['drFoolPoolList'].size()==0}">
		    		<div id="drFP-emptyList">
		    			<p>게시글이 존재하지 않습니다</p>
		    			<img alt="예외처리이파리" src="./static/img/leaf-exception.png" id="drFP-leafException">
		    		</div>
		    	</c:if>
		    	<c:if test="${resMap['drFoolPoolList'].size()>0}">
				    <div class="drFP-CardGrid">
						<c:forEach items="${resMap['drFoolPoolList']}" var="drfoolpool">
					        <a href="${drFoolPoolDetailUrl}no=${drfoolpool.no}&page=${resMap.pageInfo.curPage}&filter=${filter}" id="drFP-selectedPage">
						        <div class="drFP-Card">
						        	<div class="drFP-CardTitleArea">
						        		<c:choose>
							        		<c:when test="${drfoolpool.isSolved==false}">
									        <img alt="미해결이파리" src="./static/img/leaf-unsolved.png" class="drFP-leaf">
							        		</c:when>
							        		<c:otherwise>
									        <img alt="해결이파리" src="./static/img/leaf-solved.png" class="drFP-leaf">
							        		</c:otherwise>
						        		</c:choose>
								        <label class="drFP-CardTitle">${drfoolpool.title}</label>
							        </div>
							        <div class="drFP-thumbnailArea">
										<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.fileName}" width="290" height="160"/>
							        </div>
						        </div>
							</a>
				        </c:forEach>
			    	</div> <%-- drFP-CardGrid --%>
                </c:if>
                
                <%-- 검색바 --%>
                <h5 class="drFP-searchBar">
                	<form action="goDrFoolPool" method="get" id="drFP-searchForm">
	                	<select name="sOption" id="drFP-sOption" value="${sOption}">
						    <option value="all" ${sOption eq 'all' ? 'selected' : ''}>제목+내용</option>
						    <option value="title" ${sOption eq 'title' ? 'selected' : ''}>제목</option>
						    <option value="content" ${sOption eq 'content' ? 'selected' : ''}>내용</option>
						    <option value="writer_nickname" ${sOption eq 'writer_nickname' ? 'selected' : ''}>작성자</option>
	                	</select>
	                	<input type="text" maxlength="100" name="sValue" id="drFP-sValue" class="drFP-text" value="${sValue}"/>
						<input type="submit" value="검색"/>
                	</form>
                </h5>
                
                <%-- 페이징 영역 --%>
                <div class="drFP-paging">
			      <c:choose>
			      	 <%-- 이전페이지 이동 꺽쇠 --%>
			         <c:when test="${resMap.pageInfo.curPage>1 }">
			            <a href="${goDrFoolPoolUrl}page=${resMap.pageInfo.curPage-1}&filter=${filter}">&lt;</a>
			         </c:when>
			         <%-- 검색결과 없을때 --%>
			         <c:when test="${resMap['drFoolPoolList'].size()==0}">
			            <b></b>
			         </c:when>
			         <c:otherwise>
			            <a>&lt;</a>
			         </c:otherwise>
			      </c:choose>
			      
			      <c:forEach begin="${resMap.pageInfo.startPage}" end="${resMap.pageInfo.endPage}" var="i">
			         <c:choose>
			            <c:when test="${resMap.pageInfo.curPage==i}">
					        <a id="drFP-selectedPage">${i}</a>
			            </c:when>
			            <c:otherwise>
					        <a href="${goDrFoolPoolUrl}page=${i}&filter=${filter}" class="drFP-unselectedPage">${i}</a>
			            </c:otherwise>
			         </c:choose>
			      </c:forEach>

			      <c:choose>
			      	 <%-- 다음페이지 이동 꺽쇠 --%>
			         <c:when test="${resMap.pageInfo.curPage<resMap.pageInfo.allPage }">
			            <a href="${goDrFoolPoolUrl}page=${resMap.pageInfo.curPage+1}&filter=${filter}">&gt;</a>
			         </c:when>
			         <c:when test="${resMap['drFoolPoolList'].size()==0}">
			            <b></b>
			         </c:when>
			         <c:otherwise>
			            <a>&gt;</a>
			         </c:otherwise>
			      </c:choose>
			   </div>
			   <%-- drFP-paging --%>
               
               <div class="drFP-BottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
</body>

</html>