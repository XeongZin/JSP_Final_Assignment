package functions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.*;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO memberdao = new MemberDAO();
		MemberBean m = new MemberBean();
		PrintWriter writer = response.getWriter();
		
		//setContentType()을 이용해 응답할 데이터 종류가 HTML임을 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		m.setId(request.getParameter("id"));
		m.setPwd(request.getParameter("pwd"));
		m.setName(request.getParameter("name"));
		m.setEmail(request.getParameter("email"));
		String cpwd = request.getParameter("pwd_c");
		
		System.out.println("pwd" + m.getPwd());
		System.out.println("cpwd" + cpwd);
		
		if(cpwd.equals((String)m.getPwd())) {
			memberdao.addMember(m);

			writer.println("<script>alert('Sign up successed!'); location.href='"+"signin.html"+"';</script>"); 
			writer.close();
			
			response.sendRedirect("signin.html");
		}
		else {
			writer.println("<script>alert('please check the password!'); location.href='"+"signup.jsp"+"';</script>"); 
			writer.close();
		}

	}
}
