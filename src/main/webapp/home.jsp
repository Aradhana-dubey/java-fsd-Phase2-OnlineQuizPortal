<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Table List</title>
<style>
body {
font-family: Arial, sans-serif;
margin: 20px;
}
h1 {
text-align: center;
}
table {
width: 100%;
border-collapse: collapse;
}
th,td {
padding: 10px;
text-align: left;
border-bottom: 1px solid #ddd;
}
th {
background-color: #f2f2f2;
}
.delete-button,
.redirect-button {
padding: 5px 10px;
font-size: 14px;
border: none;
border-radius: 4px;
cursor: pointer;
}
.delete-button {
background-color: #f44336;
color: white;
}
.delete-button:hover {
background-color: #d32f2f;
}
.redirect-button {
background-color: #4CAF50;
color: white;
margin-left: 10px;
}
.redirect-button:hover {
background-color: #45a049;
}
.back-button {
padding: 5px 10px;
font-size: 14px;
background-color: #333;
color: white;
border: none;
border-radius: 4px;
cursor: pointer;
text-decoration: none;
}
.back-button:hover {
background-color: #555;
}
</style>
</head>
<body>
<ahref="adminworkstation.jsp"class="back-button">Back</a>
<%@pageimport="java.sql.Connection"%>
<%@pageimport="java.sql.Statement"%>
<%@pageimport="java.sql.ResultSet"%>
<%@pageimport="java.sql.SQLException"%>
<%@pageimport="com.dbconnection.DBUtil"%>
<h1>Quiz List</h1>
<table>
<tr>
<th>Quiz Name</th>
<th>Action</th>
</tr>
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
<tr>
<td><%= tableName %></td>
<td>
<formaction="deleteTable"method="post"style="display: inline-block;">
<inputtype="hidden"name="tableName"value="<%= tableName %>">
<buttonclass="delete-button"type="submit">Delete</button>
</form>
<formaction="question-input.jsp"method="post"style="display: inline-block;">
<inputtype="hidden"name="tableName"value="<%= tableName %>">
<buttonclass="redirect-button"type="submit">Add Questions</button>
</form>
<formaction="show-all-questions.jsp"method="post"style="display: inline-block;">
<inputtype="hidden"name="tableName"value="<%= tableName %>">
<buttonclass="redirect-button"type="submit">Show Questions</button>
</form>
</td>
</tr>
<%
}
} catch (SQLException e) {
e.printStackTrace();
response.sendRedirect("adminworkstation.jsp");
} finally {
DBUtil.closeResultSet(rs);
DBUtil.closeStatement(stmt);
DBUtil.closeConnection(conn);
}
%>
</table>


</body>
</html>