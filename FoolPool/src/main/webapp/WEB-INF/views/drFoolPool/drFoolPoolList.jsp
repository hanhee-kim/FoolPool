<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
            	<%-- 필터링 + 글쓰기 버튼 --%>
            	<div class="drFP-FilteringAndWriteBtn">
	                <div class="drFP-Filtering">
		                <c:url var="urlfilterall" value="goDrFoolPool">
						    <c:param name="page" value="1" />
						    <c:param name="filter" value="all" />
						    <c:if test="${sOption ne null && sValue ne null}">
						        <c:param name="sOption" value="${sOption}" />
						        <c:param name="sValue" value="${sValue}" />
						    </c:if>
						</c:url>
						<a href="${urlfilterall}" class="${filter eq 'all' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">전체</a>
						
		                <c:url var="urlfilterunsolved" value="goDrFoolPool">
						    <c:param name="page" value="1" />
						    <c:param name="filter" value="unsolved" />
						    <c:if test="${sOption ne null && sValue ne null}">
						        <c:param name="sOption" value="${sOption}" />
						        <c:param name="sValue" value="${sValue}" />
						    </c:if>
						</c:url>
						<a href="${urlfilterunsolved}" class="${filter eq 'unsolved' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">미해결</a>
						
		                <c:url var="urlfiltersolved" value="goDrFoolPool">
						    <c:param name="page" value="1" />
						    <c:param name="filter" value="solved" />
						    <c:if test="${sOption ne null && sValue ne null}">
						        <c:param name="sOption" value="${sOption}" />
						        <c:param name="sValue" value="${sValue}" />
						    </c:if>
						</c:url>
						<a href="${urlfiltersolved}" class="${filter eq 'solved' ? 'drFP-FilterBtn drFP-FilterBtnSelected' : 'drFP-FilterBtn'}">해결</a>
					</div>
					
	                <c:if test="${member ne Empty}">
                		<a href="drFoolpoolForm?num"><button class="drFP-writeBtn">질문하기</button></a>
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
							<c:url var="urldetail" value="drFoolPoolDetail">
							    <c:param name="no" value="${drfoolpool.no}" />
							    <c:param name="prevpage" value="${resMap.pageInfo.curPage}" />
							    <c:param name="filter" value="${filter}" />
							    <c:if test="${sOption ne null && sValue ne null}">
							        <c:param name="sOption" value="${sOption}" />
							        <c:param name="sValue" value="${sValue}" />
							    </c:if>
							</c:url>
					        <a href="${urldetail}"> 
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
	                		<option value="unselected" ${sOption eq 'unselected' ? 'selected' : ''}>선택</option>
						    <option value="writer_nickname" ${sOption eq 'writer_nickname' ? 'selected' : ''}>작성자</option>
						    <option value="all" ${sOption eq 'all' ? 'selected' : ''}>제목+내용</option>
						    <option value="title" ${sOption eq 'title' ? 'selected' : ''}>제목</option>
						    <option value="content" ${sOption eq 'content' ? 'selected' : ''}>내용</option>
	                	</select>
	                	<input type="text" maxlength="100" name="sValue" id="drFP-sValue" class="drFP-text" value="${sValue}"/>
						<input type="submit" value="검색"/>
                	</form>
                </h5>
                
                <%-- 페이징 영역 --%>
                <div class="drFP-paging">
			      <c:choose>
			         <c:when test="${resMap.pageInfo.curPage>1 }">
			         	<c:url var="urlprevpagenumber" value="goDrFoolPool">
						    <c:param name="page" value="${resMap.pageInfo.curPage-1}" />
						    <c:param name="filter" value="${filter}" />
						    <c:if test="${sOption ne null && sValue ne null}">
						        <c:param name="sOption" value="${sOption}" />
						        <c:param name="sValue" value="${sValue}" />
						    </c:if>
						</c:url>
			            <a href="${urlprevpagenumber}">&lt;</a>
			         </c:when>
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
			               <%-- c:url태그로 sOption과 sValue 유무에 따라 동적으로 get요청 url을 생성하여 a태그의 href에 등록 --%>
			               <c:url var="urlcurpagenumber" value="goDrFoolPool">
							    <c:param name="page" value="${i}" />
							    <c:param name="filter" value="${filter}" />
							    <c:if test="${sOption ne null && sValue ne null}">
							        <c:param name="sOption" value="${sOption}" />
							        <c:param name="sValue" value="${sValue}" />
							    </c:if>
							</c:url>
							<a href="${urlcurpagenumber}" id="drFP-selectedPage">${i}</a>
			            </c:when>
			            <c:otherwise>
			            	<c:url var="urlpagenumberschange" value="goDrFoolPool">
							    <c:param name="page" value="${i}" />
							    <c:param name="filter" value="${filter}" />
							    <c:if test="${sOption ne null && sValue ne null}">
							        <c:param name="sOption" value="${sOption}" />
							        <c:param name="sValue" value="${sValue}" />
							    </c:if>
							</c:url>
							<a href="${urlpagenumberschange}" class="drFP-unselectedPage">${i}</a>
			            </c:otherwise>
			         </c:choose>
			      </c:forEach>

			      <c:choose>
			         <c:when test="${resMap.pageInfo.curPage<resMap.pageInfo.allPage }">
			         	<c:url var="urlnextpagenumber" value="goDrFoolPool">
						    <c:param name="page" value="${resMap.pageInfo.curPage+1}" />
						    <c:param name="filter" value="${filter}" />
						    <c:if test="${sOption ne null && sValue ne null}">
						        <c:param name="sOption" value="${sOption}" />
						        <c:param name="sValue" value="${sValue}" />
						    </c:if>
						</c:url>
			            <a href="${urlnextpagenumber}">&gt;</a>
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