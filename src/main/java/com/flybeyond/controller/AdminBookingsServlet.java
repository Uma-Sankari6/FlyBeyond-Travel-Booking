
package com.flybeyond.controller;

import com.flybeyond.dao.AdminBookingDAO;
import com.flybeyond.model.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin-bookings")
public class AdminBookingsServlet extends HttpServlet {

    private final AdminBookingDAO adminBookingDAO =
            new AdminBookingDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("loggedInAdmin") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        List<Booking> bookings =
                adminBookingDAO.getAllBookings();

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("/admin-bookings.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("loggedInAdmin") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            int bookingId = Integer.parseInt(
                    request.getParameter("bookingId"));

            String status = request.getParameter("status");

            if (!"Pending".equals(status) &&
                !"Confirmed".equals(status) &&
                !"Cancelled".equals(status)) {

                response.sendRedirect("admin-bookings?error=invalid");
                return;
            }

            adminBookingDAO.updateBookingStatus(bookingId, status);

            response.sendRedirect("admin-bookings?success=updated");

        } catch (Exception e) {
            response.sendRedirect("admin-bookings?error=failed");
        }
    }
}
