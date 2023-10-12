<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="bean.DrFoolPool" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<% 
System.out.println("------drFoolPoolList.jsp-------");
Map<String,Object> resMap = (Map)request.getAttribute("resMap");
List<DrFoolPool> list = (List)resMap.get("drFoolPoolList");
System.out.println("리스트의 0번째 게시글 번호: " + list.get(0).getNo()); 
%>


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
			        <c:forEach items="${resMap.drFoolPoolList}" var="drfoolpool">
			        <a href="drFoolpoolDetail?no=${drfoolpool.no}"> 
				        <div class="drFP-Card">
				        	<div class="drFP-CardTitleArea">
				        		<c:choose>
					        		<c:when test="${drfoolpool.isSolved==false}">
							        <img alt="미해결이파리" src="./static/img/drFP-leaf-unsolved.png" class="drFP-leaf">
					        		</c:when>
					        		<c:otherwise>
							        <img alt="해결이파리" src="./static/img/drFP-leaf-solved.png" class="drFP-leaf">
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
                
                
                <%-- 검색바 --%>.
                <h5 class="drFP-searchBar">
                	<select name="type">
                		<option value="unselected">선택</option>
                		<option value="writer">작성자</option>
                		<option value="all">제목+내용</option>
                	</select>
                	<input type="text" name="keyword" id="keyword" value="${resMap.keyword }"/>
					<input type="submit" value="검색"/>
                </h5>
                
                
                <%-- 페이징 영역 --%>
                <div class="drFP-paging">
			      <c:choose>
			         <c:when test="${resMap.pageInfo.curPage>1 }">
			            <a href="goDrFoolPool?page=${resMap.pageInfo.curPage-1}">&lt;</a>
			         </c:when>
			         <c:otherwise>
			            <a>&lt;</a>
			         </c:otherwise>
			      </c:choose>
			      
			      <c:forEach begin="${resMap.pageInfo.startPage}" end="${resMap.pageInfo.endPage}" var="i">
			         <c:choose>
			            <c:when test="${resMap.pageInfo.curPage==i}">
			               <a href="goDrFoolPool?page=${i}" id="drFP-selectedPage" onclick="callBtn(${i});return ${resMap.keyword==null};">${i}</a>&nbsp;
			               </c:when>
			            <c:otherwise>
			               <a href="goDrFoolPool?page=${i}" class="drFP-unselectedPage" onclick="callBtn(${i});return ${resMap.keyword==null};">${i}</a>&nbsp;
			               </c:otherwise>
			         </c:choose>
			      </c:forEach>

			      <c:choose>
			         <c:when test="${resMap.pageInfo.curPage<resMap.pageInfo.allPage }">
			            <a href="goDrFoolPool?page=${resMap.pageInfo.curPage+1}">&gt;</a>
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