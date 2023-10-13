<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="pfLabel">풀랜테리어</div>
			<div class="pfDivLine">
            	<div class="pfTopBorder"></div>
				<div class="pfFormArea">
					<table class="pfTable pfTable-striped">
						<thead>
							<tr>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="pfFormTitle"
									placeholder="제목" name="boardTitle" maxlength="50" /></td>
							</tr>
							<tr>
								<td>
									<textarea class="pfFormContent" placeholder="본문"
										name="boardContent" maxlength="3000"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									사진 선택: <input type="file" name="photo"><br>
								</td>
							</tr>
							<tr>
								<td>
									<input class="pfPlantName" type="text" placeholder="식물 이름"
										name="pfnatName">
								</td>
							</tr>							
							<tr>
								<td>
									<input id="pfKeyword" type="text" placeholder="키워드 입력"
										name="keyword">
									<button class="pfKeywordAddBtn" onclick="addKeyword()">추가</button>
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
				</div>
				<div class="pfBottomBorder"></div>
			</div>
			<!-- pfDivLine -->
		</div>
	</div>
</body>
</html>