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
	<h2 id="hint" style="color: red"></h2>
	<h1>
		<%=tractor == null ? "添加新农机" : "修改农机：" + tractor.getName()%>
	</h1>
	<form action="submitmodify" method="post"
	      onsubmit="return OnSubmit();">
		<table>
			<tr>
				<th>编号：</th>
				<td>
					<%=tractor == null ? MyDataBase.GetTractorNextID() : tractor.getId()%>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>名称：</th>
				<td>
					<input name="nameInput" id="nameInput" type="text"
					       value='<%=tractor == null ? "" : tractor.getName()%>'
					       oninput="OnChanged(this,'line1')"/>
				</td>
				<td id="line1">*</td>
			</tr>
			<tr>
				<th>描述：</th>
				<td>
					<textarea name="descriptionInput" id="descriptionInput"
					          style="height:100px; border:2px 2px 2px 2px; padding:1px 2px 1px 2px;"
					          oninput="OnChanged(this,'line2')"><%=tractor == null ? "" : tractor.getDescription()%></textarea>
				</td>
				<td id="line2">*</td>
			</tr>
			<tr>
				<th>马力：</th>
				<td>
					<input name="powerInput" id="powerInput" type="number"
					       value='<%=tractor == null ? "" : tractor.getPower()%>'
					       oninput="OnChanged(this,'line3')"/>
				</td>
				<td id="line3">*</td>
			</tr>
			<tr>
				<th>价格：</th>
				<td>
					<input name="priceInput" id="priceInput" type="number"
					       value='<%=tractor == null ? "" : tractor.getPrice()%>'
					       oninput="OnChanged(this,'line4')"/>
				</td>
				<td id="line4">*</td>
			</tr>
		</table>
		<input name="tractor_id" type="hidden"
		       value='<%=tractor != null ? tractor.getId() : -1%>'/>
		<input type="submit" value="确认"/>
	</form>
</div>
<script>
    function OnSubmit() {
        let name = document.getElementById("nameInput").value;
        let description = document.getElementById("descriptionInput").value;
        let power = document.getElementById("powerInput").value;
        let price = document.getElementById("priceInput").value;

        if (name.length === 0 || description.length === 0 || power.length === 0 || price.length === 0) {
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
