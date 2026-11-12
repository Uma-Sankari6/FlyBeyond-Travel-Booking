
package com.flybeyond.controller;

import com.flybeyond.dao.UserDAO;
import com.flybeyond.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("========== LOGIN DEBUG ==========");
        System.out.println("Login request received");

        if (email == null || password == null ||
                email.trim().isEmpty() || password.isEmpty()) {

            System.out.println("LOGIN RESULT: EMPTY DETAILS");
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        email = email.trim();

        System.out.println("LOGIN EMAIL: " + email);

        User user = userDAO.loginUser(email, password);

        if (user != null) {

            System.out.println("LOGIN RESULT: SUCCESS");

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user);

            response.sendRedirect("dashboard.jsp");

        } else {

            System.out.println("LOGIN RESULT: FAILED");

            response.sendRedirect("login.jsp?error=invalid");
        }

        System.out.println("=================================");
    }
}
