<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
window.onload = function() {
	setTimeout(function() {
		alert("메인페이지로 이동");
		location.href="/member/main";
	}, 3100);
	
	var i=3;
	setInterval(function() {
		document.getElementById("time").innerText = --i;
	}, 1000);
};
</script>

<h1 style="color: red;">게시판 에러</h1>
<hr>
게시판은 로그인 후 이용할 수 있습니다<br>
<span id="time">3</span>초후 메인화면으로 이동합니다...











