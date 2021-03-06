<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
<%@ page import="java.util.List" %>
<%@ page import="utility.PageType" %>
<%@ page import="model.Tractor" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<html>
<style>

	body {
		width: 100vw;
		height: 100vh;
		justify-content: center;
		display: flex;
		align-items: center;
		margin: 0;
	}

	.left {
		width: 30%;
		height: 100%;
		background-color: slateblue;
		position: relative;
	}

	.right {
		width: 70%;
		height: 100%;
		background-color: darkslateblue;
		position: relative;
	}

	#avatar {
		border-radius: 50%;
		width: 200px;
		height: 200px;
		margin: 0 0 20px 0;
	}

	.infotable td {
		text-align: -webkit-center;
	}

	.infotable {
		width: 100%;
		margin: 30px 0 0 0;
	}

	.infotd {
		color: lightcyan;
		font-size: 20px;
		padding: 5px 0 5px 0;
	}

	.btm {
		width: 100%;
		position: absolute;
		bottom: 0;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		text-align: center;
	}

	.menuButton {
		background-color: transparent;
		color: lightcyan;
		border: 0;
		font-size: 24px;
	}

	.menuButton:hover {
		cursor: pointer;
		color: aqua;
	}

	.righttitle {
		text-align: center;
		color: lightcyan;
		font-size: x-large;
	}

	.tractorstable {
		width: 100%;
		table-layout: fixed;
		word-wrap: break-word;
		padding: 0px 0px 0px 0px;
	}

	.div_table {
		overflow-y: scroll;
		height: 80%;
	}

	.tractorstable * {
		color: lightcyan;
	}

	.descriptiondiv {

	}

	.descriptionp {

	}

	.descriptiondtd {
		width: 50%;
		font-size: x-large;
		text-align: center;
	}

	#descriptioncontent {
		text-align: left;
		font-size: medium;
		padding: 10px 0 10px 0;
	}

	.nametd {
		width: 20%;
		font-size: x-large;
		text-align: center;
		padding: 15px;
	}

	.pricetd {
		width: 10%;
		font-size: x-large;
		text-align: center;
	}

	.powertd {
		width: 10%;
		font-size: x-large;
		text-align: center;
	}

	.oprationtd {
		width: 10%;
		font-size: x-large;
		text-align: center;
	}

	.usersDIV {
		display: none;
		position: relative;
	}

	.tractorsDIV {
		display: initial;
	}

	.oprationButton {
		background-color: cadetblue;
		font-size: 18px;
	}

	.oprationButton:hover {
		cursor: pointer;
	}

	.addButtonForm {
		text-align: center;
	}

	.addButton {
		font-size: 18px;
		background-color: cadetblue;
		color: lightcyan;
	}

	.addButton:hover {
		cursor: pointer;
	}

	.oprationform {
		margin: 0;
	}

	.showPageButton {
		background-color: transparent;
		color: lightcyan;
		font-size: 24px;
		outline: aqua;
		border: 2px;
	}

	.showPageButton:hover {
		cursor: pointer;
		color: aqua;
	}

	.tablerow {
		background-color: transparent;
	}

	.tablerow:hover {
		background-color: rebeccapurple;
	}

</style>
<%
	User user = (User) request.getSession().getAttribute("user");
%>

<head>
	<meta charset="UTF-8">
	<title>User</title>
	<script>
        let entrace_alert = '<%=session.getAttribute("entrace_alert")%>';
        if (entrace_alert !== 'null') {
            alert(entrace_alert);
            sessionStorage.setItem("entrace_alert", "");
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
					???????????????<%=user == null ? "" : user.getUsername()%>
				</td>
			</tr>
			<tr>
				<td class="infotd" style="padding: 0 0 40px 0">
					?????????????????? - ????????????
				</td>
			</tr>
		</table>
	</div>
	<div class="btm">
		<table>
			<tr>
				<td>
					<form action="userpage" method="post">
						<input class="menuButton" type="submit" value="??????????????????"/>
					</form>
				</td>
				<td><p class="menuButton">??</p></td>
				<td>
					<form action="userpage" method="get">
						<input class="menuButton" type="submit" value="??????"/>
					</form>
				</td>
			</tr>
		</table>
		<p>@All Rights Reserved<br/>RainbowWolfer</p>
	</div>
</div>
<div class="right">
	<div class="tractorsDIV" id="_tractorsdiv">
		<%
			//			assert user != null;//what does it do?
			List<Tractor> list_tractors = MyDataBase.FindUserOwned(user);
		%>
		<p class="righttitle">
			??????????????? <%=list_tractors.size()%>
		</p>
		<div class="div_table">
			<table class="tractorstable">
				<tr>
					<th class="nametd">??????</th>
					<th class="descriptiondtd">??????</th>
					<th class="pricetd">??????</th>
					<th class="powertd">??????</th>
					<th class="oprationtd">??????</th>
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
					<td class="pricetd">
						<%=t.getPrice()%>
					</td>
					<td class="powertd">
						<%=t.getPower()%>
					</td>
					<td class="oprationtd">
						<form style="margin: 0" action="delete" method="post"
						      onsubmit="return confirm('??????????????????'.concat('<%=t.getName()%>'))">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="??????"/>
						</form>
						<form style="margin: 0" action="modify" method="post">
							<input name="ObjectInput" type="hidden"
							       value="<%=t.getId()%>"/>
							<input class="oprationButton" type="submit"
							       value="??????"/>
						</form>
					</td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>
</div>
</body>
</html>