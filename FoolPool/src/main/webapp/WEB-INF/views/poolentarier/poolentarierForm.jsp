<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="pfLabel">풀랜테리어</div>
            <div class="pfDivLine">
            	<div class="pfTopBorder"></div>

                <%-- 게시글 작성 --%>
                <section class="pfFormSection">
                	<h2>풀랜테리어 글 작성</h2>
					<form action="poolentarierForm" method="post" enctype="multipart/form-data" name="poolentarierForm" id="pfForm">
						<div class="pfInputArea">
							<ul>
								<li>
				                    <label>제목 <b>*</b></label><br>
				                    <input class="pfFormTitle" name="title" type="text" required="required" maxlength="100">
				                    <div class="pfTitleValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                    <label>내용 <b>*</b></label><br>
				                    <textarea class="pfFormContent" name="content" rows="20" cols="42" placeholder="***&#10;&#10;풀랜테리어 글은 이미지 첨부와 식물 이름 작성을 꼭 해주세요.&#10;&#10;***" required="required" maxlength="2000"></textarea>
				                    <div class="pfContentValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                	<input class="pfPlantsName" name="plantsName" type="text" placeholder="식물 이름" required="required" maxlength="50">
				                </li>
				                <li>
				                	<input id="keywordId" type="text" placeholder="키워드 입력"
											name="keywordInput" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)">
									<button class="pfKeywordAddBtn" onclick="addKeywordBtn(event)">추가</button>
				                </li>
				                <li>
				                	<ul id="keywordList">
										<%-- 추가될 키워드 영역 --%>
									</ul>
				                </li>
				                <li>
				                    <label>이미지 업로드 <b>*</b></label><br>
				                    <div class="pfFileSection">
					                    <%-- 선택된 파일명 표시하며 이 값을 통해 null로 제출되면 안되는 파일선택여부를 체크함 --%>
					                    <input class="pfSelectedFileName" placeholder="첨부파일명" value="첨부파일 미선택" readonly="readonly" required="required"/>
					                    <%-- input type="file"(파일선택 버튼)를 숨기고 커스텀한 label을 사용 --%>
					                    <input type="file" class="pfFormImgInput" name="fileName" id="pfFileforwrite" accept="image/*" style="display: none;"/>
					                    <label for="pfFileforwrite" class="pfCustomFileBtn">파일 선택</label><br>
					                    <%-- 업로드이미지 미리보기 --%>
					                    <img class="pfFormImgPreview" style="display: none;">
				                    </div>
				                </li>
							</ul>
							<div class="pfFormBtn pfFormBtnforwrite">
								<input type="submit" value="등록"/>&nbsp;&nbsp; 
								<input type="button" value="취소" onclick="poolentarierCancelBtn();"/>
							</div>
						</div>
					</form>
				</section>
			    	
               <div class="pfBottomBorder pfFormBottomBorder"></div>
            </div>
        </div>
    </div>
</body>
</html>