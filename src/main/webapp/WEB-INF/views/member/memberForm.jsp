<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.loginFrm{width:800px; margin:0 auto;}
	#mFrm>ul>li{padding:10px; padding-right:30px; padding-left:30px;}
	#mFrm>ul>li:last-of-type{width:90.7%; text-align:center; margin-top:20px;}
	#mFrm{max-width:80%; height:100%; margin:0 auto; padding:10px 10px 40px; background:#f2f2f2;}
	#mFrm input{box-sizing:border-box; margin: 5px auto; padding : 12px;}
	#userid{width:50%;}
	#username{width:50%;}
	#userpwd{width:50%;;}
	#userpwd2{width:50%;}
	#email{width:80%;}
	#tel1{width:31%;}
	#tel2{width:31%;}
	#tel3{width:31%;}
</style>
<script src="/myapp/js/member.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		//아이디 중복검사
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid!=''&& userid.length>=6){
				var url = "/myapp/member/memberIdCheck";
				$.ajax({
					url : url,
					data : "userid=" + userid,
					type: "POST",
					success : function(result){
						if(result>0){//사용불가능
							$("#chk").html("이미 사용중인 아이디입니다.");
							$("#idchk").val("N");
							$("#chk").css("color","red")
						}else{//사용가능
							$("#chk").html("사용 가능한 아이디입니다.");
							$("#idchk").val("Y");
							$("#chk").css("color","blue")
						}
					}
				});
			}else{//사용불가
				$("#chk").html("이미 사용중인 아이디입니다.");	
				$("#idchk").val("N");
				$("#chk").css("color","red")
			}
		});
	});
</script>
<div class="loginForm">
	<h1 style="text-align:center; line-height:70px;">회원 가입</h1>
	<form method="post" action="/myapp/member/memberOk" id="mFrm" onsubmit="return memberCheck()">
	<ul>
		<li>아이디</li>
		<li>
			<input type='text' name='userid' id='userid' placeholder='아이디 입력'/>
			<span id='chk'></span>
			<input type="text" id='idchk' value="N" style="visibility:hidden">
		</li>
		<li>비밀번호</li>
		<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호 입력"></li>
		<li>비밀번호 확인</li>
		<li><input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호 확인입력"></li>
		<li>이름</li>
		<li><input type="text" name="username" id="username" placeholder="이름 입력"></li>
		<li>연락처</li>
        <li>
            <input type='text' name='tel1' id='tel1'/>-
            <input type='text' name='tel2' id='tel2'/>-
            <input type='text' name='tel3' id='tel3'/>
        </li>
		<li>이메일</li>
		<li><input type="text" name="email" id="email" placeholder="이메일 입력"></li>
		<li><input type="submit" value="가입하기"/></li>
	</ul>
	</form>
</div>