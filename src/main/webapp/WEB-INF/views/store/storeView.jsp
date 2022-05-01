<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
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
<script>
	function delCheck() {
		//사용자가 y(true), n(false) 선택할수 있는 대화 상자
		if(confirm('삭제하시겠습니까?')){
			//확인버튼 선택시
			location.href = "/myapp/store/storeDel?no=${vo.no}";
		}
	}
</script>
<div class="storeviewFrm">
	<h1 style="text-align:center">가게 정보</h1>
		<ul id=storeFrm >
			<li>가게이름 </li>
			<li><input type="text" name="subject" id="subject" 
				value="${vo.subject }" readonly/>
			<li>주소 </li>
			<li><input type="text" name="address" id="address"
				value="${vo.address }" readonly></li>
			<li id="storeshape">가게 형태</li>
			<li>
				<input type="checkbox" name="storeshape" value="1"/>포장마차(의자o)
				<input type="checkbox" name="storeshape" value="2"/>길거리(의자x)
				<input type="checkbox" name="storeshape" value="3"/>푸드트럭
				<input type="checkbox" name="storeshape" value="4"/>가게
			<li id="week"></li>
			<li>운영 요일</li>
			<li>
				<input type="checkbox" name="week" value="1"/>일
				<input type="checkbox" name="week" value="2"/>월
				<input type="checkbox" name="week" value="3"/>화
				<input type="checkbox" name="week" value="4"/>수
				<input type="checkbox" name="week" value="5"/>목
				<input type="checkbox" name="week" value="6"/>금
				<input type="checkbox" name="week" value="7"/>토
			</li>
			<li>운영시간</li>
			<li><input type="text" name="time" id="time" value="${vo.time }" readonly/></li>
		
			<li>대표 메뉴</li>
			<li>
				<select name="menu" id="menu" >
					<option value="not" >--음식선택--</option>
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
			<li><textarea name="content1" id="content1" readonly>${vo.content1}</textarea></li>
			
			<li>추가 사항</li>
			<li><textarea name="content2" id="content2" readonly>${vo.content2}</textarea></li>
			
			<li><a href="/myapp/store/storeEdit?no=${vo.no}">수정</a>
			<a href="javascript:delCheck()">삭제</a></li>
		</ul>
</div>