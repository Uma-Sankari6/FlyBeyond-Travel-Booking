
package com.flybeyond.controller;

import com.flybeyond.dao.BookingDAO;
import com.flybeyond.model.User;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private BookingDAO bookingDAO;

    @Override
    public void init() {
        bookingDAO = new BookingDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        User user = session == null
                ? null
                : (User) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int destinationId = Integer.parseInt(
                    request.getParameter("destinationId"));

            int numberOfPersons = Integer.parseInt(
                    request.getParameter("numberOfPersons"));

            LocalDate travelDate = LocalDate.parse(
                    request.getParameter("travelDate"));

            String specialRequests =
                    request.getParameter("specialRequests");

            if (numberOfPersons < 1 || numberOfPersons > 20 ||
                    !travelDate.isAfter(LocalDate.now())) {
                response.sendRedirect("booking.jsp?error=1");
                return;
            }

            boolean saved = bookingDAO.createBooking(
                    user.getId(),
                    destinationId,
                    Date.valueOf(travelDate),
                    numberOfPersons,
                    specialRequests
            );

            if (saved) {
                response.sendRedirect("my-bookings.jsp");
            } else {
                response.sendRedirect("booking.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=1");
        }
    }
}
