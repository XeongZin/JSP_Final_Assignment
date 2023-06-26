<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, user.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="m" class="user.MemberBean" scope="page" />
<jsp:setProperty name="m" property="*"/>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)request.getAttribute("id");
	MemberDAO memDAO = new MemberDAO();
	memDAO.delMember(id);
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Deleting</title>
	</head>
	<body>
		<script>
			alert('Delete Complete');
			location.href= 'memlist.jsp';
		</script>
	</body>
</html>