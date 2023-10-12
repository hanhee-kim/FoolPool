<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="plLabel">풀풀박사</div>
            
            <div class="plDivLine">
            
            	<div class="plTopBorder"></div>
            	
                
                <%-- 게시글 수정 --%>
                <section id="plformSection">
                	<h2>질문글 수정</h2>
					<form action="drFoolpoolForm" method="post" enctype="multipart/form-data" name="drFoolPoolForm">
						<input type="hidden" name="num" value="${drfoolpool.num}"/>
						<%-- hidden속성으로 게시글 번호를 가지고 있어야함 --%>
						<div id="plinputArea">
							<ul>
								<li>
				                    <label for="plformTitle">제목 <em>*</em></label><br>
				                    <input name="title" type="text" id="plformTitle" value="${drfoolpool.title}">
				                </li>
				                <li>
				                    <label for="plformContent">내용 <em>*</em></label><br>
				                    <textarea id="plformContent" name="content" rows="20" cols="42" value="${drfoolpool.content}"></textarea>
				                </li>
				                <li>
				                    <label for="plformImg">이미지 업로드 <em>*</em></label><br>
				                    <input id="plformImg" name="file" type="file" id="file" accept="image/*"/>
				                    <%-- 업로드된 이미지 표시 고려 --%>
				                </li>
							</ul>
						</div>
						<div id="plformBtn">
							<input type="submit" value="수정"/>&nbsp;&nbsp; 
							<input type="button" value="취소" onclick="drFPback();"/>
						</div>
					</form>
				</section>
			    	
               <div class="plBottomBorder"></div> 
                
            </div>
            <%-- plDivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
	
	

</body>

</html>