<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link type="text/css" href="ChangePasswordPage.css" rel="stylesheet">
<head>
	<title>Change Your Password</title>
</head>
<%
	String hint = (String) request.getAttribute("hint");
	hint = hint == null ? "" : hint;
%>
<body>
<h1 class="hint">
	<%=hint%>
</h1>
<h2 style="color: red" id="empty_hint"></h2>
<h1>修改密码</h1>
<h2>当前用户：
	<%
		User u = (User) request.getSession().getAttribute("user");
		if (u != null) {
			out.print(u.getUsername());
		}
	%>
</h2>
<div>
	<form action="submitnewpassword" method="post" onsubmit="return OnSubmit()">
		<table>
			<tr>
				<th>原来密码：</th>
				<td>
					<input name="originalInput" id="originalInput" type="text"/>
				</td>
				<td id="line1">*</td>
			</tr>
			<tr>
				<th>新密码：</th>
				<td>
					<input name="newInput" id="newInput" type="text"/>
				</td>
				<td id="line2">*</td>
			</tr>
			<tr>
				<th>确认密码：</th>
				<td>
					<input name="confirmInput" id="confirmInput" type="text" onchange="alert('?')"/>
				</td>
				<td id="line3">*</td>
			</tr>
		</table>
		<br/>
		<input type="submit" value="确认修改"/>
	</form>
</div>
<script>
    function OnSubmit() {
        let originalInput = document.getElementById("originalInput");
        let newInput = document.getElementById("newInput");
        let confirmInput = document.getElementById("confirmInput");

        if (originalInput.value.length === 0 || newInput.value.length === 0 || confirmInput.value.length === 0) {
            document.getElementById('empty_hint').textContent = "请输入必要项";
            return false;
        }
        return true;
    }
</script>
</body>
</html>
