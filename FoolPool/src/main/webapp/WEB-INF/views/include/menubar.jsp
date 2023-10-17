<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@   taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@   taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@   taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="scheme" value="${pageContext.request.scheme}"/>
<c:set var="serverName" value="${pageContext.request.serverName}"/>
<c:set var="serverPort" value="${pageContext.request.serverPort}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${scheme}://${serverName}:${serverPort}${contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <link rel="stylesheet" href="${path }/static/css/menubar.css">
    <link rel="stylesheet" href="${path }/static/css/main.css" />
    <link rel="stylesheet" href="${path }/static/css/join.css" />
    <link rel="stylesheet" href="${path }/static/css/searchflower.css" />
    <link rel="stylesheet" href="${path }/static/css/detailflower.css" />
    <link rel="stylesheet" href="${path }/static/css/drfoolpool.css" />
    <link rel="stylesheet" href="${path }/static/css/notice.css" />
    <link rel="stylesheet" href="${path }/static/css/poolentarierList.css" />
	<link rel="stylesheet" href="${path }/static/css/poolentarierForm.css" />
	<link rel="stylesheet" href="${path }/static/css/poolentarierEdit.css" />
	<link rel="stylesheet" href="${path }/static/css/poolentarierDetail.css" />
    <link rel="icon" href="static/img/icon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="${path }/static/js/menubar.js"></script>
    <script src="${path }/static/js/notice.js"></script>
    <script src="${path }/static/js/drfoolpool.js"></script>
    <script type="text/javascript" src="${path }/static/js/poolentarier.js"></script>
    <script type="text/javascript" src="${path }/static/js/join.js"></script>
    <script type="text/javascript" src="${path }/static/js/login.js"></script>
    <script type="text/javascript" src="${path }/static/js/search_flower.js"></script>
<title>FoolPool</title>
</head>
<body>
    <div class="container">
        <div class="containerChild">

    <div class="menuBar">

        <div class="menuBox menuBarItem">
            <div class="searchFlowerDiv menu" onclick="btnClick('searchFlower')">
                <div class="menuContent">꽃 검색</div>
            </div>
            <div class="poolentarierDiv menu" onclick="btnClick('poolentarier')">
                <div class="menuContent">풀랜테리어</div>
            </div>
            <div class="drFoolPoolDiv menu" onclick="btnClick('drFoolPool')">
                <div class="menuContent">풀풀박사</div>
            </div>
            <div class="noticeDiv menu" onclick="btnClick('notice')">
                <div class="menuContent">공지사항</div>
            </div>
        </div>

        <div class="logoBox menuBarItem">
            <div class="logoText logo" onclick="btnClick('main')">풀풀</div>
            <img class="logoIcon logo" alt="" src="${path }/static/img/leef.png" onclick="btnClick('main')" />
        </div>

        <div class="loginBox menuBarItem">
        <c:choose>
			<c:when test="${member eq Empty }">
	            <div class="joinBtn loginDiv" data-login="logout" onclick="btnClick('join')">회원가입</div>
	            <div class="loginBtn loginDiv" data-login="logout" onclick="btnClick('login')">로그인</div>
			</c:when>
			<c:otherwise>
	            <div class="nickname" data-login="login">${member.nickname} 님</div>
	            <div class="logoutBtn loginDiv" data-login="login" onclick="btnClick('logout')">로그아웃</div>
			</c:otherwise>
		</c:choose>
        </div>

    </div>
    <script>
        
        var fool = new foolPool();
        $(document).ready(function () {
            fool.jspName = "${jspName}";

            switch (fool.jspName) {
                case 'searchFlower':
                    $(".searchFlowerDiv").addClass("currentPage").removeClass("menu");
                    $(".searchFlowerDiv > div").addClass("currentPageTxt");
                    break;

                case 'poolentarier':
                    $(".poolentarierDiv").addClass("currentPage").removeClass("menu");
                    $(".poolentarierDiv > div").addClass("currentPageTxt");
                    break;

                case 'drFoolPool':
                    $(".drFoolPoolDiv").addClass("currentPage").removeClass("menu");
                    $(".drFoolPoolDiv > div").addClass("currentPageTxt");
                    break;

                case 'notice':
                    $(".noticeDiv").addClass("currentPage").removeClass("menu");
                    $(".noticeDiv > div").addClass("currentPageTxt");
                    break;

                default:
                    break;
            }
        })
        function btnClick(btnName) {
            switch (btnName) {
                case 'searchFlower':
                    location.href = 'searchflower'
                    break;
                case 'poolentarier':
                    location.href = 'goPoolentarier'
                    break;
                case 'drFoolPool':
                    location.href = 'goDrFoolPool'
                    break;
                case 'notice':
                    location.href = 'notice'
                    break;
                case 'main':
                    location.href = 'main'
                    break;
                case 'join':
                    location.href = 'join'
                    break;
                case 'login':
                    location.href = 'login'
                    break;
                case 'logout':
                    location.href = 'logout'
                    break;                 
                case 'detailFlower':
                    location.href = 'detailflower?flowerNumber=${flower.dataNo}'
                    break;                 
                case 'randomMain':
                    location.href = 'randommain'
                    break;                 
                default:
                    break;
            }
        }
    </script>