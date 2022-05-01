<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.NoticeviewFrm{
		padding:50px;
	}
</style>
<script>
	function NoticedelCheck() {
		//사용자가 y(true), n(false) 선택할수 있는 대화 상자
		if(confirm('삭제하시겠습니까?')){
			//확인버튼 선택시
			location.href = "/myapp/Notice/NoticeDel?no=${vo.no}";
		}
	}
</script>
<div class="NoticeviewFrm">
	<h1>공지사항</h1>
	<ul>
		<li>번호 : ${vo.no }</li>
		<li>작성자 : ${vo.userid }</li>
		<li>작성일 : ${vo.writedate }, 조회수 : ${vo.hit }</li>
		<hr/>
		<li>제목 : ${vo.subject }</li>
		<hr/>
		<li>${vo.content }</li>
		<hr/>
	</ul>
	
	<div>
		<!-- 로그인 아이디와 글쓴이가 같을 경우 수정 -->
		<c:if test="${logId == vo.userid }">
			<a href="/myapp/Notice/NoticeEdit?no=${vo.no}">수정</a>
			<a href="javascript:NoticedelCheck()">삭제</a>
		</c:if>
	</div>
</div>