<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<link type="text/css" href="Login.css" rel="stylesheet">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
</head>
<%
	String info = (String) request.getAttribute("entrance_info");
%>
<body>
<h3 style="color: red">
	<%=info == null ? "" : info%>
</h3>
<h1>LOGIN PAGE</h1>
<div>
	<form action="login" method="post">
		<table>
			<tr>
				<td class="MyInput">Username:</td>
				<td>
					<input class="MyInput" name="UsernameInput" type="text"/>
				</td>
			</tr>
			<tr>
				<td class="MyInput">Password:</td>
				<td>
					<input class="MyInput" name="PasswordInput" type="password"/>
				</td>
			</tr>
		</table>
		<br/>
		<div class="InnerDiv">
			<input class="LoginButton" type="submit" value="Login"/>
		</div>
	</form>
</div>

<div>
	<%
		//        String info = (String) request.getAttribute("info");
//        out.println(info);
	%>
</div>
</body>
</html>