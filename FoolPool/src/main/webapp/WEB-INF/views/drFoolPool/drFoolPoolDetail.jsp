<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
				    	<fmt:formatDate value="${drFoolPool.date}" pattern="yyyy.MM.dd. HH:mm" var="formattedDate" />
				    	<span>작성자: ${drFoolPool.writerNickname}</span>
						<span>작성일: ${formattedDate}</span>
				    	<span>조회수: ${drFoolPool.view}</span>
			    	</div>
			    	<div class="drFP-detail-3row">
			    		<img alt="풀풀박사게시글이미지" src="image?file=${drFoolPool.fileName}">
			    	</div>
			    	<div class="drFP-detail-4row">${drFoolPool.content}</div>
			    	<div class="drFP-detail-5row">
			    		<c:if test="${member ne Empty && member.id eq drFoolPool.writerId}">
				    		<button onclick="drFPedit(${drFoolPool.no})">수정</button>
				    		<button onclick="drFPdelete(${drFoolPool.no}, ${prevpage}, ${filter}, ${sOption}, ${sValue})">삭제</button>
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
						    					<button class="drFP-commentPickBtn" onclick="drFPCommPick(${comment.commentNo}, ${comment.postNo})">채택하기</button>
					    					</c:if>
					    					<c:if test="${member ne Empty && member.id eq comment.writerId && comment.isPicked eq false }">
						    					<button class="drFP-commentDelBtn" onclick="drFPCommDelete(${comment.commentNo}, ${comment.postNo})">×</button>
					    					</c:if>
					    				</td>
					    			</tr>
				    			</c:forEach>
				    		</table>
				    	<c:if test="${member ne Empty}">
				    		<div id="dfFP-commentForm">
					    		<form action="addDrFoolPoolComment" method="post">
					    			<input type="hidden" name="postNo" value="${drFoolPool.no}"/>
					    			<span>${member.nickname}</span>
					    			<input type="text" maxlength="300" id="drFP-commentValue" onkeyup="drFPcommentValidation()" name="commentContent" class="drFP-text"/>
					    			<div id="drFP-commentValidationMsg"></div>
					    			<input type="submit" value="등록"/>
					    		</form>
				    		</div>
				    	</c:if>
			    	</div>
			    	
			    	
			    </div> <%-- drFP-detailArea --%>
                
                
               <div class="drFP-BottomBorder drFP-detailBottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
	
	

</body>

</html>