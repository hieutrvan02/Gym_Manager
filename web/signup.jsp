<%-- 
    Document   : sigup
    Created on : Mar 6, 2023, 9:11:16 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <body>

        <main>
            <div class="noi-dung-signup">
                <div class="noi-dung-signup1">
                    <form action="SignupServlet" method="post" id="form-id">
                        <div class="form">
                            <h2>Đăng ký</h2>
                            <p class="text-danger" style="font-size: 16px;">${mess}</p>
                            <div class="input-form form-group">
                                <span>Tên tài khoản</span>
                                <input id="userName" rules="required" type="text" name="userName"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Tên Người Dùng</span>
                                <input id="fullName" rules="required" type="text" name="fullName"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Mật Khẩu</span>
                                <input id="password" rules="required|min:6" type="password" name="pass"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Nhập lại mật Khẩu</span>
                                <input id="password_confirmation" type="password" name="confirm-password"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Cơ sở tập</span><br>
                                <jsp:useBean id="branchList" class="Model.BranchList"/>
                                <div class="dropdown">
                                    <div class="select">
                                        <span>Chọn cơ sở tập</span>
                                        <i class="fa fa-chevron-left"></i>
                                    </div>
                                    <input type="hidden" name="id_branch">
                                    <ul class="dropdown-menu">
                                        <c:forEach var="o" items="${branchList.result}">
                                            <li id="${o.id}">${o.address}</li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Số điện thoại</span>
                                <input id="phone" type="phone" name="phone"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Email</span>
                                <input id="email" rules="required|email" type="email" name="email"/>
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form">
                                <input type="submit" value="Đăng ký"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <script type="text/javascript" src="${pageContext.request.contextPath}/access/js/validator.js"></script>
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


            $('.dropdown-menu li').click(function () {
                var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
                        msg = '<span class="msg">Hidden input value: ';
                $('.msg').html(msg + input + '</span>');
            });

//             Mong muốn của chúng ta
            Validator({
                form: '#form-id',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#userName'),
                    Validator.isRequired('#fullName'),
                    Validator.isRequired('#email'),
                    Validator.isEmail('#email'),
                    Validator.isRequired('#phone'),
                    Validator.isPhone('#phone'),
                    Validator.minLength('#password', 6),
                    Validator.isRequired('#password_confirmation'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-id #password').value;
                    }, 'Mật khẩu nhập lại không chính xác')
                ]
            })
        </script>
    </body>
</html>
