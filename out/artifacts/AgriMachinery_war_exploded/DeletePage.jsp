<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>DeletePage</title>
</head>
<script>
    let loc = location.href;
    let n1 = loc.length;
    let n2 = loc.indexOf("=");
    let id = decodeURI(loc.substr(n2+1, n1-n2));
    alert(id);
</script>
<body>
<%
	Object o = request.getSession().getAttribute("modify_delete_target");
	out.print(o);
%>
</body>
</html>
