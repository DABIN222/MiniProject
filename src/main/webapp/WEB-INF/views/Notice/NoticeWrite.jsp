<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#subject {
	width: 98%;
}

#NoticeFrm li {
	padding: 10px 5px;
}
</style>
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
   $(function() {
      CKEDITOR.replace("content");

      $("#NoticeFrm").submit(function() {
         if ($("#subject").val() == '') {
            alert("글 제목을 입력하세요");
            return false;
         }
         if (CKEDITOR.instances.content.getData() == '') {
            alert("글내용을 입력하세요");
            return false;
         }
      });
   });
</script>
<div class="NoticedWriteFrm">

	<h1>글등록 폼</h1>
	<form method="post" action="/myapp/Notice/NoticeWriteOk" id="NoticeFrm">
		<ul>
			<li>제목</li>
			<li><input type="text" name="subject" id="subject" /></li>
			<li><textarea name="content" id="content"></textarea></li>
			<li><input type="submit" value="등록" /></li>
		</ul>
	</form>

</div>