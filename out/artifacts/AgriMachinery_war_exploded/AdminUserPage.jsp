<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link type="text/css" href="AdminUserPage.css" rel="stylesheet">
<head>
    <title>Admin</title>
</head>
<body>
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
                        当前管理员：RainbowWolfer
                    </p>
                    <p class="info" style="margin: 0px 0px 60px 0px;">
                        洛阳理工学院 - 农机管理
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <form action="userpage" method="post">
                        <input class="menuButton" type="submit" value="· 个人信息 ·"/>
                    </form>
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
