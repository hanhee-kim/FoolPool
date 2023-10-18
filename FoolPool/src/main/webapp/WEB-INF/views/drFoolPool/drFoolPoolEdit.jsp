<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/menubar.jsp" %>
<%@ page import="bean.DrFoolPool" %>
<% 
DrFoolPool drFoolPool = (DrFoolPool) request.getAttribute("drFoolPool");
System.out.println("edit.jsp에서 출력" + drFoolPool.getNo() + ", " + drFoolPool.getFileName()); 
%>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
                
                <%-- 게시글 수정 --%>
                <section class="drFP-formSection">
                	<h2>질문글 수정</h2>
					<form action="editDrFoolPool" method="post" enctype="multipart/form-data" name="drFoolPoolForm" id="drFP-editform">
						<input type="hidden" name="no" value="${drFoolPool.no}"/>
						<div class="drFP-inputArea">
							<ul>
								<li>
				                    <label>제목 <b>*</b></label><br>
				                    <input class="drFP-formTitle drFP-text" name="title" type="text" maxlength="100" value="${drFoolPool.title}">
				                    <div class="drFP-titleValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                    <label>내용 <b>*</b></label><br>
				                    <textarea class="drFP-formContent" name="content" rows="20" cols="42" maxlength="2000">${drFoolPool.content}</textarea>
				                    <div class="drFP-contentValidationMsg">유효성검사메시지란</div>
				                </li>
				                <li>
				                    <label>이미지 첨부 <b>*</b></label><br>
				                    <div class="drFP-fileSection">
					                    <%-- 선택된 파일명 표시하며 이 값을 통해 null로 제출되면 안되는 파일선택여부를 체크함 --%>
					                    <input class="drFP-selectedFileName" placeholder="첨부파일명" value="첨부파일 미선택" readonly="readonly" required="required"/>
					                    <%-- input type="file"(파일선택 버튼)를 숨기고 커스텀한 label을 사용 --%>
					                    <input type="file" class="drFP-formImgInput" name="file" id="drFP-fileforedit" accept="image/*" style="display: none;"/>
					                    <label for="drFP-fileforedit" class="drFP-customFileBtn">파일 선택</label><br>
					                    <%-- 기존 이미지 표시 --%>
					                    <img id="drFP-formImgExisting" src="image?file=${drFoolPool.fileName}">
					                    <%-- 업로드이미지 미리보기 --%>
					                    <img class="drFP-formImgPreview" style="display: none;">
				                    </div>
				                </li>
							</ul>
							<div class="drFP-formBtn drFP-formBtnforedit">
								<input type="submit" value="수정"/>&nbsp;&nbsp;
								<input type="button" value="취소" onclick="drFPback();"/>
							</div>
						</div> <%-- drFP-inputArea --%>
					</form>
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