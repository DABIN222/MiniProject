<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.memberEditFrm{width:800px; margin:0 auto;}
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
<script>
	$(function(){
		$("#mFrm").submit(function(){
			if($("#userpwd").val()==''){
				alert("비밀번호 입력 후 수정 하세요");
				return false;
			}
			if($("#username").val()==''){
				alert("이름을 입력하세요");
				return false;
			}
			var reg = /^[0-9]{3,4}$/
			var reg2 = /^[0-9]{4}$/
			if(!reg.test($("#tel2").val())|| !reg2.test($("#tel3").val())){
				alert("전화번호를 잘못 입력하였습니다.");
				return false;
			}
			alert("회원 정보 수정이 완료되었습니다.");
			return true; 
		})
	});
</script>
<!-- top bottom jspf 에 html 태그및 css 다있기 때문에 중간에 작성할 요소만 적어준다 -->
<div class="memberEditFrm">
   <h1 style="text-align:center; line-height:50px;">회원 정보 수정</h1>
   <form method="post" action="/myapp/member/memberEditOk" id="mFrm">
      <ul>
         <li>아이디</li>
         <li><input type='text' name='userid' id='userid' value="${vo.userid }" readonly/></li>
         <li>비밀번호</li>
         <li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호 입력"></li>
         <li>이름</li>
         <li><input type="text" name="username" id="username" value="${vo.username}"></li>
         <li>연락처</li>
		 <li>
			<input type='text' name='tel1' id='tel1' value="${vo.tel1 }"/>-
			<input type='text' name='tel2' id='tel2' maxlength="4" value="${vo.tel2 }"/>-
			<input type='text' name='tel3' id='tel3' maxlength="4" value="${vo.tel3 }"/>
		 </li>
         <li>이메일</li>
         <li><input type="text" name="email" id="email" value="${vo.email}"/></li>
         <li><input type="submit" value="정보 수정하기"/></li>
      </ul>
   </form>
</div>