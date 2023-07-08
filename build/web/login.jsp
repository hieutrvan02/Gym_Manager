<%-- 
    Document   : login
    Created on : Mar 6, 2023, 9:08:50 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <body>
        <form action="LoginServlet" method="post" id="loginForm">
            <div class="app">
                <div class="noi-dung">
                    <div class="noi-dung1">
                        <div class="form">
                            <h2>Đăng nhập</h2>
                            <p class="text-danger">${mess}</p>
                            <div class="input-form form-group">
                                <span>Tài khoản</span>
                                <input id="userName" type="text" name="name">
                                <span class="form-message"></span>
                            </div>
                            <div class="input-form form-group">
                                <span>Mật Khẩu</span>
                                <input id="password" type="password" name="password">
                                <span class="form-message"></span>
                            </div>
                            <div class="nho-dang-nhap form-group">
                                <label><input type="checkbox" name="remember"> Nhớ Đăng Nhập</label>
                            </div>
                            <div class="check-admin form-group">
                                <label><input type="checkbox" name="admin"> Bạn có phải admin không?</label>
                            </div>
                            <div class="input-form form-group">
                                <input type="submit" value="Đăng Nhập">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="./access/js/validator.js"></script>
        <script>

            // Mong muốn của chúng ta
            Validator({
                form: '#loginForm',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#userName'),
                    Validator.minLength('#password', 6),
                ]
            })
        </script>
    </body>
</html>
