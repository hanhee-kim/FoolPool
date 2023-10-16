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
			    		<c:if test="${member ne Empty && member.id eq drFoolPool.writerId}">
				    		<button onclick="drFPedit(${drFoolPool.no})">수정</button>
				    		<button onclick="drFPdelete(${drFoolPool.no})">삭제</button>
			    		</c:if>
			    		<button onclick="drFPbackToList(${drFoolPool.no})">목록</button>
			    	</div>
			    	
			    	<div class="drFP-commentArea">
			    		<h4>댓글 [${commentCnt}]</h4>
				    		<table>
					    		<c:forEach items="${commentList}" var="comment">
					    			<tr>
					    				<fmt:formatDate value="${comment.commentDate}" pattern="yyyy.MM.dd. HH:mm" var="formattedCommentDate" />
					    				<td>${comment.writerNickname}</td>
					    				<td>
						    				<c:if test="${comment.isPicked==true}">
						    					<img alt="채택왕관" src="./static/img/crown.png" class="drFP-crown">&nbsp;
						    				</c:if>
						    				<label class="${comment.isPicked eq true ? 'drFP-picked' : ''}">${comment.commentContent}</label></br>
					    					<small>${formattedCommentDate}</small>
					    				</td>
					    				<td>
					    					<c:if test="${member ne Empty && member.id eq drFoolPool.writerId && member.id ne comment.writerId && drFoolPool.isSolved eq false}">
						    					<button class="drFP-commentPickBtn">채택하기</button>
					    					</c:if>
					    					<c:if test="${member ne Empty && member.id eq comment.writerId && comment.isPicked eq false }">
						    					<button class="drFP-commentDelBtn" onclick="drFPCommdelete(${comment.commentNo}, ${comment.postNo})">×</button>
					    					</c:if>
					    				</td>
					    			</tr>
				    			</c:forEach>
				    		</table>
				    	<c:if test="${member ne Empty}">
				    		<div id="dfFP-commentForm">
					    		<form action="addDrFoolPoolComment" method="post">
					    			<input type="hidden" name="postNo" value="${drFoolPool.no}"/>
					    			<span>로그인한사용자의닉네임길면줄넘김해주기</span>
					    			<input type="text" name="commentContent"/>
					    			<input type="submit" value="등록"/>
					    		</form>
				    		</div>
				    	</c:if>
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