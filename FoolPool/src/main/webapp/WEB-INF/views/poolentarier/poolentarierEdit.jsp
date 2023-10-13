<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="peLabel">풀랜테리어</div>
			<div class="peDivLine">
            	<div class="peTopBorder"></div>
				<div class="peEditArea">
					<table class="peTable pfTable-striped">
						<thead>
							<tr>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="peFormTitle"
									placeholder="제목" name="boardTitle" maxlength="50" /></td>
							</tr>
							<tr>
								<td>
									<textarea class="peFormContent" placeholder="본문"
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
									<input class="pePlantName" type="text" placeholder="식물 이름"
										name="plnatName">
								</td>
							</tr>							
							<tr>
								<td>
									<input id="peKeyword" type="text" placeholder="키워드 입력"
										name="keyword">
									<button class="peKeywordAddBtn" onclick="addKeyword()">추가</button>
								</td>
							</tr>
							<tr>
								<td class="peKeywordContainer">
									<ul id="keywordList">
										<!-- 여기에 추가된 텍스트가 나타납니다. -->
									</ul>
								</td>
							</tr>
							<tr>
								<td class="peSaveBtnContainer">
									<input type="submit" class="peBtn btn-primary pull-right" value="수정"/>
								</td>
								<td class="peSaveBtnContainer">
									<button class="peBtn">취소</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="peBottomBorder"></div>
			</div>
			<!-- pfDivLine -->
		</div>
	</div>
</body>
</html>