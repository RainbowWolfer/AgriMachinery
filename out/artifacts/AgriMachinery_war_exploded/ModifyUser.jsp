<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
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
<h1 style="color: red" id="hint"></h1>
<div>
	<h1>
		<%=user == null ? "添加新用户" : "修改用户：" + user.getUsername()%>
	</h1>
	<form action="submitmodify" method="get" onsubmit="return OnSubmit()">
		<table>
			<tr>
				<th>编号：</th>
				<td>
					<%=user == null ? MyDataBase.GetUserNextID() : user.getId()%>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>用户名：</th>
				<td>
					<input name="usernameInput" id="usernameInput" type="text"
					       value='<%=user == null ? "" : user.getUsername()%>'
					       oninput="OnChanged(this,'line1')"/>
				</td>
				<td id="line1">*</td>
			</tr>
			<tr>
				<th>密码：</th>
				<td>
					<input name="passwordInput" id="passwordInput" type="text"
					       value='<%=user == null ? "" : user.getPassword()%>'
					       oninput="OnChanged(this,'line2')"/>
				</td>
				<td id="line2">*</td>
			</tr>
			<tr>
				<th>电话：</th>
				<td>
					<input name="phoneInput" id="phoneInput" type="text"
					       value='<%=user == null ? "" : user.getPhone()%>'
					       oninput="OnChanged(this,'line3')"/>
				</td>
				<td id="line3">*</td>
			</tr>
			<tr>
				<th>地址：</th>
				<td>
					<input name="placeInput" id="placeInput" type="text"
					       value='<%=user == null ? "" : user.getPlace()%>'
					       oninput="OnChanged(this,'line4')"/>
				</td>
				<td id="line4">*</td>
			</tr>
			<tr>
				<th>管理员：</th>
				<td>
					<input name="adminInput" id="adminInput"
					       type="checkbox" <%=user != null && user.isAdmin() ? "checked" : ""%>/>
				</td>
				<td></td>
			</tr>
		</table>
		<input name="user_id" type="hidden"
		       value='<%=user != null ? user.getId() : -1%>'/>
		<input type="submit" value="确认"/>
	</form>
</div>
<script>
    function OnSubmit() {
        let username_input = document.getElementById("usernameInput").value;
        let password_input = document.getElementById("usernameInput").value;
        let phone_input = document.getElementById("usernameInput").value;
        let place_input = document.getElementById("usernameInput").value;

        if (username_input.length === 0 || password_input.length === 0 || phone_input.length === 0 || place_input.length === 0) {
            document.getElementById("hint").textContent = "请输入必要项";
            return false;
        }

        return confirm('确认提交');
    }

    function OnChanged(_self, targetID) {
        let target = document.getElementById(targetID);
        let changed = _self.value;
        target.style.color = changed.length === 0 ? "red" : "white";
    }
</script>
</body>
</html>
