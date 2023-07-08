<%--
    Document   : listUser
    Created on : Mar 9, 2023, 3:46:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="userList" scope="session" class="Model.InforList"/>
        <c:set var="page" value="${param.page}"/>
        <c:if test="${page == null}">
            <c:set var="page" value="1"/>
        </c:if>
        <c:set var="pageSize" value="5"/>
        <c:set var="listUser" value="${userList.getUserWithPage(page)}"/>
        <c:set var="maxPage" value="${userList.getMaxPage(pageSize, userList.getUsers().size())}"/>

        <c:set var="users" value="${userList.getUsers()}"/>
        <div class="container" style="padding-top: 100px">
            <a type="submit" style="color:black ; font-size: 20px; float: right" href="signupAdmin.jsp" class="btn btn-default">Tạo
                admin</a>
            <div class="container-form">
                <h1>Danh sách thành viên</h1>
                <form action="SearchServlet?index=1" method="post">
                    <input class="searchBox" type="text" name="search" required>
                    <input type="submit" value="Tìm kiếm">
                </form>
                <hr>
                <ul class="list-group">
                    <c:forEach var="gymer" items="${listUser}">
                        <form action="ViewUserServlet" method="post">
                            <c:if test="${not empty gymer.name}">

                                <li class="list-group-item" style="padding: 20px 15px; display: flex; justify-content: space-between">

                                    <span style="line-height: 42px; font-size: 20px;">
                                        ${gymer.name}
                                    </span>

                                    <div>
                                        <a type="submit" class="btn btn-info" style="color:white; font-size: 20px"
                                           href="userInfor.jsp?id=${gymer.id}">Thông tin</a>
                                        <a href="DeleteServlet?id=${gymer.id}" class="btn btn-warning" style="color:white; font-size: 20px" 
                                           onclick="return confirm('Are you sure you want to delete this user?');">Remove</a>
                                    </div>
                                </li>
                            </c:if>
                        </form>
                    </c:forEach>
                    <c:if test="${not empty listUser}">
                        <div>
                            <ul class="pagination">
                                <c:if test="${page>1}">
                                    <li><input type="hidden"><a href="listUser.jsp"><<</a></li>
                                    <li><input type="hidden"><a href="listUser.jsp?page=${page!=1?page-1:1}"><</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                    <li><a class="${page == i?'active':''}" href="listUser.jsp?page=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${page<maxPage}">
                                    <li><input type="hidden"><a href="listUser.jsp?page=${page!=maxPage?page+1:maxPage}">></a></li>
                                    <li><input type="hidden"><a href="listUser.jsp?page=${maxPage}">>></a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </c:if>
                </ul>
            </div>
        </div>
        <script>
            window.addEventListener("pageshow", function (event) {
                var historyTraversal = event.persisted ||
                        (typeof window.performance != "undefined" &&
                                window.performance.navigation.type === 2);
                if (historyTraversal) {
                    // Handle page restore.
                    window.location.reload();
                }
            });
        </script>
    </body>
</html>
