<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	User user = (User) request.getAttribute("modify_target");
%>
<link rel="stylesheet" type="text/css" href="ModifyUser.css"/>
<head>
	<title>
		<%=user == null ? "添加新用户" : "修改用户"%>
	</title>
</head>
<body>
<div>
	<h1>
		<%=user == null ? "添加新用户" : "修改用户：" + user.getUsername()%>
	</h1>
	<form onsubmit="return confirm('确认提交');">
		<table>
			<tr>
				<th>用户名：</th>
				<td>
					<input type="text"
					       value=<%=user == null ? "" : user.getUsername()%>>
				</td>
			</tr>
			<tr>
				<th>密码：</th>
				<td>
					<input type="text"
					       value=<%=user == null ? "" : user.getPassword()%>>
				</td>
			</tr>
			<tr>
				<th>管理员：</th>
				<td>
					<input type="checkbox"
					       value=<%=user != null && user.isAdmin()%>>
				</td>
			</tr>
		</table>
		<input type="submit" value="确认"/>
	</form>
</div>
</body>
</html>
