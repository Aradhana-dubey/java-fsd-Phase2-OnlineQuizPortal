<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
display: flex;
justify-content: center;
align-items: center;
height: 100vh;
background-color: #f2f2f2;
font-family: Arial, sans-serif;
color: #333;
}
.center-div {
text-align: center;
background-color: #fff;
padding: 40px;
border-radius: 5px;
box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
h1 {
color: #333;
font-size: 32px;
margin-bottom: 30px;
}
h2 {
color: #555;
font-size: 24px;
margin-bottom: 20px;
}
label {
display: block;
margin-bottom: 10px;
font-weight: bold;
color: #666;
font-size: 18px;
}
input[type="text"],
input[type="password"] {
width: 100%;
padding: 10px;
font-size: 16px;
border-radius: 4px;
border: 1px solid #ccc;
margin-bottom: 20px;
}
input[type="submit"] {
padding: 10px 20px;
font-size: 16px;
background-color: #4CAF50;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
transition: background-color 0.3s;
}
input[type="submit"]:hover {
background-color: #45a049;
}
h3 {
margin-top: 20px;
}
a {
color: #666;
text-decoration: none;
transition: color 0.3s;
}
a:hover {
color: #333;
}
</style>
</head>
<body>
<divclass="center-div">
<h1>Welcome Administration</h1>
<h2>Login as Admin:</h2>
<formaction="adminlogin"method="POST">
<labelfor="adminUsername">Username:</label>
<inputtype="text"id="adminUsername"name="adminUsername"required><br><br>
<labelfor="adminPassword">Password:</label>
<inputtype="password"id="adminPassword"name="adminPassword"required><br><br>
<inputtype="submit"value="Login as Admin">
</form>
<h3><ahref='home.jsp'>Back to user login</a></h3>
</div>
</body>
