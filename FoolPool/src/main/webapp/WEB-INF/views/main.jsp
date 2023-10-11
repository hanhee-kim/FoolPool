<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/menubar.jsp" %>
            

            <div class="flowerImgWrap">
                <div class="flowerImgDiv1">
                    <img class="showFlowerImg1" alt="" src="${flower.imgUrl1 }" />
                </div>
                <div class="flowerImgDiv2">
                    <img class="showFlowerImg2" alt="" src="${flower.imgUrl2 }" />                   
                    <img class="showFlowerImg3" alt="" src="${flower.imgUrl3 }" />
                </div>
            </div>
            <div class="mainFlowerContentWrap">
                <div class="flowerContentWrap">
                    <div class="showFlowerWrap">
                    <div class="showFlowerMonthDay" id="showFlowerMonthDay" name="showFlowerMonthDay">${flower.fMonth}월 ${flower.fDay}일</div>
                        <div class="showFlowerName" id="showFlowerName" name="flow_Nm">${flower.flowNm}</div>
                    </div>
                        <div class="showrFlowerLang" id="showrFlowerLang" name="showrFlowerLang">" ${flower.flowLang} "</div>
                </div>
                <div class="showFlowerDetail" onclick="btnClick('detailFlower')" value="${flower.dataNo }">자세히 알아보기</div>
                <div class="randomBoxIcon">
                    <img class="randomIcon" alt="" src="./static/img/randomDiceIcon.png" onclick="btnClick('randomMain')"/>
                </div>
            </div>
        </div>
    </div>
</body>

</html>