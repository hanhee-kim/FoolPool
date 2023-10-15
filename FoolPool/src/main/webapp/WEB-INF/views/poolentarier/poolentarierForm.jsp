<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="pfLabel">풀랜테리어</div>
			<div class="pfDivLine">
            	<div class="pfTopBorder"></div>
				<div class="pfFormArea">
					<form action="poolentarierForm" method="post" enctype="multipart/form-data">
						<table class="pfTable pfTable-striped">
							<thead>
								<tr>
									<th colspan="2"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="pfFormTitle"
										placeholder="제목" name="title" maxlength="50" /></td>
								</tr>
								<tr>
									<td>
										<textarea class="pfFormContent" placeholder="본문"
											name="content" maxlength="3000"></textarea>
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
											name="plantsName">
									</td>
								</tr>							
								<tr>
									<td>
										<input id="pfKeyword" type="text" placeholder="키워드 입력"
											name="keyword">
										<button class="pfKeywordAddBtn" onclick="addKeyword(event)">추가</button>
									</td>
								</tr>
								<tr>
									<td class="pfKeywordContainer">
										<ul id="keywordList">
											<!-- 여기에 추가된 텍스트가 나타납니다. -->
										</ul>
									</td>
								</tr>
								<tr>
									<td class="pfSaveBtnContainer">
										<input type="submit" class="pfBtn btn-primary pull-right" value="저장"/>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					
				</div>
				<div class="pfBottomBorder"></div>
			</div>
			<!-- pfDivLine -->
		</div>
	</div>
</body>
</html>