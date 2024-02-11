

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String Name=request.getParameter("name");
		String Email=request.getParameter("email");
		String Password=request.getParameter("pwd");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shopping_jsp","root","1437");
			String qr="insert into user values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qr);
			ps.setString(2, Email);
			ps.setString(3, Password);
			ps.setString(1, Name);
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("user.html");
				rd.include(request, response);
				out.println("<script>window.alert('Signed Up Succesfully');</script>");
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("signup.html");
				rd.include(request, response);
				out.println("<script>window.alert('please check  details');</script>");
			}
				conn.close();
			}
		catch (Exception e) {
		out.println(e);
		}
		
	}

}
