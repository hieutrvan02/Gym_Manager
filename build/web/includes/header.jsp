<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./access/css/base.css">
        <link rel="stylesheet" href="./access/css/main.css">
        <link rel="stylesheet" href="./access/font/fontawesome-free-6.2.0/css/all.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;1,300&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="app">
            <header class="header">
                <div class="grid">
                    <div class="header_nav">
                        <input type="checkbox" class="nav__input" name="" id="nav__input" />
                        <div class="header_nav-logo col-md-3">
                            <a href="home.jsp" class="log-link">
                                <img class="logo-img" src="./access/img/logo.png" alt="Logo">
                            </a>
                        </div>
                        <ul class="header_nav-list col-md-9">
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>CLB</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>DỊCH VỤ</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>LỊCH HỌC</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>CHÍNH SÁCH GIÁ</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>TIN TỨC</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="" class="item-link">
                                    <span>KHUYẾN MÃI</span>
                                </a>
                            </li>
                            <li class="header_nav-item--account">
                                <a href="signup.jsp" class="item-link-register">
                                    <span>ĐĂNG KÍ</span>
                                </a>
                                <a href="LoginServlet" class="item-link-login">
                                    <span>ĐĂNG NHẬP</span>
                                </a>
                            </li>
                            <li class="header_nav-item">
                                <a href="userInfor.jsp?id=mldbto">To user infor</a>
                            </li>
                            <
                        </ul>
                        <!-- Responsive navbar -->
                        <label for="nav__input" class="nav__bar-btn">
                            <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars"
                                 class="svg-inline--fa fa-bars fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 448 512">
                            <path fill="currentColor"
                                  d="M16 132h416c8.837 0 16-7.163 16-16V76c0-8.837-7.163-16-16-16H16C7.163 60 0 67.163 0 76v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16zm0 160h416c8.837 0 16-7.163 16-16v-40c0-8.837-7.163-16-16-16H16c-8.837 0-16 7.163-16 16v40c0 8.837 7.163 16 16 16z">
                            </path>
                            </svg>
                        </label>
                        <label for="nav__input" class="nav__overlay">
                        </label>
                        <nav class="nav__mobile">
                            <ul class="nav__mobile-list">
                                <li class="nav__mobile-item"><a href="">CLB</a></li>
                                <li class="nav__mobile-item"><a href="">DỊCH VỤ</a></li>
                                <li class="nav__mobile-item"><a href="">LỊCH HỌC</a></li>
                                <li class="nav__mobile-item"><a href="">KHUYẾN MÃI</a></li>
                                <li class="nav__mobile-item--account">
                                    <a href="" class="item-link-register">ĐĂNG KÍ</a>
                                    <a href="" class="item-link-login">ĐĂNG NHẬP</a>
                                </li>
                            </ul>
                            <div class="nav__mobile-btn">
                                <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times"
                                     class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg"
                                     viewBox="0 0 352 512">
                                <path fill="currentColor"
                                      d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z">
                                </path>
                                </svg>
                            </div>
                        </nav>
                    </div>
                </div>
            </header>
        </div>
    </body>
</html>
