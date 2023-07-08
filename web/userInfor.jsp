<%-- 
    Document   : userInfor
    Created on : Mar 8, 2023, 11:12:08 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <body>
        <jsp:useBean id="branchList" class="Model.BranchList"/>
        <c:set var="branchs" value="${branchList.result}"/>
        <div class="container" style="padding-top: 100px; font-size: large; padding-bottom: 20px">
            <div class="container-form">
                <h1>Gymer Information </h1>
                <hr>
                <jsp:useBean id="inforList" class="Model.InforList"/>
                <c:set var="infor" value="${inforList.getInforById(param.id)}"/>
                <c:choose>
                    <c:when test="${not empty infor.getImgPath()}">
                        <img src="${infor.imgPath}" class="card-img-top" style="width: 150px; height: 150px;
                             display: block;" alt="Card image cap">
                    </c:when>
                    <c:otherwise>
                        <img src="./access/img/avatar-user.webp" class="card-img-top" style="width: 150px; height: 150px;
                             display: block;" alt="Card image cap">
                    </c:otherwise>
                </c:choose>
                <div class="upload-img">
                    <form method="post" action="FileUploadServlet" enctype="multipart/form-data">
                        <input type="file" name="file" />
                        <input type="submit" value="Upload"/>
                    </form>
                </div>
                <form action="UpInforServlet?id=${param.id}" method="post">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h2 class="card-title">Profile</h2>
                        </div>
                        <ul class="list-group list-group-flush ">
                            <li class="list-group-item">Fullname: <input type="text" name="name" value="${infor.name}"></li>
                            <li class="list-group-item">Date of birth: <input type="date" name="dob" value="${infor.dob}"></li>
                            <li class="list-group-item">Gender:
                                <select id="gender" name="gender">
                                    <option value="Male" <c:if test="${fn:contains(infor.gender, 'Male')}">selected</c:if>>Male</option>
                                    <option value="Female" <c:if test="${fn:contains(infor.gender, 'Female')}">selected</c:if>>Female</option>
                                    </select>
                                </li>
                                <li class="list-group-item">Phone number: <input type="text" name="phone" value="${infor.phone}"></li>
                            <li class="list-group-item">ID Card: <input type="text" name="id_card" value="${infor.id_card}"></li>
                            <li class="list-group-item">Address: <input type="text" name="address" value="${infor.address}"></li>
                            <li class="list-group-item">Email: <input type="email" name="email" value="${infor.email}"></li>
                            <li class="list-group-item">Chi nhánh: <br>
                                <div class="dropdown">
                                    <div class="select">
                                        <span>
                                            <c:forEach var="o" items="${branchs}">
                                                <c:if test="${infor.id_branch.equals(o.id)}">${o.address}</c:if>
                                            </c:forEach>
                                        </span>
                                        <i class="fa fa-chevron-left"></i>
                                    </div>
                                    <input type="hidden" name="id_branch" value="${infor.id_branch}">
                                    <ul class="dropdown-menu">
                                        <c:forEach var="o" items="${branchs}">
                                            <li id="${o.id}">${o.address}</li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </li>
                            <li class="list-group-item">Remaining trainer days: <input type="date" name="maxDate" value="${infor.maxDate}" <c:if test="${fn:contains(cookie.type.value, 'user')}">readonly</c:if>></li>
                            </ul>
                        </div>
                        <hr>
                        <div style="display: flex; justify-content: space-between;">
                            <input type="submit" value="Edit" name="editInfor" class="btn btn-success " 
                                   style="font-size: 20px" onclick="return confirm('Are you sure you want to edit this user?');"/>
                        </div>
                    </form>
                </div>
            </div>
        <%@include file="footer.jsp" %>
        <script>
            /*Dropdown Menu*/
            $('.dropdown').click(function () {
                $(this).attr('tabindex', 1).focus();
                $(this).toggleClass('active');
                $(this).find('.dropdown-menu').slideToggle(300);
            });
            $('.dropdown').focusout(function () {
                $(this).removeClass('active');
                $(this).find('.dropdown-menu').slideUp(300);
            });
            $('.dropdown .dropdown-menu li').click(function () {
                $(this).parents('.dropdown').find('span').text($(this).text());
                $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
            });
            /*End Dropdown Menu*/

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
