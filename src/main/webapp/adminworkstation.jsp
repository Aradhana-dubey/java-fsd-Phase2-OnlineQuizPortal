<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Quiz Navigation</title>
<style>
body {
font-family: Arial, sans-serif;
}
.container {
max-width: 400px;
margin: 0 auto;
padding: 20px;
}
.btn {
display: block;
width: 100%;
padding: 10px 20px;
margin-bottom: 10px;
text-align: center;
text-decoration: none;
background-color: #4CAF50;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
}
.btn:hover {
background-color: #45a049;
}
</style>
</head>
<body>
<divclass="container">
<h1>Quiz Navigation</h1>
<ahref="all-quiz.jsp"class="btn">All Quiz</a>
<ahref="new-quiz.jsp"class="btn">Enter New Quiz</a>
<ahref="adminlogin.jsp"class="btn">Logout</a>
</div>
</body>
</html>