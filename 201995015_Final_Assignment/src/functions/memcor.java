package functions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.MemberBean;
import user.MemberDAO;

/**
 * Servlet implementation class memcor
 */
@SuppressWarnings("serial")
@WebServlet("/memcor")
public class memcor extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO memberdao = new MemberDAO();
		MemberBean m = new MemberBean();
		
		//setContentType()을 이용해 응답할 데이터 종류가 HTML임을 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		m.setId(request.getParameter("id"));
		m.setPwd(request.getParameter("pwd"));
		m.setName(request.getParameter("name"));
		m.setEmail(request.getParameter("email"));
		memberdao.corMember(m);
		
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('correction successed!'); location.href='"+"main.jsp"+"';</script>"); 
		writer.close();
		
		response.sendRedirect("main.jsp");
	}
}
