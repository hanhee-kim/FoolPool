<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
                
                <%-- 게시글 작성 --%>
                <section class="drFP-formSection">
                	<div>
	                	<h2>질문글 작성</h2>
						<form action="drFoolpoolForm" method="post" enctype="multipart/form-data" name="drFoolPoolForm" id="drFP-writeform">
							<div class="drFP-inputArea">
								<ul>
									<li>
					                    <label>제목 <b>*</b></label><br>
					                    <input class="drFP-formTitle drFP-text" name="title" type="text" required="required" maxlength="100">
					                    <div class="drFP-titleValidationMsg">유효성검사메시지란</div>
					                </li>
					                <li>
					                    <label>내용 <b>*</b></label><br>
					                    <textarea class="drFP-formContent" name="content" rows="20" cols="42" placeholder="***&#10;&#10;이미지가 첨부되어야 질문글이 등록됩니다.&#10;&#10;다른 회원을 위해 해결된 게시글의 삭제는 자제해주세요.&#10;&#10;채택된 댓글은 삭제가 불가능합니다.&#10;&#10;***" required="required" maxlength="2000"></textarea>
					                    <div class="drFP-contentValidationMsg">유효성검사메시지란</div>
					                </li>
					                <li>
					                    <label>이미지 첨부 <b>*</b></label><br>
					                    <div class="drFP-fileSection">
						                    <%-- 선택된 파일명 표시하며 이 값을 통해 null로 제출되면 안되는 파일선택여부를 체크함 --%>
						                    <input class="drFP-selectedFileName" placeholder="첨부파일명" value="첨부파일 미선택" readonly="readonly" required="required"/>
						                    <%-- input type="file"(파일선택 버튼)를 숨기고 커스텀한 label을 사용 --%>
						                    <input type="file" class="drFP-formImgInput" name="file" id="drFP-fileforwrite" accept="image/*" style="display: none;"/>
						                    <label for="drFP-fileforwrite" class="drFP-customFileBtn">파일 선택</label><br>
						                    <%-- 업로드이미지 미리보기 --%>
						                    <img class="drFP-formImgPreview" style="display: none;">
					                    </div>
					                </li>
								</ul>
								<div class="drFP-formBtn drFP-formBtnforwrite">
									<input type="submit" value="등록"/>&nbsp;&nbsp; 
									<input type="button" value="취소" onclick="drFPback();"/>
								</div>
							</div> <%-- drFP-inputArea --%>
						</form>
					</div>
				</section>
			    	
               <div class="drFP-BottomBorder drFP-formBottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>


</body>

</html>