<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String title = (String) request.getAttribute("title");
    title = title == null ? "Title" : title;

    String display = (String) request.getAttribute("display");
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
</body>
</html>
