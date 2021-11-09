<%@ page import="model.Tractor" %>
<%@ page import="database.MyDataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" type="text/css" href="ModifyUser.css"/>
<%
	Tractor tractor = (Tractor) request.getAttribute("modify_target");
%>
<head>
	<title>
		<%=tractor == null ? "添加新农机" : "修改农机"%>
	</title>
</head>
<body>
<div>
	<h1>
		<%=tractor == null ? "添加新农机" : "修改农机：" + tractor.getName()%>
	</h1>
	<form action="submitmodify" method="post"
	      onsubmit="return confirm('确认提交');">
		<table>
			<tr>
				<th>编号：</th>
				<td>
					<%=tractor == null ? "" : tractor.getId()%>
				</td>
			</tr>
			<tr>
				<th>名称：</th>
				<td>
					<input name="nameInput" type="text"
					       value='<%=tractor == null ? "" : tractor.getName()%>'/>
				</td>
			</tr>
			<tr>
				<th>描述：</th>
				<td>
					<textarea name="descriptionInput"
					          style="height: 100px"><%=tractor == null ? "" : tractor.getDescription()%></textarea>
					<%--<input name="descriptionInput" style="height: 100px;"
					       type="text"
					       value='<%=tractor == null ? "" : tractor.getDescription()%>'/>--%>
				</td>
			</tr>
			<tr>
				<th>马力：</th>
				<td>
					<input name="powerInput" type="number"
					       value='<%=tractor == null ? "" : tractor.getPower()%>'/>
				</td>
			</tr>
			<tr>
				<th>价格：</th>
				<td>
					<input name="priceInput" type="number"
					       value='<%=tractor == null ? "" : tractor.getPrice()%>'/>
				</td>
			</tr>
		</table>
		<input name="tractor_id" type="hidden"
		       value='<%=tractor != null ? tractor.getId() : -1%>'/>
		<input type="submit" value="确认"/>
	</form>
</div>
</body>
</html>
