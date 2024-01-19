package adminLogin;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Adminlogin
 */
public class Adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String username = request.getParameter("adminUsername");
    	String password = request.getParameter("adminPassword");

    	response.setContentType("text/html");
    	PrintWriter out = response.getWriter();
    	try
    	{
    	if(username.equalsIgnoreCase("Admin")&&password.equalsIgnoreCase("admin123"))
    	{
    	response.sendRedirect("adminworkstation.jsp");
    	}
    	else {
    	out.print("<h3>Incorrect Username/Password, try again.</h3>");
    	RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
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
