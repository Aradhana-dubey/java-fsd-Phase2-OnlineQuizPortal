<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Quiz Questions</title>
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


table {
width: 100%;
border-collapse: collapse;
background-color: #fff;
border: 1px solid #ddd;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


th,td {
padding: 10px;
text-align: left;
border-bottom: 1px solid #ddd;
}


th {
background-color: #f2f2f2;
color: #333;
}


a {
color: #333;
text-decoration: none;
font-size: 14px;
}


a:hover {
text-decoration: underline;
}
</style>
</head>
<body>
<ahref="all-quiz.jsp">Back</a>
<h1>Quiz Questions</h1>
<table>
<tr>
<th>Question of <%String table = request.getParameter("tableName");out.print(table); %></th>
<th>Option A</th>
<th>Option B</th>
<th>Option C</th>
<th>Option D</th>
<th>Correct Option</th>
</tr>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
conn = DBUtil.getConnection();
stmt = conn.createStatement();
String query = "SELECT * FROM " + table;
rs = stmt.executeQuery(query);


while (rs.next()) {
String question = rs.getString("question");
String optionA = rs.getString("optiona");
String optionB = rs.getString("optionb");
String optionC = rs.getString("optionc");
String optionD = rs.getString("optiond");
String correctOption =rs.getString("correctOption");
%>
<tr>
<td><%= question %></td>
<td><%= optionA %></td>
<td><%= optionB %></td>
<td><%= optionC %></td>
<td><%= optionD %></td>
<td><%= correctOption %></td>
</tr>
<%
}
} catch (SQLException e) {
e.printStackTrace();
} finally {
// Close the ResultSet and Statement (Connection will be closed in the servlet)
try {
if (rs != null) {
rs.close();
}
if (stmt != null) {
stmt.close();
}
} catch (SQLException e) {
e.printStackTrace();
}
}
%>
</table>
</body>
</html>