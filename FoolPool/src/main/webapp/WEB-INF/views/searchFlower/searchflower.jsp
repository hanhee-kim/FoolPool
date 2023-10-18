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
	                <c:if test="${res.size <= 0}">
	                <div class="searchFlowerMSG" id="searchFlowerMSG">꽃을 검색하세요!!!</div>
	                <div class="searchFlowerMSG searchFlower_disabled" id="searchFlowerOptionCheck" >검색 옵션을 확인하세요.</div>
	                </c:if>
					<div class="flowerCardsection_line" id="flowerCardsection_line">                
	                <c:if test="${res.size > 0}">
	                <c:set var="i" value="1"/>
	                <c:forEach items="${res.flowers}" var="flower">
	                    <div class="flowerCard" id="flowerCard${i}" onclick="location.href='detailflower?flowerNumber=${flower.dataNo}'">
	                        <div class="flowerCardImgSection">
	                            <img class="flowerCardImg" src="${flower.imgUrl1 }">
	                        </div>
	                        <div class="flowerCardDateSection">
	                            <div class="flowerCardMonth">${flower.fMonth }월</div>
	                            <div class="flowerCardDay">${flower.fDay }일</div>
	                            <div class="flowerCardName">${flower.flowNm }</div>
	                        </div>
	                        <div class="flowerCardNameLangSection">
	                            <div class="flowerCardLang">${flower.flowLang }</div>
	                        </div>
	                    </div>
	                    <c:set var="i" value="${i+1}"/>
	                </c:forEach>
	                </c:if>
	                
	               </div>
                </div>
                <div class="searchFlowerSeeMoreDiv">    
                <c:if test="${res.size > 4}">
                	<button class="searchFlowerSeeMore" id="searchFlowerSeeMore">더보기</button>
                </c:if>           
                </div>
                <div class="searchFlowerBottomBorder"></div>
            </div>
        </div>
    </div>
    <!--  -->
<script>
	var option = '${res.option}';
	var startMonth = '${res.startMonth}';
	var startDay = '${res.startDay}';
	var endMonth = '${res.endMonth}';
	var endDay = '${res.endDay}';
	var flowerName = '${res.flowerName}';
	var flowerLang = '${res.flowerLang}';
		$('#searchFlowerTitleOption').val(option).prop('selected',true);//검색한값 유지
	
		$('#searchFlowerStartMonth').addClass("searchFlower_disabled");
		$('#searchFlowerStartDay').addClass("searchFlower_disabled");
		$('#searchFlowerHyphen').addClass("searchFlower_disabled");
		$('#searchFlowerEndMonth').addClass("searchFlower_disabled");
		$('#searchFlowerEndDay').addClass("searchFlower_disabled");
		$('#searchFlowerByName').addClass("searchFlower_disabled");
		$('#searchFlowerByLang').addClass("searchFlower_disabled");
	if (option === "singleDate") {	//날짜(단일)
		$('#searchFlowerStartMonth').val(startMonth).prop('selected',true);//검색한값 유지
		$('#searchFlowerStartDay').val(startDay).prop('selected',true);
		
		$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
		$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
	} else if (option === "periodDate") {	//날짜(기간)
		$('#searchFlowerStartMonth').val(startMonth).prop('selected',true);//검색한값 유지
		$('#searchFlowerStartDay').val(startDay).prop('selected',true);
		$('#searchFlowerEndMonth').val(endMonth).prop('selected',true);
		$('#searchFlowerEndDay').val(endDay).prop('selected',true);
		
		$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
		$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
		$('#searchFlowerHyphen').removeClass("searchFlower_disabled");
		$('#searchFlowerEndMonth').removeClass("searchFlower_disabled");
		$('#searchFlowerEndDay').removeClass("searchFlower_disabled");
	} else if (option === "flowerName") {	//꽃 이름
		$('#searchFlowerByName').val(flowerName);//검색한값 유지
		
		$('#searchFlowerByName').removeClass("searchFlower_disabled");
	} else if (option === "flowerLang") {	//꽃말
		$('#searchFlowerByLang').val(flowerLang);//검색한값 유지
	
		$('#searchFlowerByLang').removeClass("searchFlower_disabled");
	} else if(!option){
		$('#searchFlowerTitleOption').val('singleDate').prop('selected',true);//처음 진입시 날짜(단일)로
		$('#searchFlowerStartMonth').removeClass("searchFlower_disabled");
		$('#searchFlowerStartDay').removeClass("searchFlower_disabled");
	}
	console.log(option);

</script>
</body>
</html>