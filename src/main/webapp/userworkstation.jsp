<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Select Quiz</title>
<style>
body {
font-family: Arial, sans-serif;
margin: 20px;
background-color: #f2f2f2;
}


h1 {
color: #333;
margin-bottom: 20px;
}


form {
display: flex;
flex-direction: column;
align-items: center;
background-color: #fff;
padding: 20px;
border-radius: 8px;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}


label {
margin-bottom: 10px;
font-weight: bold;
}


select {
padding: 5px;
margin-bottom: 20px;
width: 200px;
}


.logout-button {
position: absolute;
top: 10px;
right: 10px;
padding: 10px 20px;
font-size: 16px;
background-color: #f44336;
color: white;
border: none;
border-radius: 4px;
cursor: pointer;
text-decoration: none;
transition: background-color 0.3s ease;
}


.logout-button:hover {
background-color: #d32f2f;
}


.logout-button:active {
background-color: #b71c1c;
}
</style>
</head>
<body>
<%@pageimport="java.sql.Connection"%>
<%@pageimport="java.sql.Statement"%>
<%@pageimport="java.sql.ResultSet"%>
<%@pageimport="java.sql.SQLException"%>
<%@pageimport="com.dbconnection.DBUtil"%>
<h1>Select Quiz</h1>
<formaction="view-quiz.jsp"method="post">
<labelfor="tableSelect">Select a Topic:</label>
<selectname="tableSelect"id="tableSelect">
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
conn = DBUtil.getConnection();
stmt = conn.createStatement();
rs = stmt.executeQuery("SHOW TABLES");
while (rs.next()) {
String tableName = rs.getString(1);
%>
<optionvalue="<%= tableName %>"><%= tableName %></option>
<%
}
} catch (SQLException e) {
e.printStackTrace();
} finally {
DBUtil.closeResultSet(rs);
DBUtil.closeStatement(stmt);
DBUtil.closeConnection(conn);
}
%>
</select>
<buttontype="submit">Start Quiz</button>
</form>
<ahref="home.jsp"class="logout-button">Logout</a>
</body>
</html>