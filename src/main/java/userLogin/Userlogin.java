package userLogin;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Userlogin
 */
public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String username = request.getParameter("Username");
    	String password = request.getParameter("Password");

    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	try
    	{
    	if(username.equalsIgnoreCase("Student")&&password.equalsIgnoreCase("Student123"))
    	{
    	response.sendRedirect("userworkstation.jsp");
    	}
    	else {
    	out.print("<h3>Incorrect Username/Password, try again.</h3>");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
    	            dispatcher.include(request, response);
    	}

    	}
    	catch(Exception ex)
    	{
    	ex.printStackTrace();
    	}
    	}

    	/**
    	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    	 */
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	response.getWriter().append("Served at: ").append(request.getContextPath());
    	}

    	/**
    	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    	 */
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doGet(request, response);
    	}

    	}
