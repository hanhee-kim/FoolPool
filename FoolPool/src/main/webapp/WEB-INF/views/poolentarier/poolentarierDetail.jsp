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
							<c:if test="${poolentarierCommentList ne Empty }">
								<c:forEach items="${poolentarierCommentList }" var="comment">
									<tr>
										<td>${comment.writerNickname }</td>
										<td>
											${comment.commentContent }
											<small>${comment.commentDate }</small>
										</td>
										<c:if test="${member ne Empty && member.id eq comment.writerId}">
											<td>
												<button class="pdCommentDelBtn" onclick="pdRemoveComment(${comment.commentNo}, ${comment.postNo})">X</button>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
						</table>
						<c:if test="${member ne Empty }">
							<div class="pdCommentForm">
								<form action="poolentarierCommentAdd" method="post">
									<input type="hidden" name="postNo" value="${poolentarier.no }"/>
									<span>${member.nickname}</span>
					    			<input type="text" maxlength="300" id="pdCommentValue" onkeyup="pdCommentValidation()" name="commentContent"/>
					    			<div id="pdCommentValidationMsg"></div>
					    			<input type="submit" value="등록"/>
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