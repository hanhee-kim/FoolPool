<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>

            <div class="searchFlowerLabel">꽃 검색</div>
            <div class="searchFlowerDivLine">
            	<div class="searchFlowerTopBorder"></div>
                <div class="searchFlowerSelectOptionDiv">
                    <select class="searchFlowerOptionBox searchFlower_pd_r_22" id="searchFlowerTitleOption" name="searchFlowerTitleOption">
                        <option value="singleDate">날짜(단일)</option>
                        <option value="periodDate">날짜(기간)</option>
                        <option value="flowerName">꽃 이름</option>
                        <option value="flowerLang">꽃말</option>
                    </select>
                    <div id="searchFlowerOptionInputBox">
                    <select id="searchFlowerStartMonth" class="searchFlowerStartMonth searchFlower_pd_r_22 searchFlower_OptionDate">
						<c:set var="n" value="1" />
						<c:forEach var="n" begin="1" end="12">
							<option value="${n}">${n<10 ? '0':''}${n}월</option>
						</c:forEach>
                    </select>
                    <select id="searchFlowerStartDay" class="searchFlowerStartDay searchFlower_pd_r_22 searchFlower_OptionDate">
						<c:set var="n" value="1" />
						<c:forEach begin="1" end="31">
							<option value="${n}">${n>9 ? n:'0'}${n>9 ? '':n}일</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
                    </select>
                    <div id="searchFlowerHyphen" class="searchFlower_disabled">~</div>
                    <select id="searchFlowerEndMonth" class="searchFlowerEndMonth searchFlower_pd_r_22 searchFlower_OptionDate searchFlower_disabled">
                        <c:set var="n" value="1" />
						<c:forEach var="n" begin="1" end="12">
							<option value="${n}">${n<10 ? '0':''}${n}월</option>
						</c:forEach>
                    </select>
                    <select id="searchFlowerEndDay" class="searchFlowerEndDay searchFlower_pd_r_22 searchFlower_OptionDate searchFlower_disabled">
                        <c:set var="n" value="1" />
						<c:forEach begin="1" end="31">
							<option value="${n}">${n>9 ? n:'0'}${n>9 ? '':n}일</option>
							<c:set var="n" value="${n+1}" />
						</c:forEach>
                    </select>
                    <input type='text' class='searchFlowerByName searchFlower_disabled' name='searchFlowerByName' id='searchFlowerByName'/>
                    <input type='text' class='searchFlowerByLang searchFlower_disabled' name='searchFlowerByLang' id='searchFlowerByLang'/>
                    </div>
                    <button id="searchFlower_searchBtn" class="searchFlower_searchBtn" onclick="go_searchFlower()">검색</button>
                </div>
                <div class="flowerCardsection">
					<div class="flowerCardsection_line">                
	                    <div class="flowerCard" onclick="btnClick('detailFlower?num=${flower.dataNo}')">
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
                <div class="searchFlowerSeeMoreDiv">               
                	<button class="searchFlowerSeeMore" onclick="">더보기</button>
                </div>
                <div class="searchFlowerBottomBorder"></div>
            </div>
        </div>
    </div>
    <!--  -->
</body>

</html>