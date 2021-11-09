<%@ page import="database.MyDataBase" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Agriculture Machinery Management</title>
</head>
<link type="text/css" href="index.css" rel="stylesheet">
<body>
<h1>Agriculture Machinery Management</h1>
<div class="LoginDiv">
	<form action="login" method="get">
		<input class="LoginButton" type="submit" value="Login"/>
	</form>
</div>
<div>
	<%
		try {
			for (String line : MyDataBase.Test()) {
	%>
	<p>
		<%=line%>
	</p>
	<%
			}
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	%>
</div>
</body>
</html>
