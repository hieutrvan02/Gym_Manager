/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.Account;
import Model.AccountList;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String isAdmin = request.getParameter("admin");
        String type;
        AccountList accountList = new AccountList();
        if (isAdmin != null) {
            type = "admin";
        } else {
            type = "user";
        }
        ArrayList<Account> accounts = accountList.getAccountArrayList(userName, password, type);
        if (!accounts.isEmpty()) {
            String accID = accounts.get(0).getId();
            HttpSession session = request.getSession();
            session.setAttribute("accID", accID);
            Cookie u = new Cookie("userC", userName);
            u.setMaxAge(60*30);
            Cookie typeCookie = new Cookie("type", type);
            typeCookie.setMaxAge(60*30);
            if (remember != null) {
                Cookie r = new Cookie("remember", accID);
                r.setMaxAge(60*30);
                response.addCookie(r);
            }
            response.addCookie(typeCookie);
            response.addCookie(u);
            response.sendRedirect("home.jsp?id=" + accID);
        } else {
            request.setAttribute("mess", "Wrong username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
