<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel=stylesheet href="<c:url value='/css/main.css' />"
	type="text/css">
<style>
#info {
	text-align: center;
	margin-bottom: 50px;
}

#info a {
	font-size: 18px;
	text-decoration: none;
	color: white;
}
</style>
</head>
<body>
	<nav>
		<span id="logo-text">PICTOVIN</span> <a
			href="<c:url value='/user/login/form'/>">Login</a> <a
			href="<c:url value='/user/join/form'/>">Sign up</a>
	</nav>
	<div id="logo-container">
		<img id="logo" src="<c:url value='/images/logo.png' />" alt="Logo">
		<span id="logo-text2">Pictovin, 이렇게 활용하세요</span>
	</div>
	<div id="box">
		<a href="#" id="diary"> <strong>다이어리 꾸미기✏️</strong> <span
			class="box-description"> 다이어리 꾸미기 섹션에서는 다양한 아이템들을 활용하여 나만의 일기를
				더욱 특별하게 꾸밀 수 있습니다. 감성적인 스티커, 다양한 글꼴, 그림 그리기 도구 등을 활용하여 일상을 더 아름답게
				기록하세요! </span>
		</a>
		<!-- 로그인한 사람만 넘어가게 해야함 -->
		<a href="#" id="album"> <strong>공유 앨범🎶</strong> <span
			class="box-description"> 공유 앨범 섹션에서는 소중한 사람들과 함께한 추억을 더 오래오래
				간직할 수 있습니다. 사진과 이야기를 모아 공유하고, 친구들과 함께 즐거운 순간을 공유하세요. 함께한 순간을 더 특별한
				기억으로 남겨보세요. </span>
		</a> <a href="#" id="concept"> <strong>사진 컨셉 추천🤳🏻</strong> <span
			class="box-description"> 사진 컨셉 추천 섹션에서는 다양한 포즈 아이디어로 여러분의 사진을
				더욱 독특하게 만들어보세요. 다양한 스타일과 컨셉의 포즈가 여러분의 사진을 더욱 특별하게 만들어줄 것입니다. 새로운
				모습으로 즐거운 추억을 만들어보세요! </span>
		</a>
	</div>
	<div id="info">
		<a href="<c:url value='/recommend/concept'/>">⭐ 사진 컨셉 추천받기 ⭐</a>
	</div>
</body>
</html>