package DeleteTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import com.dbconnection.DBUtil;


/**
 * Servlet implementation class deleteTable
 */
public class deleteTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String tableName = request.getParameter("tableName");

    	        Connection conn = null;
    	        Statement stmt = null;
    	        try {
    	            conn = DBUtil.getConnection();
    	            stmt = conn.createStatement();
    	            stmt.executeUpdate("DROP TABLE " + tableName);
    	            response.sendRedirect("all-quiz.jsp"); // Redirect to the same page to show the updated list of tables
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.getWriter().println("Error deleting table: " + e.getMessage());
    	        } finally {
    	            DBUtil.closeStatement(stmt);
    	            DBUtil.closeConnection(conn);
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
