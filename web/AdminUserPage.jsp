<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
<%@ page import="model.Tractor" %>
<%@ page import="java.util.List" %>
<%@ page import="utility.PageType" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<link type="text/css" href="AdminUserPage.css" rel="stylesheet">
<%
	User user = (User) request.getAttribute("user");
	String entrace_alert = (String) request.getAttribute("entrace_alert");
	entrace_alert = entrace_alert == null ? "" : entrace_alert;

	//prevent refreshing show the same message (but it does not seem to work correctly)
	request.setAttribute("entrace_alert", "");

	User check_user = (User) request.getAttribute("check_user");

	PageType type = PageType.Normal;
	if (check_user != null) {
		type = PageType.CheckUser;
	}
%>
<head>
	<title>Admin</title>
	<script>
        if ('<%=entrace_alert%>'.length !== 0) {
            alert('<%=entrace_alert%>');
        }
	</script>
</head>
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
					当前管理员：<%=user == null ? "" : user.getUsername()%>
				</td>
			</tr>
			<tr>
				<td class="infotd" style="padding: 0 0 40px 0">
					洛阳理工学院 - 农机管理
				</td>
			</tr>
			<tr>
				<td>
					<input class="showPageButton" type="button" value="查看所有用户"
					       onclick="ShowUsers()"/>
				</td>
			</tr>
			<tr>
				<td>
					<input class="showPageButton" type="button" value="查看所有农机"
					       onclick="ShowTractors()"/>
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
		if (type == PageType.Normal) {
	%>
	<div class="usersDIV" id="_usersdiv">
		<%
			List<User> list_users = MyDataBase.GetAllUsers();
		%>
		<p class="righttitle">
			总共个数： <%=list_users.size()%>
		</p>
		<form class="addButtonForm" action="addnew" method="get">
			<input class="addButton" type="submit" value="添加新用户"/>
		</form>
		<div class="div_table">
			<table class="tractorstable">
				<tr>
					<th class="nametd">姓名</th>
					<th class="descriptiondtd">密码</th>
					<th class="pricetd">是否为管理员</th>
					<th class="oprationtd">操作</th>
				</tr>
				<%
					for (User u : list_users) {
				%>
				<tr>
					<td class="nametd">
						<p>
							<%=u.getUsername()%>
						</p>
					</td>
					<td class="descriptiondtd">
						<p>
							<%=u.getPassword()%>
						</p>
					</td>
					<td class="pricetd">
						<p>
							<%=u.isAdmin()%>
						</p>
					</td>
					<td class="oprationtd">
						<form style="margin: 0" action="delete" method="get"
						      onsubmit="return confirm('确认删除用户'.concat('<%=u.getUsername()%>'))">
							<input name="ObjectInput" type="hidden"
							       value="<%=u.getUsername()%>"/>
							<input class="oprationButton" type="submit"
							       value="删除"/>
						</form>
						<form style="margin: 0" action="modify" method="get">
							<input name="ObjectInput" type="hidden"
							       value="<%=u.getUsername()%>"/>
							<input class="oprationButton" type="submit"
							       value="修改"/>
						</form>
						<form style="margin: 0" action="checkUserInfo" method="get">
							<input name="ObjectInput" type="hidden"
							       value="<%=u.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="查看"/>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="tractorsDIV" id="_tractorsdiv">
		<%
			List<Tractor> list_tractors = MyDataBase.GetAllTractors();
		%>
		<p class="righttitle">
			总共个数： <%=list_tractors.size()%>
		</p>
		<form class="addButtonForm" action="addnew" method="post">
			<input class="addButton" type="submit" value="添加新农机"/>
		</form>
		<div class="div_table">
			<table class="tractorstable">
				<tr>
					<th class="nametd">名称</th>
					<th class="descriptiondtd">描述</th>
					<th class="pricetd">价格</th>
					<th class="oprationtd">操作</th>
				</tr>
				<%
					for (Tractor t : list_tractors) {
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
					<td class="oprationtd">
						<form style="margin: 0" action="delete" method="post"
						      onsubmit="return confirm('确认删除农机'.concat('<%=t.getName()%>'))">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getName()%>"/>
							<input class="oprationButton" type="submit"
							       value="删除"/>
						</form>
						<form style="margin: 0" action="modify" method="post">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getName()%>"/>
							<input class="oprationButton" type="submit"
							       value="修改"/>
						</form>
					</td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>
	<script>
        function ShowUsers() {
            document.getElementById("_usersdiv").style.display = "initial";
            document.getElementById("_tractorsdiv").style.display = "none";
            sessionStorage.setItem('key_page', 'user');
        }

        function ShowTractors() {
            document.getElementById("_tractorsdiv").style.display = "initial";
            document.getElementById("_usersdiv").style.display = "none";
            sessionStorage.setItem('key_page', 'tractor');
        }

        let _page = sessionStorage.getItem('key_page');
        if (_page === 'user') {
            ShowUsers();
        } else if (_page === 'tractor') {
            ShowTractors();
        }

	</script>
	<%
	} else if (type == PageType.CheckUser) {
	%>
	<div class="userInformationDIV">
		<p>
			查看用户农机信息：<%=check_user.getUsername()%>
		</p>
		<table>
			<tr>
				<th>编号</th>
				<th>名称</th>
				<th>描述</th>
				<th>马力</th>
				<th>价格</th>
			</tr>
			<%
				for (Tractor t : check_user.getOwned()) {
			%>
			<tr>
				<td>
					<%=t.getId()%>
				</td>
				<td>
					<%=t.getName()%>
				</td>
				<td>
					<%=t.getDescription()%>
				</td>
				<td>
					<%=t.getPower()%>
				</td>
				<td>
					<%=t.getPrice()%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<%
		}
	%>
</div>
</body>
</html>
