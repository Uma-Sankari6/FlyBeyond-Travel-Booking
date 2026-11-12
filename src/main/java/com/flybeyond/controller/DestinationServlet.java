
package com.flybeyond.controller;

import com.flybeyond.dao.DestinationDAO;
import com.flybeyond.model.Destination;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/destinations")
public class DestinationServlet extends HttpServlet {

    private final DestinationDAO destinationDAO = new DestinationDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Destination> destinations =
                destinationDAO.getAllDestinations();

        request.setAttribute("destinations", destinations);

        request.getRequestDispatcher("/destinations.jsp")
               .forward(request, response);
    }
}
