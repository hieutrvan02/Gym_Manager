<%-- 
    Document   : changePassword
    Created on : Mar 13, 2023, 8:14:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="app">
            <div class="noi-dung">
                <div class="noi-dung1">
                    <div class="form">
                        <h2>Change password</h2>
                        <form action="ChangePasswordServlet" method="post" id="changePasswordForm">
                            <p class="text-danger">${mess}</p>
                            <div class="input-form form-group">
                                <span>Mật khẩu cũ</span>
                                <input type="password" name="password" id="password">
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Mật khẩu mới</span>
                                <input type="password" name="new-password" id="new-password">
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Nhập lại mật khẩu</span>
                                <input type="password" name="password_confirmation" id="password_confirmation">
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form">
                                <input type="submit" value="Xác nhận">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="./access/js/validator.js"></script>
        <script>
            // Mong muốn của chúng ta
            Validator({
                form: '#changePasswordForm',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.minLength('#password', 6),
                    Validator.minLength('#new-password', 6),
                    Validator.isRequired('#password_confirmation'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#changePasswordForm #new-password').value;
                    }, 'Mật khẩu nhập lại không chính xác')
                ]
            })
        </script>
    </body>
</html>
