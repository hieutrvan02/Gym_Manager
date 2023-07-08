<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="header.jsp" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <jsp:useBean id="userList" scope="session" class="Model.InforList"/>
        <c:set var="page" value="${param.page}"/>
        <c:if test="${page == null}">
            <c:set var="page" value="1"/>
        </c:if>
        <c:set var="pageSize" value="5"/>
        <c:set var="listUser" value="${searchList}"/>
        <c:set var="maxPage" value="${userList.getMaxPage(pageSize, searchList.size())}"/>

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
                    <c:forEach var="gymer" items="${listUser}" begin="${(page-1)*pageSize}" end="${page*pageSize-1}">
                        <form action="ViewUserServlet" method="post">
                            <c:if test="${not empty gymer.name}">

                                <li class="list-group-item" style="padding: 20px 15px; display: flex; justify-content: space-between">

                                    <span style="line-height: 42px; font-size: 20px;">
                                        ${gymer.name}
                                    </span>

                                    <div>
                                        <a type="submit" class="btn btn-info" style="color:white; font-size: 20px"
                                           href="userInfor.jsp?id=${gymer.id}">Thông tin</a>
                                        <a type="submit" class="btn btn-warning" style="color:white; font-size: 20px"
                                           href="DeleteServlet?id=${gymer.id}">Xóa</a>
                                    </div>
                                </li>
                            </c:if>
                        </form>
                    </c:forEach>
                    <c:if test="${not empty listUser}">
                        <div>
                            <ul class="pagination">
                                <c:if test="${page>1}">
                                    <li><input type="hidden"><a href="searchList.jsp"><<</a></li>
                                    <li><input type="hidden"><a href="searchList.jsp?page=${page!=1?page-1:1}"><</a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${maxPage}" var="i">
                                    <li><a class="${page == i?'active':''}" href="searchList.jsp?page=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${page<maxPage}">
                                    <li><input type="hidden"><a href="searchList.jsp?page=${page!=maxPage?page+1:maxPage}">></a></li>
                                    <li><input type="hidden"><a href="searchList.jsp?page=${maxPage}">>></a></li>
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

