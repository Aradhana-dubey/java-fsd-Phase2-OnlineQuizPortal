package submitQuizServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Enumeration;
import java.util.List;

import com.dbconnection.DBUtil;

import java.util.ArrayList;


/**
 * Servlet implementation class SubmitQuizServlet
 */
public class SubmitQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tableName = request.getParameter("tableName");

        Enumeration<String> parameterNames = request.getParameterNames();
        List<Integer> questionIds = new ArrayList<>();
        List<String> userAnswers = new ArrayList<>();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("answer")) {
                String questionId = paramName.substring(paramName.indexOf("r") + 1);
                int questionIdInt = Integer.parseInt(questionId);
                String userAnswer = request.getParameter(paramName);

                questionIds.add(questionIdInt);
                userAnswers.add(userAnswer);
            }
        }

        int totalQuestions = questionIds.size();
        int correctAnswers = 0;
        for (int i = 0; i < questionIds.size(); i++) {
            int questionId = questionIds.get(i);
            String userAnswer = userAnswers.get(i);
            String correctAnswer = getCorrectAnswer(tableName, questionId);


            // Check if the user's answer is correct
            if (userAnswer.equalsIgnoreCase(correctAnswer)) {
	
                correctAnswers++;
            }
        }

        // Calculate the score percentage
        int score = (int) ((correctAnswers / (double) totalQuestions) * 100);        

        // Display the result on the result page
        request.setAttribute("score", score);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    private String getCorrectAnswer(String tableName, int questionId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String correctAnswer = null;

        try {
            conn = DBUtil.getConnection();
            String query = "SELECT correctOption FROM " + tableName + " WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, questionId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                correctAnswer = rs.getString("correctOption");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(stmt);
            DBUtil.closeConnection(conn);
        }

        return correctAnswer;
    }
}
