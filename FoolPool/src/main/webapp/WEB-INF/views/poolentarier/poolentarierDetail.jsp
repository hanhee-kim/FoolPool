<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>
		
			<div class="pdLabel">풀랜테리어</div>
			<div class="pdDivLine">
				<div class="pdTopBorder"></div>
			
				<%-- 게시글 상세 --%>
				<div class="pdDetailArea">
					<div class="pdDetail-1row">
						<label class="plDetailTitle">식물 인테리어 100일차</label>
					</div>
					<div class="pdDetail-2row">
						<span>작성일: 2023년 10월 9일</span> <span>조회수: 12</span> <span
							class="pdDetail-writer">작성자: 놈친미</span>
					</div>
			
					<%-- #1 이미지 크기를 통일 or max크기(영역)만 지정 --%>
					<%-- #2 textarea 입력양에 따라 자동으로 크기 변경되도록 JS함수이용 --%>
					<div class="pdDetail-3row">
						<img alt="풀랜테리어 게시글" src="image?file=${drfoolpool.filename}">
					</div>
					
					<div class="pdDetail-4row">식물명: 조팝나무</div>
					<div class="pdDetail-5row">
						내가짱이야
					</div>
					<div class="pdDetail-6row">
						<span>#가산</span>
						<span>#조팝나무</span>
						<span>#인테리어</span>
					</div>
					<div class="pdDetail-7row">
						<a href="poolentarierEdit?num=${poolentarier.num }"><button>수정</button></a>
						<button>삭제</button>
						<button onclick="pdBack();">목록</button>
					</div>
			
					<div class="pdCommentArea">
						<h4>댓글 [5]</h4>
						<table>
							<tr>
								<td>닉네임1</td>
								<td>댓글내용1댓글내용1댓글내용1댓글내용1댓글내용1</td>
								<td>
									<button class="pdCommentDelBtn"></button>
								</td>
							</tr>
							<tr>
								<td>닉네임2</td>
								<td>댓글내용2댓글내용2댓글내용2</td>
								<td>
			
									<button class="pdCommentDelBtn"></button>
								</td>
							</tr>
							<tr>
								<td>닉네임3</td>
								<td>줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3</td>
								<td>
									<button class="pdCommentDelBtn"></button>
			
								</td>
							</tr>
							<tr>
								<td>닉네임4</td>
								<td>댓글내용4댓글내용4댓글내용4댓글내용4댓글내용4</td>
								<td>
									<button class="pdCommentDelBtn"></button>
								</td>
							</tr>
							<tr>
								<td>닉네임5</td>
								<td>댓글내용5댓글내용5댓글내용5댓글내용5댓글내용5</td>
								<td>
									<button class="pdCommentDelBtn"></button>
								</td>
							</tr>
						</table>
					</div>
					
				</div>
				<div class="pdBottomBorder"></div>
				<!-- pdDivLine -->
			</div>
		</div>
	</div>
</body>
</html>