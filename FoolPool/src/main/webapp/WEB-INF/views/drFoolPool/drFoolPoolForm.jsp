<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
                
                <%-- 게시글 작성 --%>
                <section id="drFP-formSection">
                	<h2>질문글 작성</h2>
					<form action="drFoolpoolForm" method="post" enctype="multipart/form-data" name="drFoolPoolForm">
						<div id="drFP-inputArea">
							<ul>
								<li>
				                    <label for="drFP-formTitle">제목 <em>*</em></label><br>
				                    <input name="title" type="text" id="drFP-formTitle">
				                </li>
				                <li>
				                    <label for="drFP-formContent">내용 <em>*</em></label><br>
				                    <textarea id="drFP-formContent" name="content" rows="20" cols="42" placeholder="질문방법 안내, 답변이 달린 질문글 삭제자제 권고"></textarea>
				                </li>
				                <li>
				                    <label for="drFP-formImg">이미지 업로드 <em>*</em></label><br>
				                    <input id="drFP-formImg" name="file" type="file" id="file" accept="image/*"/>
				                    <%-- 업로드된 이미지 표시 고려 --%>
				                </li>
							</ul>
						</div>
						<div id="drFP-formBtn">
							<input type="submit" value="등록"/>&nbsp;&nbsp; 
							<input type="button" value="취소" onclick="drFPback();"/>
						</div>
					</form>
				</section>
			    	
               <div class="drFP-BottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
	
<script>

</script>

</body>

</html>