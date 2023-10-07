<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/menubar.jsp" %>
            

            <div class="flowerImgWrap">
                <div class="flowerImgDiv1">
                    <img class="showFlowerImg1" alt="" src="http://www.nihhs.go.kr/user/AttachFiles/FLOWF/0101-1.jpg" />
                </div>
                <div class="flowerImgDiv2">
                    <img class="showFlowerImg2" alt="" src="http://www.nihhs.go.kr/user/AttachFiles/FLOWF/0101-2.jpg" />                   
                    <img class="showFlowerImg3" alt="" src="http://www.nihhs.go.kr/user/AttachFiles/FLOWF/0101-3.jpg" />
                </div>
            </div>
            <div class="mainFlowerContentWrap">
                <div class="flowerContentWrap">
                    <div class="showFlowerWrap">
                    <div class="showFlowerMonthDay" id="showFlowerMonthDay" name="showFlowerMonthDay">11월 11일</div>
                        <div class="showFlowerName" id="showFlowerName" name="flow_Nm">향나무보다더길어진다면</div>
                    </div>
                        <div class="showrFlowerLang" id="showrFlowerLang" name="showrFlowerLang">" 영원한 향기말고 더 길다면 "</div>
                </div>
                <div class="showFlowerDetail" onclick="btnClick('flowerDetail')">자세히 알아보기</div>
                <div class="randomBoxIcon">
                    <img class="randomIcon" alt="" src="./static/img/randomDiceIcon.png" onclick="btnClick('main')" value=""/>
                </div>
            </div>
        </div>
    </div>
</body>

</html>