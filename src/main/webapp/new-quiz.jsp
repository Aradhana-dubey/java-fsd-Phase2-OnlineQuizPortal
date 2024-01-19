<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Table</title>
<style>
body {
font-family: Arial, sans-serif;
margin: 20px;
}
h1 {
text-align: center;
}
form {
margin-top: 20px;
}
label {
display: block;
margin-bottom: 5px;
font-weight: bold;
}
input[type="text"] {
width: 100%;
padding: 10px;
font-size: 16px;
border-radius: 4px;
border: 1px solid #ccc;
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
<h1>Create quiz</h1>
<formaction="createquiz"method="post">
<labelfor="tableName">Quiz Name:</label>
<inputtype="text"id="tableName"name="tableName"required>
<br>
<inputtype="submit"value="Create">
</form>
</body>
</html>