<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/menubar.jsp" %>    
            <!-- detailDiv -->
            <div class="searchFlowerLabel">꽃 상세보기</div>
            <div class="searchFlowerDetailDiv">
                <div class="searchFlowerTopBorder"></div>
                <div class="searchFlowerFlowerDetailDiv">
                    <div class="searchFlowerDetailTitleDiv">
                        <div class="searchFlowerFlowerDate">${flower.fMonth }월 ${flower.fDay }일</div>
                        <div class="searchFlowerDetailFlowerKorName">${flower.flowNm }</div>
                        <div class="searchFlowerDetailFlowerOtherName">
                            <div class="searchFlowerDetailFlowerSctName">${flower.fSctNm } (학명)</div>
                            <div class="searchFlowerDetailFlowerEnfName">${flower.fEngNm } (영문)</div>
                        </div>
                    </div>
                    <div class="searchFlowerDetailSectionLine"></div>
                    <div class="searchFlowerDetailSection">
                        <div class="searchFlowerDetailImgDiv">
                            <div class="searchFlowerShowFlowerBigImg">
                                <img class="searchFlowerShowFlowerImg"
                                    src="${flower.imgUrl1 }"></img>
                            </div>
                            <div class="searchFlowerShowFlowerSmallImg">
                                <img class="searchFlowerShowFlowerImg1 searchFlowerDetailSmallImg"
                                    src="${flower.imgUrl1 }"></img>
                                <img class="searchFlowerShowFlowerImg2 searchFlowerDetailSmallImg"
                                    src="${flower.imgUrl2 }"></img>
                                <img class="searchFlowerShowFlowerImg3 searchFlowerDetailSmallImg"
                                    src="${flower.imgUrl3 }"></img>
                            </div>
                        </div>
                        <div class="searchFlowerFlowerContentDiv">

                            
                            <div class="searchFlowerDetailFlowerLang">" ${flower.flowLang } "</div>
                            <div class="searchFlowerDetailFlowerContent searchFlowerDetailText">${flower.fContent }</div>
                                
                                <div class="searchFlowerDetailFlowerTypeDiv">
                                    <div class="searchFlowerDetailFlowerTypeTitle searchFlowerDetailTitle">* 꽃 자생처</div>
                                    <div class="searchFlowerDetailFlowerTypeContent searchFlowerDetailText">${flower.fType}</div>
                                    </div>
                                    <div class="searchFlowerDetailFlowerGrowDiv">
                                        <div class="searchFlowerDetailFlowerGrowTitle searchFlowerDetailTitle">* 꽃 기르는 법</div>
                            <div class="searchFlowerDetailFlowerGrowContent searchFlowerDetailText">${flower.fGrow}</div>
                            </div>
                            <div class="searchFlowerDetailFlowerUseDiv">
                                <div class="searchFlowerDetailFlowerUseTitle searchFlowerDetailTitle">* 꽃의 용도</div>
                                <div class="searchFlowerDetailFlowerUseContent searchFlowerDetailText">${flower.fUse}</div>
                                </div>
                            </div>
                    </div>

                </div>
                <div class="searchFlowerBottomBorder"></div>
            </div>
        </div>
    </div>
</body>

</html>