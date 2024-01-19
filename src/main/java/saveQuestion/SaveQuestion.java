package saveQuestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

import com.dbconnection.DBUtil;


/**
 * Servlet implementation class SaveQuestion
 */
public class SaveQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String tableName=request.getParameter("tableName");
    	 String question = request.getParameter("question");
    	        String optionA = request.getParameter("optionA");
    	        String optionB = request.getParameter("optionB");
    	        String optionC = request.getParameter("optionC");
    	        String optionD = request.getParameter("optionD");
    	        String correctOption = request.getParameter("correctOption");

    	        try (Connection conn = DBUtil.getConnection()) {
    	            String insertQuestionQuery = "INSERT INTO "+tableName+" (question, optionA, optionB, optionC, optionD, correctOption) VALUES (?, ?, ?, ?, ?, ?)";
    	            PreparedStatement preparedStatement = conn.prepareStatement(insertQuestionQuery);
    	            preparedStatement.setString(1, question);
    	            preparedStatement.setString(2, optionA);
    	            preparedStatement.setString(3, optionB);
    	            preparedStatement.setString(4, optionC);
    	            preparedStatement.setString(5, optionD);
    	            preparedStatement.setString(6, correctOption);
    	            preparedStatement.executeUpdate();

//    		            request.setAttribute("tableName", tableName);
    	            request.getRequestDispatcher("question-input.jsp").forward(request, response); // Redirect to the same page for next question input
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.getWriter().println("Error saving question: " + e.getMessage());
    	        }
    	}

    	}
