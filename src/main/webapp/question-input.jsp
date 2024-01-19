<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Question Input</title>
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


label {
display: block;
margin-bottom: 5px;
font-weight: bold;
}


input[type="text"],
input[type="radio"] {
margin-bottom: 10px;
padding: 8px;
border: 1px solid #ccc;
border-radius: 4px;
}


input[type="submit"] {
padding: 10px 20px;
font-size: 16px;
background-color: #4CAF50;
color: white;
border: none;
border-radius: 4px;
cursor: pointer;
}


input[type="submit"]:hover {
background-color: #45a049;
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
<ahref="all-quiz.jsp">That's all. Go back</a>
<%String tableName=request.getParameter("tableName"); %>
<h1>Question Input for <%out.println(tableName); %></h1>
<formaction="SaveQuestion"method="post">
<labelfor="question">Question:</label>
<inputtype="text"id="question"name="question"required>
<br>
<labelfor="optionA">Option A:</label>
<inputtype="text"id="optionA"name="optionA"required>
<br>
<labelfor="optionB">Option B:</label>
<inputtype="text"id="optionB"name="optionB"required>
<br>
<labelfor="optionC">Option C:</label>
<inputtype="text"id="optionC"name="optionC"required>
<br>
<labelfor="optionD">Option D:</label>
<inputtype="text"id="optionD"name="optionD"required>
<br>
<labelfor="correctOption">Correct Option:</label>
<inputtype="radio"id="optionA"name="correctOption"value="A"required>
<labelfor="optionA">A</label>
<inputtype="radio"id="optionB"name="correctOption"value="B"required>
<labelfor="optionB">B</label>
<inputtype="radio"id="optionC"name="correctOption"value="C"required>
<labelfor="optionC">C</label>
<inputtype="radio"id="optionD"name="correctOption"value="D"required>
<labelfor="optionD">D</label>
<inputtype="hidden"name="tableName"value="<%= tableName %>">
<br>
<inputtype="submit"value="Save & Next">
</form>
</body>
</html>