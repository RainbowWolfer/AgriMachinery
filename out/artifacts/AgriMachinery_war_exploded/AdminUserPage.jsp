<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
<%@ page import="model.Tractor" %>
<%@ page import="java.util.List" %>
<%@ page import="utility.PageType" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<link type="text/css" href="AdminUserPage.css" rel="stylesheet">
<%
	User user = (User) request.getSession().getAttribute("user");
	User check_user = (User) request.getAttribute("check_user");

	PageType type = PageType.Normal;
	if(check_user != null) {
		type = PageType.CheckUser;
	}
%>
<head>
	<title>Admin</title>
	<script>
        let entrace_alert = '<%=session.getAttribute("entrace_alert")%>';
        if (entrace_alert !== 'null') {
            alert(entrace_alert);
            // sessionStorage.removeItem("entrace_alert");
            <%
                session.removeAttribute("entrace_alert");
            %>
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
			<%
				if(type == PageType.Normal) {
			%>
			<tr>
				<td>
					<input class="showPageButton" id="showAllUsersButton"
					       type="button" value="查看所有用户"
					       onclick="ShowUsers()"/>
				</td>
			</tr>
			<tr>
				<td>
					<input class="showPageButton" id="showAllTractorsButton"
					       type="button" value="· 查看所有农机 ·"
					       onclick="ShowTractors()"/>
				</td>
			</tr>
			<%
			} else if(type == PageType.CheckUser) {
			%>
			<tr>
				<td>
					<form action="checkUserInfo" method="post">
						<input class="showPageButton" type="submit" value="返回"/>
					</form>
				</td>
			</tr>
			<%
				}
			%>
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
		if(type == PageType.Normal) {
	%>
	<div class="usersDIV" id="_usersdiv">
		<%
			User[] list_users = MyDataBase.GetAllUsers();
		%>
		<p class="righttitle">
			总共个数： <%=list_users.length%>
		</p>
		<form class="addButtonForm" action="addnew" method="get">
			<input class="addButton" type="submit" value="添加新用户"/>
		</form>
		<div class="div_table">
			<table class="tractorstable">
				<tr>
					<th class="table_content" style="width:20%;">姓名</th>
					<th class="table_content" style="width:20%;">密码</th>
					<th class="table_content" style="width:20%;">手机</th>
					<th class="table_content" style="width:10%;">籍贯</th>
					<th class="table_content" style="width:20%;">是否为管理员</th>
					<th class="table_content" style="width:10%;">操作</th>
				</tr>
				<%
					for(User u : list_users) {
				%>
				<tr class="tablerow">
					<td class="table_content" style="width:20%;">
						<p>
							<%=u.getUsername()%>
						</p>
					</td>
					<td class="table_content" style="width:20%;">
						<p>
							<%=u.getPassword()%>
						</p>
					</td>
					<td class="table_content" style="width:20%;">
						<p>
							<%=u.getPhone()%>
						</p>
					</td>
					<td class="table_content" style="width:10%;">
						<p>
							<%=u.getPlace()%>
						</p>
					</td>
					<td class="table_content" style="width:20%;">
						<p>
							<%=u.isAdmin()%>
						</p>
					</td>
					<td class="table_content" style="width:10%;">
						<form style="margin: 0" action="delete" method="get"
						      onsubmit="return confirm('确认删除用户'.concat('<%=u.getUsername()%>'))">
							<input name="ObjectInput" type="hidden"
							       value="<%=u.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="删除"/>
						</form>
						<form style="margin: 0" action="modify" method="get">
							<input name="ObjectInput" type="hidden"
							       value="<%=u.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="修改"/>
						</form>
						<form style="margin: 0" action="checkUserInfo"
						      method="get">
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
			Tractor[] list_tractors = MyDataBase.GetAllTractors();
		%>
		<p class="righttitle">
			总共个数： <%=list_tractors.length%>
		</p>
		<form class="addButtonForm" action="addnew" method="post">
			<input class="addButton" type="submit" value="添加新农机"/>
		</form>
		<div class="div_table">
			<table class="tractorstable">
				<tr>
					<th class="nametd">名称</th>
					<th class="descriptiondtd">描述</th>
					<th class="powertd">马力</th>
					<th class="pricetd">价格</th>
					<th class="oprationtd">操作</th>
				</tr>
				<%
					for(Tractor t : list_tractors) {
				%>
				<tr class="tablerow">
					<td class="nametd">
						<%=t.getName()%>
					</td>
					<td class="descriptiondtd" id="descriptioncontent">
						<%=t.getDescription()%>
					</td>
					<td class="powertd">
						<%=t.getPower()%>
					</td>
					<td class="pricetd">
						<%=t.getPrice()%>
					</td>
					<td class="oprationtd">
						<form style="margin: 0" action="delete" method="post"
						      onsubmit="return confirm('确认删除农机'.concat('<%=t.getName()%>'))">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="删除"/>
						</form>
						<form style="margin: 0" action="modify" method="post">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="修改"/>
						</form>
					</td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>
	<%
	} else if(type == PageType.CheckUser) {
	%>
	<div style="overflow-y: scroll;height: 100%;">
		<p style="text-align: center;font-size: xx-large; color: lightcyan;">
			查看用户农机信息：<%=check_user.getUsername()%>
		</p>
		<table style="width:100%; table-layout:fixed; word-wrap:break-word; padding:0;">
			<tr>
				<th style="width:10%; text-align:center; font-size:large; color: lightcyan;">
					编号
				</th>
				<th style="width:20%; text-align:center; font-size:large; color: lightcyan;">
					名称
				</th>
				<th style="width:50%; text-align:center; font-size:large; color: lightcyan;">
					描述
				</th>
				<th style="width:10%; text-align:center; font-size:large; color: lightcyan;">
					马力
				</th>
				<th style="width:10%; text-align:center; font-size:large; color: lightcyan;">
					价格
				</th>
			</tr>
			<%
				for(Tractor t : MyDataBase.FindUserOwned(check_user)) {
			%>
			<tr>
				<td style="width:10%; text-align:center; font-size:large; color: lightcyan;">
					<%=t.getId()%>
				</td>
				<td style="width:20%; text-align:center; font-size:large; color: lightcyan;">
					<%=t.getName()%>
				</td>
				<td style="width:50%; text-align:center; font-size:large; color: lightcyan;">
					<%=t.getDescription()%>
				</td>
				<td style="width:10%; text-align:center; font-size:large; color: lightcyan;">
					<%=t.getPower()%>
				</td>
				<td style="width:10%; text-align:center; font-size:large; color: lightcyan;">
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
	<script>
        function ShowUsers() {
            document.getElementById("_usersdiv").style.display = "initial";
            document.getElementById("_tractorsdiv").style.display = "none";
            document.getElementById("showAllUsersButton").value = "· 查看所有用户 ·";
            document.getElementById("showAllTractorsButton").value = "查看所有农机";
            sessionStorage.setItem('key_page', 'user');
        }

        function ShowTractors() {
            document.getElementById("_tractorsdiv").style.display = "initial";
            document.getElementById("_usersdiv").style.display = "none";
            document.getElementById("showAllUsersButton").value = "查看所有用户";
            document.getElementById("showAllTractorsButton").value = "· 查看所有农机 ·";
            sessionStorage.setItem('key_page', 'tractor');
        }

        let _page = sessionStorage.getItem('key_page');
        if (_page === 'user') {
            ShowUsers();
        } else if (_page === 'tractor') {
            ShowTractors();
        } else {
            ShowTractors();
        }
	</script>
</div>
</body>
</html>
