package post;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PostDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	private ResultSet rs;
	
	public PostDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List listPost() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "select * from posts order by joinDate desc ";
			System.out.println("prepareStatememt : " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date joinDate = rs.getDate("joinDate");
				PostBean vo = new PostBean();
				vo.setTitle(title);
				vo.setContent(content);
				vo.setJoinDate(joinDate);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addPost(PostBean postBean) {
		try {
			Connection con = dataFactory.getConnection();
			String title = postBean.getTitle();
			String content = postBean.getContent();
			String query = "insert into posts";
			query += " (title, content)";
			query += " values(?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void revPost(PostBean postBean) {
		try {
			Connection con = dataFactory.getConnection();
			String title = postBean.getTitle();
			String content = postBean.getContent();
			String query = "update posts SET";
			query += " content = ? where title = ?";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setString(2, title);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delPost(PostBean postBean) {
		try {
			Connection con = dataFactory.getConnection();
			String title = postBean.getTitle();
			String query = "delete from posts where title = ?";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public PostBean findCon(String ftitle) {
		PostBean bean = new PostBean();
		try {
			Connection con = dataFactory.getConnection();
			String title = ftitle;
			String query = "select * from posts where title = ?";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.executeUpdate();
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean.setTitle(rs.getString(1));
				bean.setContent(rs.getString(2));
				bean.setJoinDate(rs.getDate(3));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
}