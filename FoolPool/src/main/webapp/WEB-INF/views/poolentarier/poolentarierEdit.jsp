<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="pfLabel">풀랜테리어</div>
			<div class="pfDivLine">
            	<div class="pfTopBorder"></div>
				<div class="pfFormArea">
					<form action="poolentarierForm" method="post" enctype="multipart/form-data" id="poolentarierForm">
						<table class="pfTable pfTable-striped">
							<thead>
								<tr>
									<th colspan="2"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="text" class="pfFormTitle" placeholder="제목"
										name="title" maxlength="50" value="${poolentarier.title}" />
									</td>
								</tr>
								<tr>
									<td>
										<textarea class="pfFormContent" placeholder="본문"
											name="content" maxlength="3000">${poolentarier.content}</textarea>
									</td>
								</tr>
								<tr>
									<td>
										사진 선택: <input type="file" id="fileName" name="fileName" accept="image/*"><br>
									</td>
								</tr>
								<tr>
									<td>
										<input class="pfPlantsName" type="text" placeholder="식물 이름"
											name="plantsName" value="${poolentarier.plantsName}">
									</td>
								</tr>							
								<tr>
									<td>
										<input id="pfKeyword" type="text" placeholder="키워드 입력"
											name="keyword">
										<button class="pfKeywordAddBtn" onclick="pfAddKeywordBtn(event)">추가</button>
									</td>
								</tr>
								<tr>
									<td class="pfKeywordContainer">
										<ul id="keywordList">
											<c:forEach items="${keywords }" var="keyword" >
												<c:set var="i" value="${i+1}"/>
													<li>
														<span name="keyword">${keyword}</span><span class='pfRemove-button' onclick='pfRemoveKeywordBtn(this)'>X</span>
													</li>
											</c:forEach>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="pfSaveBtnContainer">
										<input type="submit" class="pfBtn btn-primary pull-right" value="저장"/>
									</td>
									<td class="peSaveBtnContainer">
										<button class="pfBtn" onclick="poolentarierCancelBtn();">취소</button>
									</td>
								</tr>
							</tbody>
						</table>
						
						<c:forEach items="${keywords}" var="keyword" >
							<c:set var="i" value="${i+1}"/>
								<input type="checkbox" name="keywordForSubmit" value="${keyword}" checked="true"/>
						</c:forEach>
					</form>
					
				</div>
				<div class="pfBottomBorder"></div>
			</div>
			<!-- pfDivLine -->
		</div>
	</div>
</body>
</html>