<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
		
			<div class="pdLabel">풀랜테리어</div>
			<div class="pdDivLine">
				<div class="pdTopBorder"></div>
			
				<%-- 게시글 상세 --%>
				<div class="pdDetailArea">
					<div class="pdDetail-1row">
						<label class="plDetailTitle">${poolentarier.title}</label>
					</div>
					<div class="pdDetail-2row">
						<span class="pdDetail-writer">작성자: ${poolentarier.writerNickname}</span>
						<span>작성일: ${poolentarier.date}</span>
						<span>조회수: ${poolentarier.view}</span>
					</div>
			
					<%-- #1 이미지 크기를 통일 or max크기(영역)만 지정 --%>
					<%-- #2 textarea 입력양에 따라 자동으로 크기 변경되도록 JS함수이용 --%>
					<div class="pdDetail-3row">
						<img alt="풀랜테리어 사진" src="image?file=${poolentarier.fileName}">
					</div>
					
					<div class="pdDetail-4row">식물명: ${poolentarier.plantsName}</div>
					<div class="pdDetail-5row">
						${poolentarier.content}
					</div>
					<div class="pdDetail-6row">
						<c:forEach items="${keywords}" var="keyword" >
							<span>${keyword}</span>&nbsp;
						</c:forEach>
					</div>
					<div class="pdDetail-7row">
						<c:if test="${member ne Empty && member.id eq poolentarier.writerId}">
							<a href="poolentarierEdit?no=${poolentarier.no}"><button>수정</button></a>
							<button onclick="pdRemovePoolentarier(${poolentarier.no})">삭제</button></a>
						</c:if>
						<a href="goPoolentarier"><button>목록</button></a>
					</div>
			
					<div class="pdCommentArea">
						<h4>댓글 [${commentCount}]</h4>
						<table>
							<c:forEach items="${poolentarierCommentList }" var="comment">
								<tr>
									<fmt:formatDate value="${comment.commentDate}" pattern="yyyy.MM.dd. HH:mm" var="formattedCommentDate" />
					    			<td>${comment.writerNickname}</td>
									<td>
										<label>${comment.commentContent}</label></br>
					    				<small>${formattedCommentDate}</small>
									</td>
									<td>
					    				<c:if test="${member ne Empty && member.id eq comment.writerId}">
											<td>
												<button class="pdCommentDelBtn" onclick="pdRemoveComment(${comment.commentNo}, ${comment.postNo})">X</button>
											</td>
										</c:if>
					    			</td>
								</tr>
							</c:forEach>
						</table>
						
						<c:if test="${member ne Empty }">
							<div class="pdCommentWriteArea">
								<form action="poolentarierCommentAdd" method="post" id="pdCommentForm">
									<input type="hidden" name="postNo" value="${poolentarier.no }"/>
									<div id="pdCommentWriter">
										${member.nickname}<img alt="펜" src="./static/img/pen.png" id="pdPen">
									</div>
									<div>
										<textarea maxlength="300" id="pdCommentValue" onkeyup="pdCommentValidation()" name="commentContent" required="required" placeholder="댓글을 입력해주세요"></textarea>
					    				<div id="pdCommentValidationMsg"></div>
					    				<p id="pdCommentFormBtns">
						    				<input type="submit" value="댓글 등록"/>
						    				<input type="reset" value="입력 취소" id="pdResetCommentbtn" disabled/>
					    				</p>
									</div>
								</form>
							</div>
						</c:if>
					</div>
					
				</div>
				<div class="pdBottomBorder"></div>
				<!-- pdDivLine -->
			</div>
		</div>
	</div>
</body>
</html>