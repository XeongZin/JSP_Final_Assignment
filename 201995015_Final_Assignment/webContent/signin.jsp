<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, user.*"
    pageEncoding="UTF-8"%>
<jsp:useBean id="m" class="user.MemberBean" scope="page" />
<jsp:setProperty name="m" property="*"/>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO memberDAO = new MemberDAO();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sign in...</title>
	</head>
	<body>
		<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		if(id == null || pwd == null || id.trim().equals("") || pwd.trim().equals("")) {%>
			response.write("<script>alert('Please Enter The Id and Password.');</script>");
			Response.Write("<script>location.href='signin.html';</script>");
			return;
		<%} 
		boolean isExist = memberDAO.checkMember(id, pwd);
		if(isExist) {
 			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		} else {%>
		alert("Please Try Again...");
		Response.Write("<script>alert('Please Try Again...');</script>");
		Response.Write("<script>location.href='signin.html';</script>");
		<%}%>
	</body>
</html>