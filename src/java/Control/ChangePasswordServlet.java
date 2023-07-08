/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Model.Account;
import Model.AccountList;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        String newPassword = request.getParameter("new-password");
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("accID");
        AccountList accList = new AccountList();
        String passwordR = accList.getAccountByID(id);
        if (!passwordR.equals(password)) {
            request.setAttribute("mess", "Password is not true");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        } else {
            accList.changePassword(id, newPassword);
            request.setAttribute("mess", "Password was successfully changed");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }

}
