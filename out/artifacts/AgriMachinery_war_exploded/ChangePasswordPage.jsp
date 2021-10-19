<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link type="text/css" href="ChangePasswordPage.css" rel="stylesheet">
<head>
    <title>Change Your Password</title>
</head>
<%
    String hint = (String) request.getAttribute("hint");
    hint = hint == null ? "" : hint;
%>
<body>
<h1 class="hint">
    <%=hint%>
</h1>
<h1>修改密码</h1>
<h2>当前用户：
    <%
        User u = (User) request.getSession().getAttribute("user");
        if (u != null) {
            out.print(u.getUsername());
        }
    %>
</h2>
<div>
    <form action="submitnewpassword" method="post">
        <table>
            <tr>
                <th>原来密码：</th>
                <td>
                    <input name="originalInput" type="text"/>
                </td>
            </tr>
            <tr>
                <th>新密码：</th>
                <td>
                    <input name="newInput" type="text"/>
                </td>
            </tr>
            <tr>
                <th>确认密码：</th>
                <td>
                    <input name="confirmInput" type="text"/>
                </td>
            </tr>
        </table>
        <br/>
        <input type="submit" value="确认修改"/>
    </form>
</div>
</body>
</html>
