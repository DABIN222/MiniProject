<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    #log{width:400px; margin:0px auto;}																/*로그인로고*/
	#logfrm>ul>li{padding:10px; padding-right:30px; padding-left:30px;}							/*ID, PW 입력칸*/
	#logfrm>ul>li:last-of-type{width:84%; text-align:center; margin-top:20px;}					/*로그인, 회원가입 입력칸*/
	#logfrm{max-width:400px; margin:0 auto; padding:10px 10px 40px; background:#f2f2f2;}		/*로그인 전체창 배경*/
 	#logfrm input{box-sizing: border-box;width: 100%; margin: 5px auto; padding : 12px;}
</style>

<script>
    function logFormCheck(){
        //아이디와 비밀번호 입력 유무를 확인하고, 모두 입력되면 action의 파일을 요청하고
        //하나라도 입력이 안되면 현재 페이지에 머물러야 한다.
        //아이디가 있는지 확인
        var id =document.getElementById("userid"); 
        if(id.value==""){//아이디가 없을 때
            alert("아이디를 입력하세요.");
            id.focus();//focus : 커서를 해당 객체에 위치시킨다.
            return false;
        }
        if(document.querySelector("#userpwd").value==""){
            alert("비밀번호를 입력하세요.");
            document.querySelector("#userpwd").focus();
            return false;
        }
        //아이디와 비밀번호가 모두 입력되었을 떄    
        return true;
    }
</script>

<div class="login">
	<div id=log>
	    <h1 style="text-align:center; line-height:70px;">로그인</h1>
	    <form method="post" action="/myapp/member/loginOk" id="logfrm" onsubmit="return logFormCheck()">
		    <ul>
		        <li><input type="text" name="userid" id="userid" placeholder="ID를 입력하세요"/></li>
				<li><input type="password" name="userpwd" id="userpwd" placeholder="PW를 입력하세요"/></li>
				<li><input type="submit" value="로그인">
					<a href="/myapp/member/memberForm"><input type="button" value="회원가입" id=joingo/></a></li>
		    </ul>
	    </form>
	</div>
</div>