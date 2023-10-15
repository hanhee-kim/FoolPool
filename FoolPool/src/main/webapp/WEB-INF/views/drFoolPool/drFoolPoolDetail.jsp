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
			    		<button onclick="drFPdelete(${drFoolPool.no})">삭제</button>
			    		<button onclick="drFPbackToList(${drFoolPool.no})">목록</button>
			    	</div>
			    	
			    	<div class="drFP-commentArea">
			    		<h4>댓글 [${commentCnt}]</h4>
			    		<c:forEach items="${commentList}" var="comment">
				    		<table>
				    			<tr>
				    				<fmt:formatDate value="${comment.commentDate}" pattern="yyyy.MM.dd. HH:mm" var="formattedCommentDate" />
				    				<td>${comment.writerNickname}</td>
				    				<td>${comment.commentContent}</br><small>${formattedCommentDate}</small></td>
				    				<%-- 글작성자인 경우 채택버튼이(+자기댓글아닐때), 댓글작성자인경우 삭제버튼이 표시됨 즉, 동시에 두 버튼이 보일 일은 없음 --%>
				    				<td>
				    					<%--
				    					<button class="drFP-commentPickBtn">채택하기</button>
				    					 --%>
				    					<button class="drFP-commentDelBtn" onclick="drFPCommdelete(${comment.commentNo}, ${comment.postNo})">×</button>
				    				</td>
				    			</tr>
				    		</table>
			    		</c:forEach>
			    		<div id="dfFP-commentForm">
				    		<form action="addDrFoolPoolComment" method="post">
				    			<input type="hidden" name="postNo" value="${drFoolPool.no}"/>
				    			<span>로그인한사용자의닉네임길면줄넘김해주기</span>
				    			<input type="text" name="commentContent"/>
				    			<input type="submit" value="등록"/>
				    		</form>
			    		</div>
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