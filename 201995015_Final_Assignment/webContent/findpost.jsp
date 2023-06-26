<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, post.*"%>
<%
	PostDAO dao = new PostDAO();
	PostBean bean = new PostBean();
	request.setCharacterEncoding("UTF-8");
	String ftitle = request.getParameter("ftitle");
	
	bean = dao.findCon(ftitle);
	
	String title = bean.getTitle();
	String content = bean.getContent();
	
	RequestDispatcher dispatcher = application.getRequestDispatcher("/detail.jsp?title="+title+"&content="+content);
	dispatcher.forward(request, response);
%>