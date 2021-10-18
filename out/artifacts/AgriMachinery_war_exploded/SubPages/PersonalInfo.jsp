<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link type="text/css" href="PersonalInfo.css" rel="stylesheet">
<%
    String u = request.getParameter("username");
    String p = request.getParameter("password");
    String a = request.getParameter("isadmin");
%>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <table>
        <tr>
            <th>用户名：</th>
            <td>
                <%out.print(u);%>
            </td>
        </tr>
        <tr>
            <th>密码：</th>
            <td>
                <%out.print(p);%>
            </td>
        </tr>
        <tr>
            <th>管理员权限：</th>
            <td>
                <%out.print(a);%>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
