
package com.flybeyond.controller;

import com.flybeyond.dao.ContactDAO;
import com.flybeyond.model.ContactMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    private final ContactDAO contactDAO = new ContactDAO();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (name == null || email == null || message == null ||
            name.trim().isEmpty() ||
            email.trim().isEmpty() ||
            message.trim().isEmpty()) {

            response.sendRedirect("contact.jsp?error=empty");
            return;
        }

        ContactMessage contact = new ContactMessage();

        contact.setName(name.trim());
        contact.setEmail(email.trim());
        contact.setSubject(subject);
        contact.setMessage(message.trim());

        if (contactDAO.saveMessage(contact)) {
            response.sendRedirect("contact.jsp?success=sent");
        } else {
            response.sendRedirect("contact.jsp?error=failed");
        }
    }
}
