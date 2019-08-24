<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>리스트</h1>
<hr>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>닉네임</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>

<c:forEach items="${list1 }" var="i">
<tr>
	<td>${i.board_no}</td>
	<td><a href="/board/view?board_no=${i.board_no}">${i.title }</a></td>
	<td>${i.content }</td>
	<td>${i.writer_id}</td>
	<td>${i.writer_nick }</td>
	<td>${i.hit }</td>
	<td><fmt:formatDate value="${i.write_date }" pattern="yyyy-MM-dd" /></td>
	
</tr>
</c:forEach>
</table>
<div>
	<a href="/board/main"><button>메인으로</button></a>
	<a href="/board/write"><button>글쓰기</button></a>
	
</div>
</body>
<div class="pagingBox">
	<c:import url="/WEB-INF/views/board/paging.jsp" />
</div>
</html>