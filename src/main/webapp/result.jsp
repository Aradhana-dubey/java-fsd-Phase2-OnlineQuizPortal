<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Quiz Result</title>
<style>
body {
font-family: Arial, sans-serif;
margin: 0;
padding: 0;
display: flex;
justify-content: center;
align-items: center;
min-height: 100vh;
background-color: #f2f2f2;
}


.container {
text-align: center;
background-color: #ffffff;
padding: 40px;
border-radius: 5px;
box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}


h1 {
color: #333;
margin-bottom: 20px;
}


p {
margin-bottom: 20px;
color: #666;
font-size: 18px;
}


.score {
font-size: 24px;
font-weight: bold;
color: #333;
}


.logout-button {
display: inline-block;
padding: 10px 20px;
font-size: 16px;
background-color: #4CAF50;
color: white;
text-decoration: none;
border-radius: 4px;
transition: background-color 0.3s ease;
}


.logout-button:hover {
background-color: #45a049;
}
</style>
</head>
<body>
<divclass="container">
<h1>Quiz Result</h1>
<%int score = (int) request.getAttribute("score"); %>
<pclass="score">Your score: <%= score %>%</p>
<ahref="userworkstation.jsp"class="logout-button">Finish</a>
</div>
</body>
</html>