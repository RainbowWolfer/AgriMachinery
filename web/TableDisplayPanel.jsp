<%@ page import="java.util.List" %>
<%@ page import="database.MyDataBase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	String title = "Table";
%>
<head>
	<title>
		<%=title%>
	</title>
</head>
<body>
<div>
	<form action="TableDisplay" method="post">
		<input type="submit" value="返回"/>
	</form>
</div>
<div>
	<%
		MyDataBase.NonQuery("INSERT INTO tractors(t_name, t_description, t_power, t_price) VALUES ('iukjhg','2354trgf',123,231.21);");
		List<List<String>> table = MyDataBase.Query("select * from users");
		if(table != null) {
	%>
	<table>
		<%
			for(List<String> line : table) {
		%>
		<tr>
			<%
				for(String data : line) {
			%>
			<td>
				<%=data%>
			</td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
	<%
	} else {
	%>
	<p style="color: red;font-size: xx-large">ERROR</p>
	<%
		}
	%>
</div>
</body>
</html>
