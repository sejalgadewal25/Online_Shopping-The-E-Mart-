

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class User_Login
 */
@WebServlet("/User_Login")
public class User_Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String email=request.getParameter("email");
		
		String pwd=request.getParameter("pwd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shopping_jsp","root","1437");
			String qr="select * from user where Email=? and Password=?";
			PreparedStatement ps=conn.prepareStatement(qr);
			ps.setString(1, email);
			ps.setString(2, pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("id", email);
				response.sendRedirect("Uhome.jsp");
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("index.html");
				rd.include(request, response);
				out.println("<script>window.alert('Invalid id and pasword')</script>");
			}
			conn.close();
		} 
		catch (Exception e) {
			out.println(e);
		}
		
	}


}
