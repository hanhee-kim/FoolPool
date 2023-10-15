<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL포맷팅 라이브러리 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
                
                <%-- 게시글 상세 --%>
                <div class="drFP-detailArea">
			    	<div class="drFP-detail-1row">
			    		<label>
				    		<c:choose>
						        <c:when test="${drFoolPool.isSolved}">[해결]</c:when>
						        <c:otherwise>[미해결]</c:otherwise>
						    </c:choose>
			    		</label>
			    		<label class="drFP-detailTitle">${drFoolPool.title}</label>
			    	</div>
			    	<div class="drFP-detail-2row">
						<%--
				    	<span>${drFoolPool.date}</span>
				    	 --%>
				    	 <%-- DATETIME컬럼과 매핑된 java.util.Date필드를 년-월-일로 포맷팅하여 출력 --%>
				    	<fmt:formatDate value="${drFoolPool.date}" pattern="yyyy.MM.dd. HH:mm" var="formattedDate" />
						<span>${formattedDate}</span>
				    	<span>조회수: ${drFoolPool.view}</span>
				    	<span class="dfFP-detail-writer">작성자: ${drFoolPool.writerNickname}</span>
			    	</div>
			    	<div class="drFP-detail-3row">
			    		<img alt="풀풀박사게시글이미지" src="image?file=${drFoolPool.fileName}">
			    	</div>
			    	<div class="drFP-detail-4row">${drFoolPool.content}</div>
			    	<div class="drFP-detail-5row">
			    		<a href="editDrFoolPool"><button>수정</button></a>
			    		<button onclick="dfFPdelete(${drFoolPool.no})">삭제</button>
			    		<button onclick="drFPback();">목록</button>
			    	</div>
			    	
			    	<div class="drFP-commentArea">
			    		<h4>댓글 [5]</h4>
			    		<table>
			    			<tr>
			    				<td>닉네임1</td>
			    				<td>댓글내용1댓글내용1댓글내용1댓글내용1댓글내용1</td>
			    				<%-- 글작성자인 경우 채택버튼이(+자기댓글아닐때), 댓글작성자인경우 삭제버튼이 표시됨 즉, 동시에 두 버튼이 보일 일은 없음 --%>
			    				<td>
			    					<%--
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					 --%>
			    					<button class="drFP-commentDelBtn">×</button>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임2</td>
			    				<td>댓글내용2댓글내용2댓글내용2</td>
			    				<td>
			    					<%--
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					 --%>
			    					<button class="drFP-commentDelBtn">×</button>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임3</td>
			    				<td>줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임4</td>
			    				<td>댓글내용4댓글내용4댓글내용4댓글내용4댓글내용4</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임5</td>
			    				<td>댓글내용5댓글내용5댓글내용5댓글내용5댓글내용5</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    		</table>
			    	</div>
			    	
			    	
			    </div> <%-- drFP-detailArea --%>
                
                
               <div class="drFP-BottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
	
	

</body>

</html>