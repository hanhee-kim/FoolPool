<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="searchFlowerLabel">꽃 검색</div>
            <div class="searchFlowerDicLine">
            	<div class="searchFlowerTopBorder"></div>
                <div class="searchFlowerSelectOptionDiv">
                    <select class="searchFlowerOptionBox searchFlower_pd_r_22">
                        <option value="singleDate">날짜(단일)</option>
                        <option value="periodDate">날짜(기간)</option>
                        <option value="flowerName">꽃 이름</option>
                        <option value="flowerLang">꽃말</option>
                    </select>
                    <select class="searchFlowerStartMonth searchFlower_pd_r_22">
						<c:set var="n" value="1" />
						<c:forEach var="n" begin="1" end="12">
							<option value="${n}">${n<10 ? '0':''}${n}월</option>
						</c:forEach>
                    </select>
                    <select class="searchFlowerStartDay searchFlower_pd_r_22">
						<c:set var="n" value="1" />
						<c:forEach begin="1" end="31">
							<option value="${n}">${n>9 ? n:'0'}${n>9 ? '':n}일</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
                    </select>
                    <div></div>
                    <select class="searchFlowerEndMonth searchFlower_pd_r_22 searchFlower_disabled">
                        <c:set var="n" value="1" />
						<c:forEach var="n" begin="1" end="12">
							<option value="${n}">${n<10 ? '0':''}${n}월</option>
						</c:forEach>
                    </select>
                    <select class="searchFlowerEndDay searchFlower_pd_r_22 searchFlower_disabled">
                        <c:set var="n" value="1" />
						<c:forEach begin="1" end="31">
							<option value="${n}">${n>9 ? n:'0'}${n>9 ? '':n}일</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
                    </select>
                    <button class="searchFlower_searchBtn">검색</button>
                </div>
                <div class="flowerCardsection">
					<div class="flowerCardsection_line">                
	                    <div class="flowerCard">
	                        <div class="flowerCardImgSection">
	                            <img class="flowerCardImg" src="">
	                        </div>
	                        <div class="flowerCardDateSection">
	                            <div class="flowerCardMonth">1월</div>
	                            <div class="flowerCardDay">1일</div>
	                            <div class="flowerCardName">이름</div>
	                        </div>
	                        <div class="flowerCardNameLangSection">
	                            <div class="flowerCardLang">성실,사랑,머머머등등등</div>
	                        </div>
	                    </div>
	                    <div class="flowerCard">
	                        <div class="flowerCardImgSection">
	                            <img class="flowerCardImg" src="">
	                        </div>
	                        <div class="flowerCardDateSection">
	                            <div class="flowerCardMonth">1월</div>
	                            <div class="flowerCardDay">1일</div>
	                            <div class="flowerCardName">이름</div>
	                        </div>
	                        <div class="flowerCardNameLangSection">
	                            <div class="flowerCardLang">성실,사랑,머머머등등등</div>
	                        </div>
	                    </div>
	               </div>
					<div class="flowerCardsection_line">                
	                    <div class="flowerCard">
	                        <div class="flowerCardImgSection">
	                            <img class="flowerCardImg" src="">
	                        </div>
	                        <div class="flowerCardDateSection">
	                            <div class="flowerCardMonth">1월</div>
	                            <div class="flowerCardDay">1일</div>
	                            <div class="flowerCardName">이름</div>
	                        </div>
	                        <div class="flowerCardNameLangSection">
	                            <div class="flowerCardLang">성실,사랑,머머머등등등</div>
	                        </div>
	                    </div>
	                    <div class="flowerCard">
	                        <div class="flowerCardImgSection">
	                            <img class="flowerCardImg" src="">
	                        </div>
	                        <div class="flowerCardDateSection">
	                            <div class="flowerCardMonth">1월</div>
	                            <div class="flowerCardDay">1일</div>
	                            <div class="flowerCardName">이름</div>
	                        </div>
	                        <div class="flowerCardNameLangSection">
	                            <div class="flowerCardLang">성실,사랑,머머머등등등</div>
	                        </div>
	                    </div>
	               </div>
                </div>
                <button class="searchFlowerSeeMore">더보기</button>
                <div class="searchFlowerBottomBorder"></div>
            </div>
        </div>
    </div>
    <!--  -->

</body>

</html>