<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<link type="text/css" href="NormalUserPage.css" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>User</title>
</head>
<body><%
    User user = (User) request.getAttribute("user");
%>

<div class="container">
    <div class="left">
        <table class="mytable">
            <tr>
                <th>
                    <a>
                        <img id="avatar" id="myimg"
                             src="resources/testgif.gif"/>
                    </a>
                </th>
            </tr>
            <tr>
                <td>
                    <p class="info" style="margin: 30px 0px 0px 0px;">
                        当前用户：
                        <%
                            if(user != null) {
                                out.println(user.getUsername());
                            }
                        %>
                    </p>
                    <p class="info" style="margin: 0px 0px 60px 0px;">
                        洛阳理工学院 - 农机管理
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="menuitem" href="" target="targetframe">
                        · 个人信息 ·
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="menuitem" href="" target="targetframe">
                        · 修改登录信息 ·
                    </a>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="menuitem" href="" target="targetframe">
                        · 注销 ·
                    </a>
                </td>
            </tr>
        </table>
        <div id="bottomrigths">
            All Rights Reserved
            <br/>
            @RainbowWolfer
        </div>
    </div>
    <div class="right">
        <iframe>

        </iframe>
    </div>
</div>
</body>
</html>