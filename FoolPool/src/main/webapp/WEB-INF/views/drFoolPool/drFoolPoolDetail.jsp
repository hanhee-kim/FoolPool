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
                	<div class="drFP-detail-hiddenrow" data-no='${drFoolPool.no}' data-page='${page}' data-filter='${filter}' data-sOption='${sOption}' data-sValue='${sValue}'></div>
			    	<div class="drFP-detail-1row" id="drFP-topOfPage">
			    		<label>
				    		<c:choose>
						        <c:when test="${drFoolPool.isSolved}">[해결]&nbsp;</c:when>
						        <c:otherwise>[미해결]&nbsp;</c:otherwise>
						    </c:choose>
			    		</label>
			    		<label class="drFP-detailTitle">${drFoolPool.title}</label>
			    	</div>
			    	<div class="drFP-detail-2row">
				    	<fmt:formatDate value="${drFoolPool.date}" pattern="yyyy.MM.dd. HH:mm" var="formattedDate" />
				    	<span>${drFoolPool.writerNickname}</span>
						<span>${formattedDate}</span>
				    	<span>조회: ${drFoolPool.view}</span>
				    	<span><a href="#drFP-topOfComment"><img alt="댓글란바로가기" src="./static/img/comment.png" id="drFP-movecommenttopImg"><sup id="drFP-commentCnt1">${commentCnt}</sup></a></span>
			    	</div>
			    	<div class="drFP-detail-3row">
			    		<img alt="풀풀박사게시글이미지" src="image?file=${drFoolPool.fileName}">
			    	</div>
			    	<div class="drFP-detail-4row">${drFoolPool.content}</div>
			    	<div class="drFP-detail-5row">
			    		<c:if test="${member ne Empty && member.id eq drFoolPool.writerId}">
				    		<button onclick="drFPedit()">수정</button>
				    		<button id="drFPdelBtn" onclick="drFPdelBtnfunction()">삭제</button>
			    		</c:if>
			    		<button onclick="drFPbackToList()">목록</button>
			    	</div>
			    	
			    	<div class="drFP-commentArea" id="drFP-topOfComment">
			    		<h4>댓글 [<label id="drFP-commentCnt2">${commentCnt}</label>]</h4>
				    		<table id="drFP-commentTable">
					    		<c:forEach items="${commentList}" var="comment">
					    			<tr>
					    				<fmt:formatDate value="${comment.commentDate}" pattern="yyyy.MM.dd. HH:mm" var="formattedCommentDate" />
					    				<td class="${comment.isPicked eq true ? 'drFP-picked' : ''}">${comment.writerNickname}</td>
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
					    						<%-- 기존 요청 --%>
					    						<%-- <button class="drFP-commentDelBtn" onclick="drFPCommDelete(${comment.commentNo}, ${comment.postNo})">×</button> --%>
						    					<%-- 클릭시 동작하는 함수 안에서의 요청을 ajax요청으로 변경 --%>
						    					<button class="drFP-commentDelBtn" data-commentNo='${comment.commentNo}'>×</button>
					    					</c:if>
					    				</td>
					    			</tr>
				    			</c:forEach>
				    		</table>
				    	<c:if test="${member ne Empty}">
				    		<div id="drFP-commentWriteArea">
					    		<form action="addDrFoolPoolComment" method="post" id="drFP-commentForm">
					    			<input type="hidden" name="postNo" value="${drFoolPool.no}"/> 
					    			<input type="hidden" name="page" value="${page}"/>
									<input type="hidden" name="filter" value="${filter}"/>
									<input type="hidden" name="sOption" value="${sOption}"/>
									<input type="hidden" name="sValue" value="${sValue}"/>
					    			
					    			<div id="drFP-commentWriter">
					    				${member.nickname}<img alt="펜" src="./static/img/pen.png" id="drFP-pen">
					    			</div>
					    			<div>
					    				<textarea maxlength="200" id="drFP-commentValue" onkeyup="drFPcommentValidation()" name="commentContent" required="required" placeholder="댓글을 입력해주세요"></textarea>
					    				<span id="drFP-commentValidationMsg"></span>
					    				<span id="drFP-commentFormBtns">
						    				<input type="submit" value="댓글 등록"/>
						    				<input type="reset" value="입력 취소" id="drFP-resetCommentbtn" disabled/>
					    				</span>
					    			</div>
					    		</form>
				    		</div>
				    	</c:if>
			    	</div>
			    	
			    	<div class="drFP-moveTopOfPageDiv">
				    	<a href="#drFP-topOfPage" class="drFP-moveTopOfPageAnchor"><img alt="^" src="./static/img/movepagetop.png" id="drFP-movepagetopImg"></a>
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