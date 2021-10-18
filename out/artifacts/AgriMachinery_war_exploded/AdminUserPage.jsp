<%@ page import="model.User" %>
<%@ page import="database.MyDataBase" %>
<%@ page import="model.Tractor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link type="text/css" href="AdminUserPage.css" rel="stylesheet">
<head>
    <title>Admin</title>
</head>
<%
    User user = (User) request.getAttribute("user");
%>
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
        </table>
        <div id="bottomrigths">
            <table class="btmtable">
                <tr>
                    <td>
                        <form>
                            <input class="menuButton" type="submit"
                                   value="修改登录信息"/>
                        </form>
                    </td>
                    <td>
                        ·
                    <td/>
                    <td>
                        <form>
                            <input class="menuButton" type="submit" value="注销"/>
                        </form>
                    </td>
                </tr>
            </table>
            @All Rights Reserved
            <br/>
            RainbowWolfer
        </div>
    </div>
    <div class="right">
        <%
            List<Tractor> list = MyDataBase.GetAllTractors();
        %>
        <p class="righttitle">
            总共个数： <%=list.size()%>
        </p>
        <table class="tractorstable">
            <tr>
                <th>名称</th>
                <th>描述</th>
                <th>价格</th>
            </tr>
            <%
                for(Tractor t : list) {
            %>
            <tr>
                <td>
                    <%=t.getName()%>
                </td>
                <td class="descriptiontd">
                    <div class="descriptiondiv">
                        <%=t.getDescription()%>
                    </div>
                </td>
                <td>
                    <%=t.getPrice()%>
                </td>
            </tr>
            <% }
            %>
        </table>
    </div>
</div>
</body>
</html>
