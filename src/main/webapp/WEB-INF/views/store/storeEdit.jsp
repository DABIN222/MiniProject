<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#subject {
	width: 100%;
}

#storeFrm li {
	padding: 10px 5px;
}
	body, ul, li{margin:0; padding:0; list-style-type:none;}
	#storeinfoall{width:800px; margin:0px auto;}	
	#storeFrm h1{text-align:center;}																/*로그인로고*/
	#storeFrm>ul>li{padding:10px; padding-right:30px; padding-left:30px;}							/*ID, PW 입력칸*/
	#storeFrm>ul>li:last-of-type{width:90.7%; text-align:center; margin-top:20px;}					/*로그인, 회원가입 입력칸*/
	#storeFrm{max-width:80%; margin:0 auto; padding:10px 10px 40px; background:#f2f2f2;}		/*로그인 전체창 배경*/
 	#storeFrm input{box-sizing:border-box; margin: 5px auto; padding : 12px;}		/*ID, PW 입력칸의 크기*/
	#storename{width:90%;}
	#address{width:90%;}
	#storeshape{width:25%;}
	#week{width:100%;}
	#time{width:90%;}
	#menu{width:50%; height:40px;}
	#content1{width:80%;height:100%;min-height:200px;}
	#content2{width:80%;height:100%;min-height:100px;}

</style>

<div class="storeeditFrm">
	<h1 style="text-align:center">가게 수정 폼</h1>
	<form id=storeFrm method="post" action="/myapp/store/storeEditOk">
		<input type="hidden" name="no" value="${vo.no }" />
		<ul>
			<li>가게이름 </li>
			<li><input type="text" name="subject" id="subject" 
				value="${vo.subject }"/>
			<li>주소 </li>
			<li><input type="text" name="address" id="address"
				value="${vo.address }"></li>
			<li id="storeshape">가게 형태</li>
			<li>
				<input type="checkbox" name="storeshape"/>포장마차(의자o)$
				<input type="checkbox" name="storeshape" />길거리(의자x)
				<input type="checkbox" name="storeshape" />푸드트럭
				<input type="checkbox" name="storeshape" />가게
			</li>
			<li id="week"></li>
			<li>운영 요일</li>
			<li>
				<input type="checkbox" name="week"/>일
				<input type="checkbox" name="week"/>월
				<input type="checkbox" name="week"/>화
				<input type="checkbox" name="week"/>수
				<input type="checkbox" name="week"/>목
				<input type="checkbox" name="week"/>금
				<input type="checkbox" name="week"/>토
			</li>
			<li>운영시간</li>
			<li><input type="text" name="time" id="time" value="${vo.time }"/></li>
		
			<li>대표 메뉴</li>
			<li>
				<select name="menu" id="menu">
					<option value="not">--음식선택--</option>
					<option value="붕어빵">붕어빵</option>
					<option value="타코야끼">타코야끼</option>
					<option value="닭꼬치">닭꼬치</option>
					<option value="호두과자">호두과자</option>
					<option value="국화빵">국화빵</option>
					<option value="계란빵">계란빵</option>
					<option value="토스트">토스트</option>
					<option value="떡볶이">떡볶이</option>
				</select>		
			</li>
			<li>메뉴판(가격도 적어주세요)</li>
			<li><textarea name="content1" id="content1">${vo.content1}</textarea></li>
			<li>추가 사항</li>
			<li><textarea name="content2" id="content2">${vo.content2}</textarea></li>
			<li><input type="submit" value="글수정" /></li>
		</ul>

	</form>
</div>