<%-- 
    Document   : signupAdmin
    Created on : Mar 16, 2023, 2:45:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<html lang="en">
    <body>
        <main>
            <div class="noi-dung-signup">
                <div class="noi-dung-signup1">
                    <form action="AdminCreateServlet" method="post" id="form-id">
                        <div class="form">
                            <h2>Sign up</h2>
                            <h4 class="text-danger">${mess}</h4>
                            <div class="input-form form-group">
                                <span>Tên Người Dùng</span>
                                <input id="userName" rules="required" type="text" name="userName"/>
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
            console.log("ababababab");
            test();
            //             Mong muốn của chúng ta
            Validator({
                form: '#form-id',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#userName'),
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
