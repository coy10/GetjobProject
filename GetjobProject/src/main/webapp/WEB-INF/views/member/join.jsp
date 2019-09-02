<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
window.onload = function() {
	document.getElementById("cancel").onclick = function() {
		history.back(-1);
	};
	
	document.getElementById("id").focus();
};

var check = false;

$(document).ready(function(){
	$("#idcheck").click(function(){
		$.ajax({
			type:"post"
			,url:"/member/idcheck"
			,dataType:"json"
			,data:{
				id : $('#id').val()
			}
		,success:function(response){
			console.log(response);
			
			if(response==true){
				alert("사용가능합니다");
				check = true;
			}
			else{
				alert("중복된 아이디입니다");
				check = false;
			}
		}
		
		})
	})
	
	$("#join").click(function(){
		if(check==true){
			$("form").submit();
		}else{
			alert("사용가능한 아이디를 다시 입력해주세요");
		}
	})
})
</script>

<div class="container">
<h1>회원가입</h1>
<hr>
<div>
<form action="/member/join" method="post"
	class="form-horizontal">
	
	<div class="form-group">
		<label class="col-xs-2 control-label" for="id">아이디 : </label>
		<div class="col-xs-6">
			<input type="text" class="form-control" 
				id="id" name="id" placeholder="Id"/>
		</div>
		<button type="button" id="idcheck">중복확인</button>
	</div>

	<div class="form-group">
		<label class="col-xs-2 control-label" for="pw">패스워드 : </label>
		<div class="col-xs-6">
			<input type="password" class="form-control" 
				id="pw" name="pw" placeholder="Password"/>
		</div>
	</div>

	<div class="form-group">
		<label class="col-xs-2 control-label" for="nick">닉네임 : </label>
		<div class="col-xs-6">
			<input type="text" class="form-control" 
				id="nick" name="nick" placeholder="닉네임"/>
		</div>
	</div>

	<div class="form-group">
		<div class="col-xs-offset-2 col-xs-10">		
			<button type="button" class="btn btn-primary" id="join">가입</button>
			<input type="reset" id="cancel"
				class="btn btn-danger" value="취소"/>
		</div>
	</div>
</form>
</div>
</div>
