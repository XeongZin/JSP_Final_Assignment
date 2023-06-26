<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, post.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="p" class="post.PostBean" scope="page" />
<jsp:setProperty name="p" property="*"/>
<%
	request.setCharacterEncoding("UTF-8");
	PostDAO postDAO = new PostDAO();
	postDAO.addPost(p);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Posting...</title>
	</head>
	<body>
		<script>
			alert('Post Complete');
			location.href= 'board.jsp';
		</script>
	</body>
</html> 