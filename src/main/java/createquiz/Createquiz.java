package createquiz;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.dbconnection.DBUtil;
	


/**
 * Servlet implementation class Createquiz
 */
public class Createquiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Createquiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String tableName = request.getParameter("tableName");

    	        try (Connection conn = DBUtil.getConnection()) {
    	            String createTableQuery = "CREATE TABLE " + tableName + " (" +
    	                    "id INT AUTO_INCREMENT PRIMARY KEY," +
    	                    "question VARCHAR(255) NOT NULL," +
    	                    "optionA VARCHAR(255) NOT NULL," +
    	                    "optionB VARCHAR(255) NOT NULL," +
    	                    "optionC VARCHAR(255) NOT NULL," +
    	                    "optionD VARCHAR(255) NOT NULL," +
    	                    "correctOption VARCHAR(1) NOT NULL" +
    	                    ")";

    	            PreparedStatement preparedStatement = conn.prepareStatement(createTableQuery);
    	            preparedStatement.executeUpdate();

    	            response.getWriter().println("Table created successfully!");
    	            RequestDispatcher dispatcher = request.getRequestDispatcher("question-input.jsp");
    	            dispatcher.include(request, response);
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.getWriter().println("Error creating table: " + e.getMessage());
    	            RequestDispatcher dispatcher = request.getRequestDispatcher("new-quiz.jsp");
    	            dispatcher.include(request, response);
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
