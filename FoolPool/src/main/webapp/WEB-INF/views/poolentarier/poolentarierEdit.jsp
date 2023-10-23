<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

			<div class="peLabel">풀랜테리어</div>
			<div class="peDivLine">
            	<div class="peTopBorder"></div>
				<%-- 게시글 작성 --%>
                <section class="peFormSection">
                	<h2>풀랜테리어 글 수정</h2>
					<form action="poolentarierEdit" method="post" enctype="multipart/form-data" name="poolentarierEdit" id="peForm">
						<div class="peInputArea">
							<ul>
								<li>
				                    <label>제목 <b>*</b></label><br>
				                    <input class="peFormTitle" name="title" type="text" required="required" maxlength="100" value="${poolentarier.title}">
				                    <div class="peTitleValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                    <label>내용 <b>*</b></label><br>
				                    <textarea class="peFormContent" name="content" rows="20" cols="42" required="required" maxlength="2000">${poolentarier.content}</textarea>
				                    <div class="peContentValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                	<input class="pePlantsName" name="plantsName" type="text" placeholder="식물 이름" required="required" maxlength="50" value="${poolentarier.plantsName}">
				                </li>
				                <li>
				                	<input id="keywordId" type="text" placeholder="키워드 입력"
											name="keywordInput" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
									<button class="peKeywordAddBtn" onclick="addKeywordBtn(event)">추가</button>
				                </li>
				                <li>
				                	<ul id="keywordList">
										<c:if test="${keywords ne Empty}">
											<c:forEach items="${keywords }" var="keyword" >
											<c:set var="i" value="${i+1}"/>
													<li>
														<span name="keyword">${keyword}</span><span class='remove-button' onclick='removeKeywordBtn(this)'> X</span>
													</li>
											</c:forEach>
										</c:if>
									</ul>
				                </li>
				                <li>
				                    <label>이미지 업로드 <b>*</b></label><br>
				                    <div class="peFileSection">
					                    <%-- 선택된 파일명 표시하며 이 값을 통해 null로 제출되면 안되는 파일선택여부를 체크함 --%>
					                    <input class="peSelectedFileName" placeholder="첨부파일명" value="${poolentarier.fileName}" readonly="readonly" required="required"/>
					                    <%-- input type="file"(파일선택 버튼)를 숨기고 커스텀한 label을 사용 --%>
					                    <input type="file" class="peFormImgInput" name="fileName" id="peFileforedit" accept="image/*" style="display: none;"/>
					                    <label for="peFileforedit" class="peCustomFileBtn">파일 선택</label><br>
					                    <%-- 기존 이미지 표시 --%>
					                    <img id="peFormImgExisting" src="image?file=${poolentarier.fileName}">
					                    <%-- 업로드이미지 미리보기 --%>
					                    <img class="peFormImgPreview" style="display: none;">
				                    </div>
				                </li>
							</ul>
							<div class="peFormBtn peFormBtnforwrite">
								<input type="submit" value="등록"/>&nbsp;&nbsp; 
								<input type="button" value="취소" onclick="poolentarierCancelBtn();"/>
							</div>
						</div>
						
						<c:if test="${keywords ne Empty}">
							<c:forEach items="${keywords}" var="keyword" >
								<c:set var="i" value="${i+1}"/>
									<input type="checkbox" name="keywordForSubmit" class="checkboxKeyword" value="${keyword}" checked="true"/>
							</c:forEach>
						</c:if>

						<input type="hidden" name="no" value="${no}"/>
					</form>
				</section>
			    	
               <div class="peBottomBorder"></div>
		</div>
	</div>
</body>
</html>