<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="drFP-Label">풀풀박사</div>
            
            <div class="drFP-DivLine">
            
            	<div class="drFP-TopBorder"></div>
            	
                
                <%-- 게시글 상세 --%>
                <div class="drFP-detailArea">
			    	<div class="drFP-detail-1row">
			    		<label>[해결완료]</label>
			    		<label class="drFP-detailTitle">이 꽃 이름 알려주세요 궁금해서 미칠것 가타요</label>
			    	</div>
			    	<div class="drFP-detail-2row">
				    	<span>작성일: 2023년 10월 9일</span>
				    	<span>조회수: 12</span>
				    	<span class="dfFP-detail-writer">작성자: 김성탄탄탄탄탄</span>
			    	</div>
			    	
			    	<%-- #1 이미지 크기를 통일 or max크기(영역)만 지정 --%>
			    	<%-- #2 textarea 입력양에 따라 자동으로 크기 변경되도록 JS함수이용 --%>
			    	<div class="drFP-detail-3row">
			    		<img alt="풀풀박사게시글이미지" src="image?file=${drfoolpool.filename}">
			    	</div>
			    	<div class="drFP-detail-4row">
			    		1내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용
			    		내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력
			    		내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력
			    		내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력
			    		내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력
			    		내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력내용입력
			    	</div>
			    	<div class="drFP-detail-5row">
			    		<a href="editDrFoolPool"><button>수정</button></a>
			    		<button>삭제</button>
			    		<button onclick="drFPback();">목록</button>
			    	</div>
			    	
			    	<div class="drFP-commentArea">
			    		<h4>댓글 [5]</h4>
			    		<table>
			    			<tr>
			    				<td>닉네임1</td>
			    				<td>댓글내용1댓글내용1댓글내용1댓글내용1댓글내용1</td>
			    				<%-- 글작성자인 경우 채택버튼이(+자기댓글아닐때), 댓글작성자인경우 삭제버튼이 표시됨 즉, 동시에 두 버튼이 보일 일은 없음 --%>
			    				<td>
			    					<%--
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					 --%>
			    					<button class="drFP-commentDelBtn">×</button>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임2</td>
			    				<td>댓글내용2댓글내용2댓글내용2</td>
			    				<td>
			    					<%--
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					 --%>
			    					<button class="drFP-commentDelBtn">×</button>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임3</td>
			    				<td>줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3줄바꿈되는긴댓글내용3</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임4</td>
			    				<td>댓글내용4댓글내용4댓글내용4댓글내용4댓글내용4</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    			<tr>
			    				<td>닉네임5</td>
			    				<td>댓글내용5댓글내용5댓글내용5댓글내용5댓글내용5</td>
			    				<td>
			    					<button class="drFP-commentPickBtn">채택하기</button>
			    					<%--
			    					<button class="drFP-commentDelBtn">×</button>
			    					 --%>
			    				</td>
			    			</tr>
			    		</table>
			    	</div>
			    	
			    	
			    </div> <%-- drFP-detailArea --%>
                
                
               <div class="drFP-BottomBorder"></div> 
                
            </div>
            <%-- drFP-DivLine --%>
            
            
        </div>
        <%-- containerChild --%>
    </div>
	<%-- container --%>
	
	

</body>

</html>