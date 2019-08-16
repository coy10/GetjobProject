<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="container">
<h1>메인화면</h1>
<hr>
<div>
<c:choose>
	<c:when test="${empty login }">
		<a href="/member/join">회원가입</a> |
		<a href="/member/login">로그인</a>
	</c:when>
	<c:when test="${login eq true}">
		${loginnick }님 환영합니다
		<a href="/member/logout">로그아웃</a>
	</c:when>
</c:choose>
<hr>
	<a href="/board/list">목록</a>
</div>

</div>
