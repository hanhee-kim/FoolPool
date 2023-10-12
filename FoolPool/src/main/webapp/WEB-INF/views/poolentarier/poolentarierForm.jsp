<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="pfLabel">풀랜테리어</div>
			<div class="pfDicLine">
            	<div class="pfTopBorder"></div>
				<div class="row">
					<table class="pfTable pfTable-striped">
						<thead>
							<tr>
								<th colspan="2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="pfForm-control"
									placeholder="제목" name="boardTitle" maxlength="50" /></td>
							</tr>
							<tr>
								<td>
									<textarea class="pfForm-control" placeholder="본문"
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
										name="plnatName">
								</td>
							</tr>							
							<tr>
								<td>
									<input id="pfTag" type="text" placeholder="키워드 입력"
										name="tag">
									<button class="pfTagAddBtn" onclick="addTag()">추가</button>
								</td>
							</tr>
							<tr>
								<td class="pfTagContainer">
									<ul id="tagList">
										<!-- 여기에 추가된 텍스트가 나타납니다. -->
									</ul>
								</td>
							</tr>
							<tr>
								<td class="pfSaveBtnContainer"><input type="submit" class="pfBtn btn-primary pull-right" value="저장하기"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="pfBottomBorder"></div>
			</div>
		</div>
	</div>
</body>
</html>