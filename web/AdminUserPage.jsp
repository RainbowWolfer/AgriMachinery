<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
<%@ page import="model.Tractor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<link type="text/css" href="AdminUserPage.css" rel="stylesheet">
<head>
	<title>Admin</title>
</head>
<%
	User user = (User) request.getAttribute("user");
%>
<body>
<div class="left">
	<div>
		<table class="infotable">
			<tr>
				<td>
					<img id="avatar" src="resources/testgif.gif"
					     alt="Avatar">
				</td>
			</tr>
			<tr>
				<td class="infotd">
					当前管理员：<%--<%=user.getUsername()%>--%>
				</td>
			</tr>
			<tr>
				<td class="infotd">
					洛阳理工学院 - 农机管理
				</td>
			</tr>
		</table>
	</div>
	<div class="btm">
		<table>
			<tr>
				<td>
					<form action="userpage" method="post">
						<input class="menuButton" type="submit" value="修改登录信息"/>
					</form>
				</td>
				<td><p class="menuButton">·</p></td>
				<td>
					<form action="userpage" method="get">
						<input class="menuButton" type="submit" value="注销"/>
					</form>
				</td>
			</tr>
		</table>
		<p>@All Rights Reserved<br/>RainbowWolfer</p>
	</div>
</div>
<div class="right">
	<%
		List<Tractor> list = MyDataBase.GetAllTractors();
	%>
	<p class="righttitle">
		总共个数： <%=list.size()%>
	</p>
	<table class="tractorstable">
		<tr>
			<th class="nametd">名称</th>
			<th class="descriptiondtd">描述</th>
			<th class="pricetd">价格</th>
		</tr>
		<%
			for(Tractor t : list) {
		%>
		<tr>
			<td class="nametd">
				<%=t.getName()%>
			</td>
			<td class="descriptiondtd" id="descriptioncontent">
				<%=t.getDescription()%>
			</td>
			<td class="pricetd">
				<%=t.getPrice()%>
			</td>
		</tr>
		<% }
		%>
	</table>
</div>
</body>
</html>
