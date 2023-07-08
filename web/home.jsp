<%-- 
    Document   : home
    Created on : Mar 6, 2023, 9:06:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <body>
        <div class="app">
            <main>
                <div class="main-wrapper" style="padding-top: 74px;">
                    <div class="app__container">
                        <div class="slide">
                            <img class="slide-img" src="./access/img/slide-pic1.png" alt="">
                            <img class="slide-img" src="./access/img/slide-pic2.jpg" alt="">

                            <button class="slide__move-button--prev slick-arrow" onclick="plusDivs(-1)">
                                <img src="./access/img/arrow-left.svg" alt="">
                            </button>
                            <button class="slide__move-button--next slick-arrow" onclick="plusDivs(-1)">
                                <img src="./access/img/arrow-r.svg" alt="">
                            </button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="footer.jsp" %>
        <script src="./access/js/main.js"></script>
        <script>
                                var slideIndex = 1;
                                showDivs(slideIndex);

                                function plusDivs(n) {
                                    showDivs(slideIndex += n);
                                }

                                function showDivs(n) {
                                    var i;
                                    var x = document.getElementsByClassName("slide-img");
                                    if (n > x.length) {
                                        slideIndex = 1;
                                    }
                                    if (n < 1) {
                                        slideIndex = x.length;
                                    }
                                    for (i = 0; i < x.length; i++) {
                                        x[i].style.display = "none";
                                    }
                                    x[slideIndex - 1].style.display = "block";
                                }
        </script>
    </body>
</html>

