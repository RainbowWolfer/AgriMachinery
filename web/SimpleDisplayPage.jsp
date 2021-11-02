<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	String title = (String) request.getAttribute("title");
	title = title == null ? "Title" : title;

	String display = (String) request.getAttribute("display");
	String buttonContent = (String) request.getAttribute("buttonContent");
	String form_action = (String) request.getAttribute("form_action");
	String form_methods = (String) request.getAttribute("form_methods");
%>
<style type="text/css" rel="stylesheet">
	div {
		text-align: -webkit-center;
	}
</style>
<head>
	<title><%=title%>></title>
</head>
<body>
<div>
	<%=display%>
</div>
<div>
	<form action="<%=form_action%>" method="<%=form_methods%>">
		<input type="submit" value="<%=buttonContent%>"/>
	</form>
</div>
</body>
</html>
